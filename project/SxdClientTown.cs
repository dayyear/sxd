using System;
using System.Net;
using System.Net.Sockets;
using System.Text.RegularExpressions;
using System.Web;
using Newtonsoft.Json.Linq;

namespace 神仙道
{
    public class SxdClientTown : SxdClient
    {








        //private Thread receiveThread;


        public SxdClientTown()
        {
            ServerName = "游戏服务器";
        }

        // 登录
        /// <summary>
        /// Mod_Player_Base.login(0,0)
        /// module:0, action:0
        /// request:[Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil, Utils.StringUtil, Utils.StringUtil]
        /// Line 41 in LoginView.as:
        ///     _data.call(Mod_Player_Base.login, this.loginCallback, [playerName, hashCode, time, URI.sourceUrl, URI.regdate, strIdCard, URI.openTime, URI.isNewSt, URI.stageName, URI.client]);
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil]
        /// Line 202-216 in PlayerData.as:
        ///     public function login(param1:Array) : void
        ///     {
        ///         this.logined = param1[0];
        ///         this.playerId = param1[1];
        ///         this.playerInfo.id = this.playerId;
        ///         this.enableTime = param1[3] || 0;
        ///         this.enableTime = DateTime.formatServerTimeNull(this.enableTime);
        ///         this.enableType = param1[4] || 0;
        ///         PlayerInfo.bAllActivity = param1[5] == 0;
        ///         this.isOpenMusic = param1[6] == 1;
        ///         WarType.WarEffectShowType = param1[7];
        ///         this.uiSetValue = param1[8];
        ///         return;
        ///     }// end function
        /// </summary>
        public int Login(string url, string code, string time, string hash, string time1, string hash1)
        {
            // -----------------------------------------------------------------------------
            // 1. 通过HTTP获取参数
            // -----------------------------------------------------------------------------
            var cookie = string.Format("user={0};_time={1};_hash={2};login_time_sxd_xxxxxxxx={3};login_hash_sxd_xxxxxxxx={4}", code, time, hash, time1, hash1);
            var responseString = Common.Get(url, cookie);
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
            Send(new JArray { player_name, hash_code, time2, source, regdate, id_card, open_time, is_newst, HttpUtility.UrlDecode(stage), HttpUtility.UrlDecode(client) }, 0, 0);
            done.WaitOne();

            // -----------------------------------------------------------------------------
            // 5. 处理返回数据
            // -----------------------------------------------------------------------------
            if ((byte)response[0] != 0)
                throw new Exception("登录失败");
            _playerId = (int)response[1];

            return _playerId;
        }//Login
        private void LoginCallback(JArray data)
        {
            response = data;
            done.Set();
        }//LoginCallback

        // 获取玩家基本信息
        /// <summary>
        /// Mod_Player_Base.get_player_info(0,2)
        /// module:0, action:2
        /// request:[]
        /// response:[0.Utils.StringUtil, 1.Utils.IntUtil, 2.Utils.IntUtil, 3.Utils.LongUtil, 4.Utils.IntUtil, 5.Utils.IntUtil, 6.Utils.IntUtil, 7.Utils.LongUtil, 8.Utils.LongUtil, 9.Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]
        /// Line 786 in PlayerData.as:
        ///     oObject.list(param1, this, [0."nickname", 1."level", 2."ingot", 3."coins", 4."health", 5."maxHealth", 6."power", 7."experience", 8."maxExperience", 9."townMapId", "bossMapId", "jihuisuoId", "mounts", "mountsCD", "vipLevel", "avatar", "avatarCD", "mainPlayerRoleId", "mainRoleId", "campId", "townKey", "fame", "fameLevel", "extraPower", "maxExtraPower", "netBarPower", "maxNetBarPower", "tester", "lastPlayVersion", "missionKey", "startAccount", "stLevel", "daoYuan", "exploit", "isHaveTangYuan"]);
        /// </summary>
        public JArray GetPlayerInfo()
        {
            done.Reset();
            Send(null, 0, 2);
            done.WaitOne();
            return response;
        }//GetPlayerInfo
        private void GetPlayerInfoCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetPlayerInfoCallback

