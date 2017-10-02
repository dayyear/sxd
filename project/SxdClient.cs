using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace 神仙道
{
    public class SxdClient
    {
        // Socket
        private Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

        // 状态
        private short previousModule;
        private short previousAction;
        private bool isConnected;
        private readonly ManualResetEvent done = new ManualResetEvent(false);
        private readonly ManualResetEvent receiveDone = new ManualResetEvent(false);

        // 用于Receive Callback
        readonly byte[] bufferRcvd = new byte[256];
        readonly List<byte> bytesRcvd = new List<byte>();


        // 玩家信息
        public int playerId;           // Get from Mod_Player_Base.login(0, 0), used in Mod_Player_Base.player_info_contrast(0,48)
        private int townMapId;


        // 用于仙界登录
        public string serverHostST;
        public int portST;
        public string serverName;      // Get from Mod_StcLogin_Base.get_login_info(96,0)
        public string nickName;        // Get from Mod_Player_Base.get_player_info(0,2)
        public int serverTime;
        public string passCode;        // Get from Mod_StcLogin_Base.get_login_info(96,0)




        //private Thread receiveThread;

        private readonly List<int> functionList = new List<int>();

        /// <summary>
        /// Mod_Player_Base.login(0,0)
        /// module:0, action:0
        /// request:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil]
        /// Line 41 in LoginView.as:
        ///   _data.call(Mod_Player_Base.login, this.loginCallback, [playerName, hashCode, time, URI.sourceUrl, URI.regdate, strIdCard, URI.openTime, URI.isNewSt, URI.stageName, URI.client]);
        /// </summary>
        public void Login(string url, string code, string time, string hash, string time1, string hash1)
        {
            // -----------------------------------------------------------------------------
            // 1. 通过HTTP获取参数
            // -----------------------------------------------------------------------------
            var cookie = string.Format("user={0};_time={1};_hash={2};login_time_sxd_xxxxxxxx={3};login_hash_sxd_xxxxxxxx={4}", code, time, hash, time1, hash1);
            var responseString = Get(url, cookie);
            var match1 = Regex.Match(responseString, @"""&player_name=(.*)""[\s\S]*""&hash_code=(.*)""[\s\S]*""&time=(.*)""[\s\S]*""&ip=(.*)""[\s\S]*""&port=(.*)""[\s\S]*""&server_id=(.*)""[\s\S]*""&source=(.*)""[\s\S]*""&regdate=(.*)""[\s\S]*""&id_card=(.*)""[\s\S]*""&open_time=(.*)""[\s\S]*""&is_newst=(.*)""[\s\S]*""&stage=(.*)""[\s\S]*""&client=(.*)""");
            if (!match1.Success)
                throw new Exception("登录失败，请使用登录器重新登录");
            var player_name = match1.Groups[1].Value;   // 用于login(0,0) 
            var hash_code = match1.Groups[2].Value;     // 用于login(0,0)
            var time2 = match1.Groups[3].Value;         // 用于login(0,0)
            var serverHost = match1.Groups[4].Value;    // 用于socket.Connect()
            var port = match1.Groups[5].Value;          // 用于socket.Connect()
            var source = match1.Groups[7].Value;        // 用于login(0,0)
            var regdate = match1.Groups[8].Value;       // 用于login(0,0)
            var id_card = match1.Groups[9].Value;       // 用于login(0,0)
            var open_time = match1.Groups[10].Value;    // 用于login(0,0)
            var is_newst = match1.Groups[11].Value;     // 用于login(0,0)
            var stage = match1.Groups[12].Value;        // 用于login(0,0)
            var client = match1.Groups[13].Value;       // 用于login(0,0)

            // -----------------------------------------------------------------------------
            // 2. 建立链接
            // -----------------------------------------------------------------------------
            if (isConnected)
            {
                // Shutdown掉socket
                socket.Shutdown(SocketShutdown.Send);
                // 等待Receive线程结束
                //receiveThread.Join();
                receiveDone.WaitOne();
                // 关闭socket并重新开
                socket.Close();
                socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            }
            isConnected = false;
            socket.Connect(new IPEndPoint(Dns.GetHostEntry(serverHost).AddressList[0], int.Parse(port)));
            isConnected = true;

            // -----------------------------------------------------------------------------
            // 3. 接收数据
            // -----------------------------------------------------------------------------
            // 3.1 接收数据线程，参考Receive方法
            //receiveThread = new Thread(Receive);
            //receiveThread.Start();

            // 3.2 异步I/O接收数据，参考ReceiveCallback方法
            receiveDone.Reset();
            socket.BeginReceive(bufferRcvd, 0, bufferRcvd.Length, SocketFlags.None, ReceiveCallback, null);

            // -----------------------------------------------------------------------------
            // 4. 发送数据
            // -----------------------------------------------------------------------------
            done.Reset();
            Send(new JArray { player_name, hash_code, time2, source, int.Parse(regdate), id_card, int.Parse(open_time), byte.Parse(is_newst), HttpUtility.UrlDecode(stage), HttpUtility.UrlDecode(client) }, 0, 0);
            done.WaitOne();
        }//Login

        /// <summary>
        /// Mod_Player_Base.login(0,0)
        /// module:0, action:0
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil]
        /// Line 202-216 in PlayerData.as:
        /// public function login(param1:Array) : void
        /// {
        ///     this.logined = param1[0];
        ///     this.playerId = param1[1];
        ///     this.playerInfo.id = this.playerId;
        ///     this.enableTime = param1[3] || 0;
        ///     this.enableTime = DateTime.formatServerTimeNull(this.enableTime);
        ///     this.enableType = param1[4] || 0;
        ///     PlayerInfo.bAllActivity = param1[5] == 0;
        ///     this.isOpenMusic = param1[6] == 1;
        ///     WarType.WarEffectShowType = param1[7];
        ///     this.uiSetValue = param1[8];
        ///     return;
        /// }// end function
        /// </summary>
        private void LoginCallback(JArray data)
        {
            var logined = (byte)data[0];
            if (logined != 0)
                throw new Exception("登录失败");
            playerId = (int)data[1];
            Logger.Log(string.Format("登录成功, 玩家ID: {0}", playerId), ConsoleColor.Green);
            done.Set();
        }//LoginCallback

        /// <summary>
        /// Mod_Player_Base.get_player_info(0,2)
        /// module:0, action:2
        /// request:[]
        /// </summary>
        public void GetPlayerInfo()
        {
            done.Reset();
            Send(null, 0, 2);
            done.WaitOne();
        }//GetPlayerInfo

        /// <summary>
        /// Mod_Player_Base.get_player_info(0,2)
        /// module:0, action:2
        /// response:[0.Utils.StringUtil, 1.Utils.IntUtil, 2.Utils.IntUtil, 3.Utils.LongUtil, 4.Utils.IntUtil, 5.Utils.IntUtil, 6.Utils.IntUtil, 7.Utils.LongUtil, 8.Utils.LongUtil, 9.Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]
        /// Line 786 in PlayerData.as:
        ///   oObject.list(param1, this, [0."nickname", 1."level", 2."ingot", 3."coins", 4."health", 5."maxHealth", 6."power", 7."experience", 8."maxExperience", 9."townMapId", "bossMapId", "jihuisuoId", "mounts", "mountsCD", "vipLevel", "avatar", "avatarCD", "mainPlayerRoleId", "mainRoleId", "campId", "townKey", "fame", "fameLevel", "extraPower", "maxExtraPower", "netBarPower", "maxNetBarPower", "tester", "lastPlayVersion", "missionKey", "startAccount", "stLevel", "daoYuan", "exploit", "isHaveTangYuan"]);
        /// </summary>
        private void GetPlayerInfoCallback(JArray data)
        {
            nickName = (string)data[0];
            var level = (int)data[1];
            var ingot = (int)data[2];
            var coins = (long)data[3];
            var health = (int)data[4];
            var power = (int)data[6];
            var experience = (long)data[7];
            townMapId = (int)data[9];
            Logger.Log(string.Format("昵称：{0}，等级：{1}，元宝：{2}，铜钱：{3}，生命：{4}，体力：{5}，经验值：{6}，城镇ID：{7}", nickName, level, ingot, coins, health, power, experience, townMapId));
            done.Set();
        }//GetPlayerInfoCallback

        /// <summary>
        /// Mod_Player_Base.player_info_contrast(0,48)
        /// module:0, action:48
        /// request:[Utils.IntUtil]
        /// Line 686 in ToolbarView.as:
        ///   _data.call(Mod_Player_Base.player_info_contrast, this.PlayerInfoContrastCallBack, [this._ctrl.player.playerId], false);
        /// </summary>
        public void PlayerInfoContrast()
        {
            done.Reset();
            Send(new JArray { playerId }, 0, 48);
            done.WaitOne();
        }//PlayerInfoContrast

        /// <summary>
        /// Mod_Player_Base.player_info_contrast(0,48)
        /// module:0, action:48
        /// response:[[0.Utils.IntUtil,1. Utils.IntUtil, 2.Utils.StringUtil, 3.Utils.IntUtil, 4.Utils.IntUtil, 5.Utils.IntUtil, 6.Utils.IntUtil, 7.Utils.IntUtil, 8.Utils.IntUtil, 9.Utils.IntUtil, 10.Utils.IntUtil]]
        /// Line 401-422 in PlayerData.as:
        ///   public function player_info_contrast(param1:Array) : void
        ///   {
        ///       var _loc_2:* = param1[0][0];
        ///       var _loc_3:* = {};
        ///       _loc_3.playerId = _loc_2[0];               // playerId
        ///       _loc_3.rankIng = _loc_2[1];                // 竞技
        ///       _loc_3.factionName  = _loc_2[2];           // 帮派
        ///       _loc_3.combat = _loc_2[3];                 // 战力
        ///       _loc_3.fame = _loc_2[4];                   // 声望
        ///       _loc_3.skill = _loc_2[5];                  // 阅历
        ///       _loc_3.achievmentPoints = _loc_2[6];       // 成就
        ///       _loc_3.firstAttack = _loc_2[7];            // 先攻
        ///       _loc_3.statePoint = _loc_2[8];             // 境界
        ///       _loc_3.flowerCount = _loc_2[9];            // 鲜花
        ///       _loc_3.xianLing = _loc_2[10];              // 仙令
        ///       if (_loc_3.playerId == this.playerInfo.id)
        ///       {
        ///           this.playerInfo.practiceWar = _loc_3.combat;
        ///       }
        ///       this.playerInfoContrastData = _loc_3;
        ///       return;
        /// </summary>
        private void PlayerInfoContrastCallback(JArray data)
        {
            var rankIng = (int)data[0][0][1];
            var factionName = (string)data[0][0][2];
            var combat = (int)data[0][0][3];
            var fame = (int)data[0][0][4];
            var skill = (int)data[0][0][5];
            var achievmentPoints = (int)data[0][0][6];
            var firstAttack = (int)data[0][0][7];
            var statePoint = (int)data[0][0][8];
            var flowerCount = (int)data[0][0][9];
            var xianLing = (int)data[0][0][10];
            Logger.Log(string.Format("竞技：{0}，帮派：{1}，战力：{2}，声望：{3}，阅历：{4}，成就：{5}，先攻：{6}，境界：{7}，鲜花：{8}，仙令：{9}", rankIng, factionName, combat, fame, skill, achievmentPoints, firstAttack, statePoint, flowerCount, xianLing));
            done.Set();
        }//PlayerInfoContrastCallback

        /// <summary>
        /// Mod_Town_Base.enter_town(1,0)
        /// module:1, action:0
        /// request:[Utils.IntUtil]
        /// Line 971 in MapViewBase.as:
        ///   _data.call(Mod_Town_Base.enter_town, this.enter_town_back, [this._id], true, this._socketType);
        /// </summary>
        public void EnterTown()
        {
            done.Reset();
            Send(new JArray { townMapId }, 1, 0);
            done.WaitOne();
        }//EnterTown

        /// <summary>
        /// Mod_Town_Base.enter_town(1,0)
        /// module:1, action:0
        /// response:[Utils.UByteUtil, 1.Utils.IntUtil, 2.Utils.IntUtil, 3.Utils.IntUtil, 4.[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], 5.Utils.StringUtil, 6.Utils.ShortUtil, 7.Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil], Utils.UByteUtil, [Utils.IntUtil], Utils.UByteUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil, Utils.StringUtil, Utils.IntUtil]
        /// Line 60 in TownData.as:
        ///   oObject.list(param1, _loc_3, [1."player_id", 2."role_id", 3."follow_role_id", 4."follow_pet_list", 5."nickname", 6."position_x", 7."position_y", "transport", "avatar", "camp_id", "equip_item_id", "warState", "practice_status", "is_on_mission_practice", "faction_id", "faction_name", "is_star", "is_world_war_top", "player_pet_animal_lv", "player_pet_animal_stage", "world_faction_war_award", "playable_video_list", "hidden_town_npc_flag", "show_town_npc_list", "is_become_immortal", "suit_equip_id", "is_become_saint", "mount_rune_type_id", "mount_rune_is_show", "card_spirit_id", "card_spirit_nickname", "orange_equipment_follow_id", "children_role_id", "children_nickname", "children_suit_id"]);
        /// </summary>
        private void EnterTownCallback(JArray data)
        {
            Logger.Log(string.Format("进入{0}，坐标X：{1}，坐标Y：{2}", Protocols.GetTownName(townMapId), (short)data[6], (short)data[7]));
            done.Set();
        }//EnterTownCallback

        /// <summary>
        /// Mod_StcLogin_Base.get_status(96,1)
        /// module:96, action:1
        /// request:[]
        /// </summary>
        public void GetStatus()
        {
            done.Reset();
            Send(null, 96, 1);
            done.WaitOne();
        }//GetStatus

        /// <summary>
        /// Mod_StcLogin_Base.get_status(96,1)
        /// module:96, action:1
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]
        /// Line 38 in StcLoginData.as:
        ///   oObject.list(param1, this.stcStatusObj, ["status", "close_time_list"]);
        /// </summary>
        /// [0,[[1505527200,1505534400,4]]]
        private void GetStatusCallback(JArray data)
        {
            var status = (int)data[0];
            //var close_time_list = (JArray)data[1];

            Logger.Log(string.Format("仙界入口状态：{0}", status == 0 ? "开启" : status.ToString()));
            /*foreach (var item in close_time_list)
            {
                Logger.Log(string.Format("关闭时间1：{0}", TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1)).AddSeconds((int)item[0]).ToString("yyyy-MM-dd HH:mm:ss")));
                Logger.Log(string.Format("关闭时间2：{0}", TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1)).AddSeconds((int)item[1]).ToString("yyyy-MM-dd HH:mm:ss")));
                Logger.Log(string.Format("关闭时间3：{0}", item[2]));
            }*/
            done.Set();
        }//GetStatusCallback

        /// <summary>
        /// Mod_StcLogin_Base.get_login_info(96,0)
        /// module:96, action:0
        /// request:[]
        /// </summary>
        public void GetLoginInfo()
        {
            done.Reset();
            Send(null, 96, 0);
            done.WaitOne();
        }//GetLoginInfo

        /// <summary>
        /// Mod_StcLogin_Base.get_login_info(96,0)
        /// module:96, action:0
        /// response:[0.Utils.StringUtil, 1.Utils.ShortUtil, 2.Utils.StringUtil, 3.Utils.IntUtil, 4.Utils.StringUtil, 5.Utils.StringUtil]
        /// Line 22-34 in StcLoginData.as:
        ///   public function get_login_info(param1:Array) : void
        ///   {
        ///       this.stcLoginObj = new Object();
        ///       var _loc_2:* = 0;
        ///       this.stcLoginObj.serverHost = param1[_loc_2++];
        ///       this.stcLoginObj.port = param1[_loc_2++];
        ///       this.stcLoginObj.serverName = param1[_loc_2++];
        ///       this.stcLoginObj.time = param1[_loc_2++];
        ///       this.stcLoginObj.passCode = param1[_loc_2++];
        ///       this.stcLoginObj.serverTownName = param1[_loc_2++];
        ///       this.stcLoginObj.playerId = 32;
        ///       return;
        ///   }// end function
        /// </summary>
        private void GetLoginInfoCallback(JArray data)
        {
            serverHostST = (string)data[0];
            portST = (short)data[1];
            serverName = (string)data[2];
            serverTime = (int)data[3];
            passCode = (string)data[4];
            Logger.Log(string.Format("仙界服务器地址：{0}:{1}，服务器名称：{2}，服务器时间：{3}", serverHostST, portST, serverName, TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1)).AddSeconds(serverTime).ToString("yyyy-MM-dd HH:mm:ss")));
            done.Set();
        }//GetLoginInfoCallback

        /// <summary>
        /// Mod_Player_Base.get_player_function(0,6)
        /// module:0, action:6
        /// request:[]
        /// </summary>
        public void GetPlayerFunction()
        {
            done.Reset();
            Send(null, 0, 6);
            done.WaitOne();
        }//GetPlayerFunction

        /// <summary>
        /// Mod_Player_Base.get_player_function(0,6)
        /// module:0, action:6
        /// response:[[Utils.IntUtil, Utils.ByteUtil]]
        /// Line 1155-1169 in PlayerData.as:
        ///   private function format_get_player_function(param1:Array) : Array
        ///   {
        ///       var _loc_3:* = null;
        ///       var _loc_4:* = null;
        ///       param1 = param1[0];
        ///       var _loc_2:* = [];
        ///       for (_loc_3 in param1)
        ///       {
        ///           
        ///           _loc_4 = {};
        ///           oObject.list(param1[_loc_3], _loc_4, ["id", "isPlayed"]);
        ///           _loc_2.push(_loc_4);
        ///       }
        ///       return _loc_2;
        ///   }// end function
        /// id can be found in Mod.as
        /// </summary>
        private void GetPlayerFunctionCallback(JArray data)
        {
            functionList.Clear();
            functionList.AddRange(data[0].Select(x => (int)x[0]));
            Logger.Log(string.Format("玩家共开通{1}项功能：{0}", string.Join(",", functionList.Select(x => string.Format("{0}({1})", Protocols.GetFunctionName(x), x))), data[0].Count()));
            done.Set();
        }//GetPlayerFunctionCallback

        /// <summary>
        /// Mod_GetPeach_Base.peach_info(40,3)
        /// module:40, action:3
        /// request:[]
        /// </summary>
        public void PeachInfo()
        {
            const int id = 56;
            if (functionList.Contains(id))
            {
                done.Reset();
                Send(null, 40, 3);
                done.WaitOne();
            }
            else
                Logger.Log(string.Format("未开通{0}功能", Protocols.GetFunctionName(id)), ConsoleColor.Red);
        }//PeachInfo

        /// <summary>
        /// Mod_GetPeach_Base.peach_info(40,3)
        /// module:40, action:3
        /// response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]
        /// [19,5,1,0]
        /// Line 34,36,45-47 in GetPeachController.as:
        ///   _loc_2.peachLv = _loc_1[0];
        ///   _loc_2.fruitLv = 70 + _loc_2.peachLv * 5;
        ///   _loc_2.peachNum = _loc_1[1];
        ///   _loc_2.bAllGet = _loc_1[2] == 1;
        ///   _loc_2.bCallPeach = _loc_1[3] == 1;
        /// </summary>
        private void PeachInfoCallback(JArray data)
        {
            var fruitLv = 70 + (byte)data[0] * 5;
            var peachNum = (byte)data[1];
            //var bAllGet = (byte)data[2] == 1;
            //var bCallPeach = (byte)data[3] == 1;
            Logger.Log(string.Format("还剩{1}个{0}级仙桃", fruitLv, peachNum));
            done.Set();
        }//PeachInfoCallback

        /// <summary>
        /// Mod_GetPeach_Base.batch_get_peach(40,5)
        /// module:40, action:5
        /// request:[]
        /// </summary>
        public void BatchGetPeach()
        {
            const int id = 56;
            if (functionList.Contains(id))
            {
                done.Reset();
                Send(null, 40, 5);
                done.WaitOne();
            }
            else
                Logger.Log(string.Format("未开通{0}功能", Protocols.GetFunctionName(id)), ConsoleColor.Red);
        }//BatchGetPeach

        /// <summary>
        /// Mod_GetPeach_Base.batch_get_peach(40,5)
        /// module:40, action:5
        /// response:[Utils.UByteUtil, Utils.LongUtil]
        /// 
        /// Line 69-74 in GetPeachData.as:
        ///   public function batch_get_peach(param1:Array) : void
        ///   {
        ///       this.batchGetPeachResult = param1[0];
        ///       this.warExp = param1[1];
        ///       return;
        ///   }// end function
        /// </summary>
        private void BatchGetPeachCallback(JArray data)
        {
            var batchGetPeachResult = (byte)data[0];
            var warExp = (long)data[1];
            if (batchGetPeachResult == 0)
                Logger.Log(string.Format("一键摘桃成功，摘取经验值：{0}", warExp));
            else
                Logger.Log("一键摘桃失败", ConsoleColor.Red);
            done.Set();
        }//BatchGetPeachCallback

        private void Send(JArray data, short module, short action)
        {
            // -----------------------------------------------------------------------------
            // 1. 构造命令字节
            // -----------------------------------------------------------------------------
            var bytes = new List<byte>();

            // 1.1 添加module和action
            bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder(module)));
            bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder(action)));

            // 1.2 添加实体
            bytes.AddRange(Protocols.Encode(data, Protocols.GetPattern(module, action).Item2));

            // 1.3 在尾部添加上次的module和action
            if (module != 0 || action != 0)
            {
                bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder(previousModule)));
                bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder(previousAction)));
            }

            // 1.4 在首部插入命令字节数
            bytes.InsertRange(0, BitConverter.GetBytes(IPAddress.HostToNetworkOrder(bytes.Count)));

            // 2. 发送数据
            socket.Send(bytes.ToArray());

            // -----------------------------------------------------------------------------
            // E. 留存module和action
            // -----------------------------------------------------------------------------
            previousModule = module;
            previousAction = action;
        }//Send

        /// <summary>
        /// Mod_Chat_Base.chat_with_players(6,0)
        /// module:6, action:0
        /// request:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]
        /// Line 118 in ChatView.as
        ///   _data.call(Mod_Chat_Base.chat_with_players, callBack, [data.messageType, data.message, data.eipNum, data.eipIndex]);
        /// </summary>
        public void ChatWithPlayers(string message)
        {
            var messageType = 1;
            var eipNum = string.Empty;
            var eipIndex = string.Empty;
            done.Reset();
            Send(new JArray { messageType, message, eipNum, eipIndex }, 6, 0);
            done.WaitOne();
        }//ChatWithPlayers

        /// <summary>
        /// Mod_Chat_Base.bro_to_players(6,1)
        /// module:6, action:1
        /// response:[[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil]]
        /// Line 36 in ChatController.as
        ///   oObject.list(_loc_1[_loc_5], _loc_2[_loc_5], ["playId", "playName", "isTester", "isStar", "msgType", "msgTxt", "eipNum", "eipIndex", "roleId", "townKey", "serverName", "stageName", "isNetBar"]);
        /// </summary>
        private void BroToPlayersCallback(JArray data)
        {
            foreach (var item in data[0])
            {
                var playName = (string)item[1];
                var msgTxt = (string)item[5];
                Logger.Log(string.Format("{0}说: {1}", playName, msgTxt));
            }
            done.Set();
        }//BroToPlayersCallback

        private void ProcessPackage(byte[] package)
        {
            using (var ms = new MemoryStream(package, false))
            using (var br = new BinaryReader(ms))
            {
                var module = IPAddress.NetworkToHostOrder(br.ReadInt16());
                if (module == 0x789C)
                {
                    Logger.Log("  uncompress...", console: false);
                    ProcessPackage(Ionic.Zlib.ZlibStream.UncompressBuffer(package.ToArray()));
                    return;
                }
                var action = IPAddress.NetworkToHostOrder(br.ReadInt16());
                var tuple = Protocols.GetPattern(module, action);
                var data = Protocols.Decode(br.BaseStream, tuple.Item3);
                var method = tuple.Item1;

                switch (method)
                {
                    case "login":
                        LoginCallback(data);
                        break;
                    case "get_player_info":
                        GetPlayerInfoCallback(data);
                        break;
                    case "player_info_contrast":
                        PlayerInfoContrastCallback(data);
                        break;
                    case "enter_town":
                        EnterTownCallback(data);
                        break;
                    case "get_status":
                        GetStatusCallback(data);
                        break;
                    case "get_login_info":
                        GetLoginInfoCallback(data);
                        break;
                    case "get_player_function":
                        GetPlayerFunctionCallback(data);
                        break;
                    case "peach_info":
                        PeachInfoCallback(data);
                        break;
                    case "batch_get_peach":
                        BatchGetPeachCallback(data);
                        break;
                    case "bro_to_players":
                        BroToPlayersCallback(data);
                        break;
                    default:
                        return;
                }

                Logger.Log(string.Format("　package: {0}", BytesToString(package)), console: false);
                Logger.Log(string.Format("　method: {0}({1},{2})", method, module, action), console: false);
                Logger.Log(string.Format("　data: {0}", data.ToString(Formatting.None)), console: false);
            }//br, ms
        }//ProcessPackage

        /// <summary>
        /// 接收数据（异步I/O）
        /// </summary>
        private void ReceiveCallback(IAsyncResult ar)
        {
            try
            {
                var bytesRead = socket.EndReceive(ar);
                if (bytesRead == 0)
                {
                    Logger.Log("已断开游戏服务器", ConsoleColor.Red);
                    receiveDone.Set();
                    return;
                }
                bytesRcvd.AddRange(bufferRcvd.ToList().GetRange(0, bytesRead));
                while (bytesRcvd.Count > 4)
                {
                    var length = IPAddress.NetworkToHostOrder(BitConverter.ToInt32(bytesRcvd.ToArray(), 0));
                    // 当接收数据不完整时，等待下次接收数据
                    if (bytesRcvd.Count < 4 + length)
                        break;
                    var package = bytesRcvd.GetRange(4, length);
                    bytesRcvd.RemoveRange(0, 4 + length);
                    ProcessPackage(package.ToArray());
                }//while (bytes.Count > 4)
                socket.BeginReceive(bufferRcvd, 0, bufferRcvd.Length, SocketFlags.None, ReceiveCallback, null);
            }//try
            catch (SocketException se)
            {
                Logger.Log(string.Format("发现错误：{0}，错误代码：{1}", se.ToString(), se.ErrorCode), ConsoleColor.Red);
                receiveDone.Set();
            }
            catch (Exception ex)
            {
                Logger.Log(string.Format("发现错误：{0}", ex.ToString()), ConsoleColor.Red);
                receiveDone.Set();
            }
        }//ReceiveCallback

        /// <summary>
        /// 接收数据（线程）
        /// </summary>
        private void Receive()
        {
            var buffer = new byte[256];
            var bytes = new List<byte>();

            try
            {
                while (true)
                {
                    if (!socket.Poll(5000000, SelectMode.SelectRead))
                        continue;
                    if (socket.Available == 0)
                        throw new Exception("已断开游戏服务器");

                    var bytesRead = socket.Receive(buffer, 0, buffer.Length, SocketFlags.None);
                    bytes.AddRange(buffer.ToList().GetRange(0, bytesRead));
                    while (bytes.Count > 4)
                    {
                        var length = IPAddress.NetworkToHostOrder(BitConverter.ToInt32(bytes.ToArray(), 0));
                        // 当接收数据不完整时，等待下次接收数据
                        if (bytes.Count < 4 + length)
                            break;
                        var package = bytes.GetRange(4, length);
                        bytes.RemoveRange(0, 4 + length);
                        ProcessPackage(package.ToArray());
                    }//while (bytes.Count > 4)
                }//while (true)
            }//try
            catch (SocketException se)
            {
                Logger.Log(string.Format("发现错误：{0}，错误代码：{1}", se.Message, se.ErrorCode), ConsoleColor.Red);
            }
            catch (Exception ex)
            {
                Logger.Log(string.Format("发现错误：{0}", ex.Message), ConsoleColor.Red);
            }
        }//Receive


        /*private void ProcessPackage(byte[] package)
{
    while (true)
    {
        var module = ToInt16(package);
        var action = ToInt16(package, 2);

        if (module == 0x789C)
        {
            //UpdateUIDelegate(UpdateType.LogOnlyToFile, "uncompress...");
            package = Ionic.Zlib.ZlibStream.UncompressBuffer(package);
            continue;
        }
        switch ((module << 4) + action)
        {
            #region 登录 Mod_Player_Base.login
            case (0 << 4) + 0:
                {
                    //UpdateUIDelegate(UpdateType.LogBoth, package[4] == 0 ? "登录成功" : "登录失败");
                    playerId = ToInt32(package, 5);
                    //UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("playerId: {0}", playerId));

                    loginSuccess = package[4] == 0;
                    loginDone.Set();
                }
                break;
            #endregion

            #region 获取玩家信息 Mod_Player_Base.get_player_info
            case (0 << 4) + 2:
                {
                    var index = 4;
                    var count = ToInt16(package, index);
                    nickName = Encoding.UTF8.GetString(package, index + 2, count);
                    //UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("nickName: {0}", nickName));
                    //UpdateUIDelegate(UpdateType.Nickname, nickName);
                    index += 2 + count;
                    var level = ToInt32(package, index).ToString();
                    //UpdateUIDelegate(UpdateType.Level, level);
                    index += 4;
                    var ingot = ToInt32(package, index).ToString();
                    //UpdateUIDelegate(UpdateType.Ingot, ingot);
                    index += 4;
                    var coins = ToInt64(package, index).ToString();
                    //UpdateUIDelegate(UpdateType.Coins, coins);
                    index += 8;
                    var health = ToInt32(package, index).ToString();
                    //UpdateUIDelegate(UpdateType.Health, health);
                    index += 8;
                    var power = ToInt32(package, index).ToString();
                    //UpdateUIDelegate(UpdateType.Power, power);
                    index += 4;
                    var experience = ToInt64(package, index).ToString();
                    //UpdateUIDelegate(UpdateType.Experience, experience);
                    //index += 8;
                    //var maxExperience = ToInt64(package, index).ToString();
                    //UpdateUIDelegate(UpdateType.LogBoth, string.Format("昵称：{0}，等级{1}：元宝：{2}，铜钱：{3}，生命：{4}，体力：{5}，经验值：{6}", nickName, level, ingot, coins, health, power, experience));

                    getPlayerInfoSuccess = true;
                    getPlayerInfoDone.Set();
                }
                break;
            #endregion

            #region 更新玩家信息 update_player_data
            case (0 << 4) + 3:
                // PLAYER_EXPERIENCE:int = 20; 更新经验值
                //if (ToInt16(package, 4) == 1 && package[6] == 20)
                //UpdateUIDelegate(UpdateType.Experience, ToInt64(package, 7).ToString());
                return;
            #endregion

            #region 领取俸禄 get_player_camp_salary
            case (0 << 4) + 20:
                //UpdateUIDelegate(UpdateType.LogBoth, package[4] == 0x57 ? string.Format("成功领取俸禄: {0}", ToInt32(package, 5)) : "领取俸禄失败");
                break;
            #endregion

            #region 领取仙令 player_get_xian_ling_gift
            case (13 << 4) + 20:
                //UpdateUIDelegate(UpdateType.LogBoth, package[4] == 0x8 ? string.Format("成功领取仙令: {0}", package[5]) : "领取仙令失败");
                break;
            #endregion

            #region 领取灵石 get_day_stone
            case (34 << 4) + 18:
                //UpdateUIDelegate(UpdateType.LogBoth, package[4] == 0x1 ? string.Format("成功领取灵石: {0}", ToInt32(package, 5)) : "领取灵石失败");
                break;
            #endregion

            #region 世界聊天 bro_to_players
            case (6 << 4) + 1:
                {
                    var index1 = 10;
                    var count1 = ToInt16(package, index1);
                    var index2 = index1 + 2 + count1 + 3;
                    var count2 = ToInt16(package, index2);
                    //UpdateUIDelegate(UpdateType.LogBoth, string.Format("{0}说: {1}", Encoding.UTF8.GetString(package, index1 + 2, count1), Encoding.UTF8.GetString(package, index2 + 2, count2)));
                    break;
                }
            #endregion

            #region 登录仙界 Mod_StLogin_Base.login
            case (94 << 4) + 0:
                {
                    //UpdateUIDelegate(UpdateType.LogBoth, package[4] == 0x0 ? "仙界登录成功" : "仙界登录失败");

                    stLoginSuccess = package[4] == 0x0;
                    stLoginDone.Set();
                }
                break;
            #endregion

            #region 获取仙界登录信息 Mod_StcLogin_Base.get_login_info
            case (96 << 4) + 0:
                {
                    var index = 4;
                    var count = ToInt16(package, index);
                    serverHostST = Encoding.UTF8.GetString(package, index + 2, count);
                    //UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("serverHostST: {0}", serverHostST));
                    index += 2 + count;
                    portST = ToInt16(package, index);
                    //UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("portST: {0}", portST));
                    index += 2;
                    count = ToInt16(package, index);
                    index += 2 + count;
                    serverTime = ToInt32(package, index);
                    //UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("serverTime: {0}", serverTime));
                    index += 4;
                    count = ToInt16(package, index);
                    passCode = Encoding.UTF8.GetString(package, index + 2, count);
                    //UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("passCode: {0}", passCode));

                    getLoginInfoSuccess = true;
                    getLoginInfoDone.Set();
                    break;
                }
            #endregion

            default:
                // 未知协议则直接返回，接收数据包不做记录
                return;
        } //switch

        var sb = new StringBuilder();
        foreach (var b in package)
            sb.AppendFormat("{0} ", b.ToString("X2"));
        sb.Remove(sb.Length - 1, 1);
        //UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("module: {0}, action: {1}, data: [{2}]", module, action, sb));

        break;
    }//while
} //ProcessPackage*/





        /// <summary>
        /// 世界聊天(6, 0)
        /// [1. data.messageType, 2. data.message, 3. data.eipNum, 4. data.eipIndex]
        /// public static const chat_with_players:Object = {
        /// module:6, action:0, 
        /// request:[1. Utils.UByteUtil, 2. Utils.StringUtil, 3. Utils.StringUtil, 4. Utils.StringUtil], 
        /// response:[1. Utils.IntUtil, 2. Utils.UByteUtil]};
        /// </summary>
        /// <param name="message"></param>
        /*public void ChatWithPlayers(string message)
        {
            var sentBytes = new List<byte>();

            // 0. add module and action
            const short module = 6;
            const short action = 0;
            AppendInt16(sentBytes, module);
            AppendInt16(sentBytes, action);

            // 1. add messageType
            byte messageType = 1;
            AppendByte(sentBytes, messageType);

            // 2. add message
            AppendString(sentBytes, message);

            // 3. add eipNum
            var eipNum = string.Empty;
            AppendString(sentBytes, eipNum);

            // 4. add eipIndex
            var eipIndex = string.Empty;
            AppendString(sentBytes, eipIndex);

            // L. last module and action
            AppendInt16(sentBytes, previousModule);
            AppendInt16(sentBytes, previousAction);

            // E. intert hader
            IntertHead(sentBytes);

            socket.Send(sentBytes.ToArray());
            previousModule = module;
            previousAction = action;

        }//ChatWithPlayers*/

        /// <summary>
        /// 领取俸禄(0, 20)
        /// public static const get_player_camp_salary:Object = {
        /// module:0, action:20, 
        /// request:[], 
        /// response:[Utils.UByteUtil, Utils.IntUtil]};
        /// </summary>
        public void GetPlayerCampSalary()
        {
            var sentBytes = new List<byte>();

            // 0. add module and action
            const short module = 0;
            const short action = 20;
            AppendInt16(sentBytes, module);
            AppendInt16(sentBytes, action);

            // L. last module and action
            AppendInt16(sentBytes, previousModule);
            AppendInt16(sentBytes, previousAction);

            // E. intert hader
            IntertHead(sentBytes);

            socket.Send(sentBytes.ToArray());
            previousModule = module;
            previousAction = action;
        }//getDayStone

        /// <summary>
        /// 领取仙令(13, 20)
        /// public static const get_player_camp_salary:Object = {
        /// module:13, action:20, 
        /// request:[], 
        /// response:[Utils.UByteUtil, Utils.UByteUtil]};
        /// </summary>
        public void PlayerGetXianLingGift()
        {
            var sentBytes = new List<byte>();

            // 0. add module and action
            const short module = 13;
            const short action = 20;
            AppendInt16(sentBytes, module);
            AppendInt16(sentBytes, action);

            // L. last module and action
            AppendInt16(sentBytes, previousModule);
            AppendInt16(sentBytes, previousAction);

            // E. intert hader
            IntertHead(sentBytes);

            socket.Send(sentBytes.ToArray());
            previousModule = module;
            previousAction = action;
        }//getDayStone

        /// <summary>
        /// 领取灵石(34, 18)
        /// public static const get_day_stone:Object = {
        /// module:34, action:18, 
        /// request:[Utils.ByteUtil], 
        /// response:[Utils.ByteUtil, Utils.IntUtil]};
        /// </summary>
        public void GetDayStone()
        {
            var sentBytes = new List<byte>();

            // 0. add module and action
            const short module = 34;
            const short action = 18;
            AppendInt16(sentBytes, module);
            AppendInt16(sentBytes, action);

            // 1. add intType
            byte intType = 0;
            AppendByte(sentBytes, intType);

            // L. last module and action
            AppendInt16(sentBytes, previousModule);
            AppendInt16(sentBytes, previousAction);

            // E. intert hader
            IntertHead(sentBytes);

            socket.Send(sentBytes.ToArray());
            previousModule = module;
            previousAction = action;
        }//getDayStone

        #region 工具类小函数

        /// <summary>
        /// Http Get with cookie
        /// </summary>
        /// <param name="url"></param>
        /// <param name="cookie"></param>
        /// <returns></returns>
        private static string Get(string url, string cookie)
        {
            string responseString;
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.Headers.Add("Cookie", cookie);
            request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31";

            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            using (var sr = new StreamReader(stream, Encoding.UTF8))
                responseString = sr.ReadToEnd();
            return responseString;
        }//Get

        /// <summary>
        /// 字节列表转化为可输出的十六进制字符串
        /// </summary>
        private static string BytesToString(IEnumerable<byte> package)
        {
            var sb = new StringBuilder();
            foreach (var b in package)
                sb.AppendFormat("{0} ", b.ToString("X2"));
            sb.Remove(sb.Length - 1, 1);
            return "[" + sb + "]";
        }//BytesToString

        private static void IntertHead(List<byte> byteList)
        {
            var length = byteList.Count;
            byteList.InsertRange(0, new List<byte> { (byte)(length >> 24), (byte)((length & 0xFF0000) >> 16), (byte)((length & 0xFF00) >> 8), (byte)(length & 0xFF) });
        }//IntertHead

        /*private static long Stamp64()
        {
            return Convert.ToInt64((DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0)).TotalMilliseconds);
        }//Stamp

        private static int Stamp32()
        {
            return Convert.ToInt32((DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0)).TotalSeconds);
        }//Stamp*/

        private static void AppendString(List<byte> byteList, string s)
        {
            // 1. get string bytes
            var bytes = Encoding.UTF8.GetBytes(s);

            // 2. append string length(Int16)
            byteList.AddRange(new List<byte> { (byte)((bytes.Length & 0xFF00) >> 8), (byte)(bytes.Length & 0xFF) });

            // 3. append string bytes
            byteList.AddRange(bytes);
        }//AppendString

        private static void AppendInt16(List<byte> byteList, short i)
        {
            byteList.AddRange(new List<byte> { (byte)((i & 0xFF00) >> 8), (byte)(i & 0xFF) });
        }//AppendInt16

        private static void AppendInt32(List<byte> byteList, int i)
        {
            byteList.AddRange(new List<byte> { (byte)(i >> 24), (byte)((i & 0xFF0000) >> 16), (byte)((i & 0xFF00) >> 8), (byte)(i & 0xFF) });
        }//AppendInt32

        private static void AppendByte(List<byte> byteList, byte b)
        {
            byteList.Add(b);
        }//AppendByte

        #endregion




    }//class SxdClient


}//namespace