        // 获取玩家对比信息
        /// <summary>
        /// Mod_Player_Base.player_info_contrast(0,48)
        /// module:0, action:48
        /// request:[Utils.IntUtil]
        /// Line 686 in ToolbarView.as:
        ///     _data.call(Mod_Player_Base.player_info_contrast, this.PlayerInfoContrastCallBack, [this._ctrl.player.playerId], false);
        /// response:[[0.Utils.IntUtil,1. Utils.IntUtil, 2.Utils.StringUtil, 3.Utils.IntUtil, 4.Utils.IntUtil, 5.Utils.IntUtil, 6.Utils.IntUtil, 7.Utils.IntUtil, 8.Utils.IntUtil, 9.Utils.IntUtil, 10.Utils.IntUtil]]
        /// Line 401-422 in PlayerData.as:
        ///     public function player_info_contrast(param1:Array) : void
        ///     {
        ///         var _loc_2:* = param1[0][0];
        ///         var _loc_3:* = {};
        ///         _loc_3.playerId = _loc_2[0];                // playerId
        ///         _loc_3.rankIng = _loc_2[1];                 // 竞技
        ///         _loc_3.factionName  = _loc_2[2];            // 帮派
        ///         _loc_3.combat = _loc_2[3];                  // 战力
        ///         _loc_3.fame = _loc_2[4];                    // 声望
        ///         _loc_3.skill = _loc_2[5];                   // 阅历
        ///         _loc_3.achievmentPoints = _loc_2[6];        // 成就
        ///         _loc_3.firstAttack = _loc_2[7];             // 先攻
        ///         _loc_3.statePoint = _loc_2[8];              // 境界
        ///         _loc_3.flowerCount = _loc_2[9];             // 鲜花
        ///         _loc_3.xianLing = _loc_2[10];               // 仙令
        ///         if (_loc_3.playerId == this.playerInfo.id)
        ///         {
        ///             this.playerInfo.practiceWar = _loc_3.combat;
        ///         }
        ///         this.playerInfoContrastData = _loc_3;
        ///         return;
        /// </summary>
        public JArray PlayerInfoContrast(int playerId)
        {
            done.Reset();
            Send(new JArray { playerId }, 0, 48);
            done.WaitOne();
            return response;
        }//PlayerInfoContrast
        private void PlayerInfoContrastCallback(JArray data)
        {
            response = data;
            done.Set();
        }//PlayerInfoContrastCallback

        // 进入城镇
        /// <summary>
        /// Mod_Town_Base.enter_town(1,0)
        /// module:1, action:0
        /// request:[Utils.IntUtil]
        /// Line 971 in MapViewBase.as:
        ///     _data.call(Mod_Town_Base.enter_town, this.enter_town_back, [this._id], true, this._socketType);
        /// response:[Utils.UByteUtil, 1.Utils.IntUtil, 2.Utils.IntUtil, 3.Utils.IntUtil, 4.[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], 5.Utils.StringUtil, 6.Utils.ShortUtil, 7.Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil], Utils.UByteUtil, [Utils.IntUtil], Utils.UByteUtil, Utils.ShortUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.StringUtil, Utils.IntUtil, Utils.ShortUtil, Utils.StringUtil, Utils.IntUtil]
        /// Line 60 in TownData.as:
        ///     oObject.list(param1, _loc_3, [1."player_id", 2."role_id", 3."follow_role_id", 4."follow_pet_list", 5."nickname", 6."position_x", 7."position_y", "transport", "avatar", "camp_id", "equip_item_id", "warState", "practice_status", "is_on_mission_practice", "faction_id", "faction_name", "is_star", "is_world_war_top", "player_pet_animal_lv", "player_pet_animal_stage", "world_faction_war_award", "playable_video_list", "hidden_town_npc_flag", "show_town_npc_list", "is_become_immortal", "suit_equip_id", "is_become_saint", "mount_rune_type_id", "mount_rune_is_show", "card_spirit_id", "card_spirit_nickname", "orange_equipment_follow_id", "children_role_id", "children_nickname", "children_suit_id"]);
        /// </summary>
        public JArray EnterTown(int townMapId)
        {
            done.Reset();
            Send(new JArray { townMapId }, 1, 0);
            done.WaitOne();
            return response;
        }//EnterTown
        private void EnterTownCallback(JArray data)
        {
            // 防止别的玩家进入城镇导致程序不同步
            if ((int)data[1] != _playerId)
                return;
            response = data;
            done.Set();
        }//EnterTownCallback

        // 获取玩家功能列表
        /// <summary>
        /// Mod_Player_Base.get_player_function(0,6)
        /// module:0, action:6
        /// request:[]
        /// response:[[Utils.IntUtil, Utils.ByteUtil]]
        /// Line 1155-1169 in PlayerData.as:
        ///     private function format_get_player_function(param1:Array) : Array
        ///     {
        ///         var _loc_3:* = null;
        ///         var _loc_4:* = null;
        ///         param1 = param1[0];
        ///         var _loc_2:* = [];
        ///         for (_loc_3 in param1)
        ///         {
        ///             
        ///             _loc_4 = {};
        ///             oObject.list(param1[_loc_3], _loc_4, ["id", "isPlayed"]);
        ///             _loc_2.push(_loc_4);
        ///         }
        ///         return _loc_2;
        ///     }// end function
        ///     id can be found in FunctionTypeData.as from templet.swf
        /// </summary>
        public JArray GetPlayerFunction()
        {
            done.Reset();
            Send(null, 0, 6);
            done.WaitOne();
            return response;
        }//GetPlayerFunction
        private void GetPlayerFunctionCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetPlayerFunctionCallback

        // 获取游戏助手信息
        /// <summary>
        /// Mod_Player_Base.get_game_assistant_info(0,42)
        /// module:0, action:42
        /// request:[]
        /// response:[0.Utils.IntUtil, 1.Utils.IntUtil, 2.Utils.IntUtil, 3.Utils.IntUtil, 4.Utils.IntUtil, 5.Utils.IntUtil, 6.Utils.IntUtil, 7.Utils.IntUtil, 8.Utils.IntUtil, 9.Utils.IntUtil, 10.Utils.IntUtil, 11.Utils.IntUtil, 12.Utils.IntUtil, 13.Utils.IntUtil, 14.Utils.IntUtil, 15.Utils.IntUtil, 16.Utils.IntUtil, 17.Utils.IntUtil, 18.Utils.IntUtil, 19.Utils.IntUtil, 20.Utils.IntUtil, 21.Utils.IntUtil, 22.Utils.IntUtil, 23.Utils.IntUtil, 24.Utils.IntUtil, 25.Utils.IntUtil, 26.Utils.IntUtil, 27.Utils.IntUtil, 28.Utils.IntUtil, 29.Utils.IntUtil, 30.Utils.IntUtil, 31.Utils.IntUtil, 32.Utils.IntUtil, 33.[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], 34.[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        /// Line 1241 in PlayerData.as:
        ///     oObject.list(list, this.getGameAssistantInfo, [0."sports_rank", 1."combat", 2."fame", 3."skill", 4."role_number", 5."max_role_number", 6."day_quest_number", 7."day_quest_finish", 8."buy_power_chance", 9."buy_power_value", 10."buy_power_ingot", 11."ingot_rune_chance", 12."camp_salary", 13."is_get_camp_salary", 14."free_fate_chance", 15."incense_chance", 16."super_sports_chance", 17."super_sports_cd_time", 18."takebible_chance", 19."takebible_arrival_remain", 20."send_flower_chance", 21."free_reset_chance", 22."coin_tree_chance", 23."buy_coin_tree_count_chance", 24."achievement_points", 25."state_point", 26."roll_cake_count", 27."worship_mars_times", 28."buy_fate_npc_times", 29."peach_times", 30."is_can_get_stone", 31."get_stone_state", 32."pet_animal_times", 33."back_times_list", 34."active_degree_list"]);
        /// </summary>
        public JArray GetGameAssistantInfo()
        {
            done.Reset();
            Send(null, 0, 42);
            done.WaitOne();
            return response;
        }//GetGameAssistantInfo
        private void GetGameAssistantInfoCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetGameAssistantInfoCallback

        // 领取俸禄、仙令、灵石
        /// <summary>
        /// Mod_Player_Base.get_player_camp_salary(0,20)
        /// module:0, action:20
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.IntUtil]
        /// Line 349-350 in PlayerData.as
        ///     this.campSalaryStatus = param1[0];
        ///     this.getPlayerCampSalary = param1[1];
        /// </summary>
        public JArray GetPlayerCampSalary()
        {
            done.Reset();
            Send(null, 0, 20);
            done.WaitOne();
            return response;
        }//GetPlayerCampSalary
        private void GetPlayerCampSalaryCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetPlayerCampSalaryCallback

        /// <summary>
        /// Mod_Farm_Base.is_player_get_xian_ling_gift(13,19)
        /// module:13, action:19
        /// request:[]
        /// response:[Utils.ByteUtil]
        /// </summary>
        public JArray IsPlayerGetXianLingGift()
        {
            done.Reset();
            Send(null, 13, 19);
            done.WaitOne();
            return response;
        }//IsPlayerGetXianLingGift
        private void IsPlayerGetXianLingGiftCallback(JArray data)
        {
            response = data;
            done.Set();
        }//IsPlayerGetXianLingGiftCallback

        /// <summary>
        /// Mod_Farm_Base.player_get_xian_ling_gift(13,20)
        /// module:13, action:20
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.ByteUtil]
        /// </summary>
        public JArray PlayerGetXianLingGift()
        {
            done.Reset();
            Send(null, 13, 20);
            done.WaitOne();
            return response;
        }//PlayerGetXianLingGift
        private void PlayerGetXianLingGiftCallback(JArray data)
        {
            response = data;
            done.Set();
        }//PlayerGetXianLingGiftCallback

        /// <summary>
        /// Mod_SealSoul_Base.day_stone_count(34,20)
        /// module:34, action:20
        /// request:[]
        /// response:[Utils.IntUtil]
        /// </summary>
        public JArray DayStoneCount()
        {
            done.Reset();
            Send(null, 34, 20);
            done.WaitOne();
            return response;
        }//PlayerGetXianLDayStoneCountingGift
        private void DayStoneCountCallback(JArray data)
        {
            response = data;
            done.Set();
        }//DayStoneCountCallback

        /// <summary>
        /// Mod_SealSoul_Base.get_day_stone(34,18)
        /// module:34, action:18
        /// request:[Utils.ByteUtil]
        /// response:[Utils.ByteUtil, Utils.IntUtil]
        /// </summary>
        public JArray GetDayStone()
        {
            /*const int _id = 48;
            if (functionList.Contains(_id))
            {*/
            done.Reset();
            Send(new JArray(0), 34, 18);
            done.WaitOne();
            return response;
            /* }
             else
                 Logger.Log(string.Format("未开通{0}功能", Protocols.GetFunctionName(_id)), ConsoleColor.Red);*/
        }//GetDayStone
        private void GetDayStoneCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetDayStoneCallback

        // 领取随机礼包
        /// <summary>
        /// Mod_FunctionEnd_Base.game_function_end_gift(127,1)
        /// module:127, action:1
        /// request:[]
        /// response:[[0.Utils.ShortUtil, 1.Utils.ShortUtil, 2.Utils.IntUtil, 3.Utils.IntUtil, 4.Utils.IntUtil, 5.Utils.IntUtil, 6.Utils.ShortUtil, 7.Utils.ShortUtil, 8.Utils.IntUtil, 9.Utils.ByteUtil]]
        /// Line 56-71 in FunctionEndData.as
        ///     _loc_4 = GiftType.getEndFunctionGift(_loc_1[_loc_3][0]);
        ///     GiftType.getEndFunctionGift(_loc_1[_loc_3][0]).giftId = _loc_4.id;
        ///     _loc_4.iconPath = URI.functionEndUrl + _loc_4.id + ".png";
        ///     _loc_4.flag = 1;
        ///     _loc_4.message = "";
        ///     _loc_4.addMsg = "";
        ///     _loc_4.state_point = _loc_1[_loc_3][1];         // 境界
        ///     _loc_4.skill = _loc_1[_loc_3][2];               // 阅历
        ///     _loc_4.xian_ling = _loc_1[_loc_3][3];           // 仙令
        ///     _loc_4.fame = _loc_1[_loc_3][4];                // 声望
        ///     _loc_4.nimbus    = _loc_1[_loc_3][5];           // 灵气
        ///     _loc_4.coin_buff = _loc_1[_loc_3][6];           // 铜钱加成
        ///     _loc_4.exp_buff = _loc_1[_loc_3][7];            // 经验加成
        ///     _loc_4.ingot = _loc_1[_loc_3][8];               // 元宝
        ///     _loc_4.sortNum = 2000 + _loc_4.sort * 100;      // 排序
        ///     _loc_4.bei = _loc_1[_loc_3][9];                 // 翻倍
        /// </summary>
        public JArray GameFunctionEndGift()
        {
            done.Reset();
            Send(null, 127, 1);
            done.WaitOne();
            return response;
        }//GameFunctionEndGift
        private void GameFunctionEndGiftCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GameFunctionEndGiftCallback

        /// <summary>
        /// Mod_FunctionEnd_Base.random_award(127,3)
        /// module:127, action:3
        /// request:[Utils.ShortUtil]
        /// response:[Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 202-208 in FunctionEndData.as
        ///     _loc_3.state_point = param1[0];
        ///     _loc_3.skill = param1[1];
        ///     _loc_3.xian_ling = param1[2];
        ///     _loc_3.fame = param1[3];
        ///     _loc_3.nimbus = param1[4];
        ///     _loc_3.exp_buff = param1[5];
        ///     this.randomIngot = param1[6];
        /// </summary>
        public JArray RandomAward(short id)
        {
            done.Reset();
            Send(new JArray(id), 127, 3);
            done.WaitOne();
            return response;
        }//RandomAward
        private void RandomAwardCallback(JArray data)
        {
            response = data;
            done.Set();
        }//RandomAwardCallback

        /// <summary>
        /// Mod_FunctionEnd_Base.get_game_function_end_gift(127,2)
        /// module:127, action:2
        /// request:[Utils.ShortUtil]
        /// response:[0.Utils.UByteUtil, 1.Utils.ShortUtil, 2.Utils.IntUtil, 3.Utils.IntUtil, 4.Utils.IntUtil, 5.Utils.IntUtil, 6.Utils.ShortUtil, 7.Utils.ShortUtil, 8.Utils.ByteUtil]
        /// Line 191-192 in FunctionEndData.as
        ///     this.result = param1[0];
        ///     this.isHaveNext = param1[8] == 1;
        /// </summary>
        public JArray GetGameFunctionEndGift(short id)
        {
            done.Reset();
            Send(new JArray(id), 127, 2);
            done.WaitOne();
            return response;
        }//GetGameFunctionEndGift
        private void GetGameFunctionEndGiftCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetGameFunctionEndGiftCallback

        // 领取礼包
        /// <summary>
        /// Mod_Item_Base.get_player_gift_all_info(2,6)
        /// module:2, action:6
        /// request:[]
        /// response:[[Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]]]
        /// Line 1792-1796 in ItemData.as:
        ///     _loc_2.giftId = param1[0];
        ///     _loc_2.type = param1[1];
        ///     _loc_2.name = GiftType.getCommonGiftName(_loc_2.type);
        ///     _loc_2.message = param1[2];
        ///     _loc_2.addMsg = param1[3];
        /// </summary>
        public JArray GetPlayerGiftAllInfo()
        {
            done.Reset();
            Send(null, 2, 6);
            done.WaitOne();
            return response;
        }//GetPlayerGiftAllInfo
        private void GetPlayerGiftAllInfoCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetPlayerGiftAllInfoCallback

        /// <summary>
        /// Mod_Item_Base.player_get_super_gift(2,29)
        /// module:2, action:29
        /// request:[Utils.IntUtil]
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil]]
        /// </summary>
        public JArray PlayerGetSuperGift(int id)
        {
            done.Reset();
            Send(new JArray(id), 2, 29);
            done.WaitOne();
            return response;
        }//PlayerGetSuperGift
        private void PlayerGetSuperGiftCallback(JArray data)
        {
            response = data;
            done.Set();
        }//PlayerGetSuperGiftCallback

        // 领取阵营战礼包
        /// <summary>
        /// Mod_HeroesWar_Base.get_end_gift_info(42,17)
        /// module:42, action:17
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 223 in HeroesWarData.as
        ///     oObject.list(this._objGetEndGiftInfo, _loc_1, ["has_gift"(YES:int = 27, NO:int = 28), "fame"(声望), "coin"(铜钱)]);
        /// </summary>
        public JArray GetEndGiftInfo()
        {
            done.Reset();
            Send(null, 42, 17);
            done.WaitOne();
            return response;
        }//GetEndGiftInfo
        private void GetEndGiftInfoCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetEndGiftInfoCallback

        /// <summary>
        /// Mod_HeroesWar_Base.get_end_gift(42,18)
        /// module:42, action:18
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 233 in HeroesWarData.as
        ///     oObject.list(this._objGetEndGift, _loc_1, ["has_gift"(YES:int = 27, NO:int = 28), "fame"(声望), "coin"(铜钱)]);
        /// </summary>
        public JArray GetEndGift()
        {
            done.Reset();
            Send(null, 42, 18);
            done.WaitOne();
            return response;
        }//GetEndGift
        private void GetEndGiftCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetEndGiftCallback

        // 摘仙桃
        /// <summary>
        /// Mod_GetPeach_Base.peach_info(40,3)
        /// module:40, action:3
        /// request:[]
        /// response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]
        /// [19,5,1,0]
        /// Line 34,36,45-47 in GetPeachController.as:
        ///     _loc_2.peachLv = _loc_1[0];
        ///     _loc_2.fruitLv = 70 + _loc_2.peachLv * 5;
        ///     _loc_2.peachNum = _loc_1[1];
        ///     _loc_2.bAllGet = _loc_1[2] == 1;
        ///     _loc_2.bCallPeach = _loc_1[3] == 1;
        /// </summary>
        public JArray PeachInfo()
        {
            done.Reset();
            Send(null, 40, 3);
            done.WaitOne();
            return response;
        }//PeachInfo
        private void PeachInfoCallback(JArray data)
        {
            response = data;
            done.Set();
        }//PeachInfoCallback

        // 没有一键摘桃是什么特征？
        /// <summary>
        /// Mod_GetPeach_Base.batch_get_peach(40,5)
        /// module:40, action:5
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.LongUtil]
        /// Line 69-74 in GetPeachData.as:
        ///     public function batch_get_peach(param1:Array) : void
        ///     {
        ///         this.batchGetPeachResult = param1[0];
        ///         this.warExp = param1[1];
        ///         return;
        ///     }// end function
        /// </summary>
        public JArray BatchGetPeach()
        {
            done.Reset();
            Send(null, 40, 5);
            done.WaitOne();
            return response;
        }//BatchGetPeach
        private void BatchGetPeachCallback(JArray data)
        {
            response = data;
            done.Set();
        }//BatchGetPeachCallback

        // 聊天
        /// <summary>
        /// Mod_Chat_Base.chat_with_players(6,0)
        /// module:6, action:0
        /// request:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil]
        /// Line 118 in ChatView.as
        ///     _data.call(Mod_Chat_Base.chat_with_players, callBack, [data.messageType, data.message, data.eipNum, data.eipIndex]);
        /// response:[Utils.IntUtil, Utils.UByteUtil]
        /// </summary>
        public JArray ChatWithPlayers(string message)
        {
            done.Reset();
            Send(new JArray { 1, message, string.Empty, string.Empty }, 6, 0);
            done.WaitOne();
            return response;
        }//ChatWithPlayers
        /// <summary>
        /// Mod_Chat_Base.bro_to_players(6,1)
        /// module:6, action:1
        /// request:[]
        /// response:[[Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.ByteUtil]]
        /// Line 36 in ChatController.as
        ///     oObject.list(_loc_1[_loc_5], _loc_2[_loc_5], ["playId", "playName", "isTester", "isStar", "msgType", "msgTxt", "eipNum", "eipIndex", "roleId", "townKey", "serverName", "stageName", "isNetBar"]);
        /// </summary>
        private void BroToPlayersCallback(JArray data)
        {
            foreach (var item in data[0])
            {
                if ((int)item[0] != _playerId)
                    continue;
                response = data;
                done.Set();
            }
        }//BroToPlayersCallback

        // 获取仙界状态
        /// <summary>
        /// Mod_StcLogin_Base.get_status(96,1)
        /// module:96, action:1
        /// request:[]
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]
        /// Line 38 in StcLoginData.as:
        ///     oObject.list(param1, this.stcStatusObj, ["status", "close_time_list"]);
        /// example: [0,[[1505527200,1505534400,4]]]
        /// </summary>
        public JArray GetStatus()
        {
            done.Reset();
            Send(null, 96, 1);
            done.WaitOne();
            return response;
        }//GetStatus
        private void GetStatusCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetStatusCallback

        // 获取仙界登录信息
        /// <summary>
        /// Mod_StcLogin_Base.get_login_info(96,0)
        /// module:96, action:0
        /// request:[]
        /// response:[0.Utils.StringUtil, 1.Utils.ShortUtil, 2.Utils.StringUtil, 3.Utils.IntUtil, 4.Utils.StringUtil, 5.Utils.StringUtil]
        /// Line 22-34 in StcLoginData.as:
        ///     public function get_login_info(param1:Array) : void
        ///     {
        ///         this.stcLoginObj = new Object();
        ///         var _loc_2:* = 0;
        ///         this.stcLoginObj.serverHost = param1[_loc_2++];
        ///         this.stcLoginObj.port = param1[_loc_2++];
        ///         this.stcLoginObj.serverName = param1[_loc_2++];
        ///         this.stcLoginObj.time = param1[_loc_2++];
        ///         this.stcLoginObj.passCode = param1[_loc_2++];
        ///         this.stcLoginObj.serverTownName = param1[_loc_2++];
        ///         this.stcLoginObj.playerId = 32;
        ///         return;
        ///     }// end function
        /// </summary>
        public JArray GetLoginInfo()
        {
            done.Reset();
            Send(null, 96, 0);
            done.WaitOne();
            return response;
        }//GetLoginInfo
        private void GetLoginInfoCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetLoginInfoCallback

















    }//class SxdClientTown


}//namespace