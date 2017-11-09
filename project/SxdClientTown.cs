using System;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text.RegularExpressions;
using System.Web;
using Newtonsoft.Json.Linq;

namespace 神仙道
{
    public class SxdClientTown : SxdClient
    {
        public SxdClientTown()
        {
            ServerName = "游戏服务器";
        }

        // -------------------------------------------------------------------------------------------
        // 登录
        // -------------------------------------------------------------------------------------------
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

        // -------------------------------------------------------------------------------------------
        // 初始化
        // -------------------------------------------------------------------------------------------
        // 获取玩家基本信息
        /// <summary>
        /// Mod_Player_Base.get_player_info(0,2)
        /// module:0, action:2
        /// request:[]
        /// response:[0.Utils.StringUtil, 1.Utils.IntUtil, 2.Utils.IntUtil, 3.Utils.LongUtil, 4.Utils.IntUtil, 5.Utils.IntUtil, 6.Utils.IntUtil, 7.Utils.LongUtil, 8.Utils.LongUtil, 9.Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil]
        /// Line 786 in PlayerData.as:
        ///     oObject.list(param1, this, [
        ///         0."nickname", 1."level", 2."ingot", 3."coins", 4."health", 
        ///         5."maxHealth", 6."power", 7."experience", 8."maxExperience", 9."townMapId", 
        ///         10."bossMapId", 11."jihuisuoId", 12."mounts",13. "mountsCD", 14."vipLevel", 
        ///         15."avatar", 16."avatarCD", 17."mainPlayerRoleId", 18."mainRoleId", 19."campId", 
        ///         20."townKey", 21."fame", 22."fameLevel", 23."extraPower", 24."maxExtraPower", 
        ///         25."netBarPower", 26."maxNetBarPower", 27."tester", 28."lastPlayVersion", 29."missionKey", 
        ///         30."startAccount", 31."stLevel", 32."daoYuan", 33."exploit", 34."isHaveTangYuan"]);
        /// </summary>
        public JArray GetPlayerInfo()
        {
            done.Reset();
            Send(null, 0, 2);
            done.WaitOne();
            return response;
        }//GetPlayerInfo

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

        // -------------------------------------------------------------------------------------------
        // 领取礼包
        // -------------------------------------------------------------------------------------------
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

        /// <summary>
        /// Mod_SealSoul_Base.get_day_stone(34,18)
        /// module:34, action:18
        /// request:[Utils.ByteUtil]
        /// response:[Utils.ByteUtil, Utils.IntUtil]
        /// </summary>
        public JArray GetDayStone()
        {
            done.Reset();
            Send(new JArray(0), 34, 18);
            done.WaitOne();
            return response;
        }//GetDayStone

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

        // 领取自定义挑战礼包
        /// <summary>
        /// Mod_StChallenge_Base.get_end_li_bao(136,20)
        /// module:136, action:20
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]
        /// Line 253 in StChallengeData.as
        ///     this.endGiftResult = param1[0];
        /// Line 17 in Mod_StChallenge_Base.as
        ///     public static const SUCCESS:int = 10;
        /// </summary>
        public JArray GetEndLiBao()
        {
            done.Reset();
            Send(null, 136, 20);
            done.WaitOne();
            return response;
        }//GetEndLiBao

        // 领取极限挑战宝箱
        /// <summary>
        /// Mod_UnlimitChallenge_Base.get_end_award(169,5)
        /// module:169, action:5
        /// request:[]
        /// response:[Utils.UByteUtil]
        /// Line 150 in UnlimitChallengeData.as
        ///     this._getEndAwardResult = param1[0];
        /// Line 13 in Mod_UnlimitChallenge_Base.as:
        ///     public static const SUCCESS:int = 6;
        /// </summary>
        public JArray GetEndAward()
        {
            done.Reset();
            Send(null, 169, 5);
            done.WaitOne();
            return response;
        }//GetEndAward

        // -------------------------------------------------------------------------------------------
        // 摘仙桃
        // -------------------------------------------------------------------------------------------
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

        // -------------------------------------------------------------------------------------------
        // 药园
        // -------------------------------------------------------------------------------------------
        // 获取土地信息
        /// <summary>
        /// Mod_Farm_Base.get_farmlandinfo_list(13,0)
        /// module:13, action:0
        /// request:[]
        /// response:[[0.Utils.IntUtil, 1.Utils.IntUtil, 2.Utils.StringUtil, 3.Utils.StringUtil, 4.Utils.IntUtil, 
        ///            5.Utils.LongUtil, 6.Utils.LongUtil, 7.Utils.IntUtil, 8.Utils.IntUtil, 9.Utils.IntUtil, 
        ///            10.Utils.UByteUtil, 11.Utils.UByteUtil, 12.Utils.ByteUtil], Utils.IntUtil]
        /// Line 258,262 in FarmData.as:
        ///     for each (_loc_2 in param1[0])
        ///     oObject.list(_loc_2, _loc_6, [
        ///         0."farmland_id", 1."player_role_id", 2."player_role_sign", 3."player_role_name", 4."player_role_level", 
        ///         5."player_role_experience", 6."max_experience", 7."herbs_id", 8."farmland_time", 9."farmland_level", 
        ///         10."is_plant", 11."herbs_type", 12."isNetBar"]);
        /// Example: [[[146928,0,"","",0,0,0,0,0,1,1,2,0],[146926,0,"","",0,0,0,0,0,1,1,2,0],[146925,0,"","",0,0,0,0,0,1,1,2,0],[146090,0,"","",0,0,0,0,0,1,1,2,0],[146930,0,"","",0,0,0,0,0,1,1,2,0],[146927,0,"","",0,0,0,0,0,1,1,2,0],[147029,0,"","",0,0,0,0,0,1,1,2,0],[146929,0,"","",0,0,0,0,0,1,1,2,0]],8]
        ///          [[[115175,0,"","",0,0,0,0,0,1,1,2,0],[115218,0,"","",0,0,0,0,0,1,1,2,0],[117143,0,"","",0,0,0,0,0,1,1,2,0],[111186,0,"","",0,0,0,0,0,2,1,2,0],[113994,0,"","",0,0,0,0,0,1,1,2,0],[122215,0,"","",0,0,0,0,0,1,1,2,0],[118427,0,"","",0,0,0,0,0,1,1,2,0],[120677,0,"","",0,0,0,0,0,1,1,2,0]],8]
        ///     红土地：      [111186,0,"","",0,                             0,0,0,0,**2**,                 1,2,0]
        ///     经验数可收获：[146090,812186,"XianHeXianGu","仙何仙姑",162,  862218379,3087000000,92,0,1,   0,2,0]
        ///     CD：          [146090,0,"","",0,                             0,0,0,28765,1,                 1,2,0]
        ///     发财树可收获：[146925,812186,"XianHeXianGu","仙何仙姑",162,  1000466004,3087000000,31,0,1,  0,3,0]
        /// </summary>
        public JArray GetFarmlandinfoList()
        {
            done.Reset();
            Send(null, 13, 0);
            done.WaitOne();
            return response;
        }//GetFarmlandinfoList

        // 仙露
        /// <summary>
        /// Mod_Farm_Base.buy_coin_tree_count_info(13,12)
        /// module:13, action:12
        /// request:[]
        /// response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 498 in FarmData.as:
        ///     oObject.list(param1, this._objBuyCoinTreeCountInfo, ["coin_tree_count", "remain_buy_times", "ingot", "recorve_cd"]);
        /// </summary>
        public JArray BuyCoinTreeCountInfo()
        {
            done.Reset();
            Send(null, 13, 12);
            done.WaitOne();
            return response;
        }//BuyCoinTreeCountInfo

        // 种植伙伴
        /// <summary>
        /// Mod_Farm_Base.get_player_roleinfo_list(13,1)
        /// module:13, action:1
        /// request:[]
        /// response:[[0.Utils.IntUtil, 1.Utils.StringUtil, 2.Utils.StringUtil, 3.Utils.IntUtil, 4.Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]
        /// Line 310 in FarmData.as:
        ///     oObject.list(_loc_3, _loc_4, [0."player_role_id", 1."player_role_sign", 2."player_role_name", 3."player_role_level", 4."player_role_experience", "max_experience", "strength", "agile", "intellect", "player_role_state"]);
        /// </summary>
        public JArray GetPlayerRoleinfoList()
        {
            done.Reset();
            Send(null, 13, 1);
            done.WaitOne();
            return response;
        }//GetPlayerRoleinfoList

        // 种植
        /// <summary>
        /// Mod_Farm_Base.plant_herbs(13,5)
        /// module:13, action:5
        /// request:[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.ByteUtil]
        /// Line 614 in FarmView.as:
        ///     this.plant_herbs(intFieldId, intRoleId, intType, herbs_star_level);
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil, Utils.ByteUtil]
        /// Line 430 in FarmData.as:
        ///     oObject.list(param1, this._objPlantHerbs, ["result", "farmland_id", "player_role_id", "player_role_sign", "player_role_name", "player_role_level", "player_role_experience", "max_experience", "herbs_id", "farmland_level", "coin_tree_count", "xianling_tree_count", "is_plant", "herbs_type", "isNetBar"]);
        /// Line 15 in FarmData.as:
        ///     public static const SUCCESS:int = 8;
        /// Mod_Farm_Base.as:
        ///     public static const EXP_HERBS:int = 2;
        ///     public static const COIN_HERBS:int = 3;
        /// herbs_star_level: 1:普通, 2:优秀, 3:精良, 4:传奇, 5:神话
        /// </summary>
        public JArray PlantHerbs(int fieldId, int roleId, byte type, byte herbs_star_level)
        {
            done.Reset();
            Send(new JArray { fieldId, roleId, type, herbs_star_level }, 13, 5);
            done.WaitOne();
            return response;
        }//PlantHerbs

        // 收获
        /// <summary>
        /// Mod_Farm_Base.harvest(13,6)
        /// module:13, action:6
        /// request:[Utils.IntUtil]
        /// response:[Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]
        /// Line 463 in FarmData.as:
        ///     oObject.list(param1, this._objHarvest, [0."result", 1."role_name", 2."herbs_name", 3."experience", 4."level", 5."coin", 6."xianling", 7."farmland_time", 8."herbs_type"]);
        /// Example: [8,"神杨戬","普通发财树",0,0,399600,0,0,3]
        /// Line 15 in FarmData.as:
        ///     public static const SUCCESS:int = 8;
        /// </summary>
        public JArray Harvest(int fieldId)
        {
            done.Reset();
            Send(new JArray { fieldId }, 13, 6);
            done.WaitOne();
            return response;
        }//Harvest

        // -------------------------------------------------------------------------------------------
        // 聊天
        // -------------------------------------------------------------------------------------------
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
            if (data[0].All(item => (int)item[0] != _playerId))
                return;
            response = data;
            done.Set();
        } //BroToPlayersCallback

        // -------------------------------------------------------------------------------------------
        // 仙界准备
        // -------------------------------------------------------------------------------------------
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

        // -------------------------------------------------------------------------------------------
        // 英雄副本
        // -------------------------------------------------------------------------------------------
        // 获取英雄副本列表
        /// <summary>
        /// Mod_HeroMission_Base.get_hero_mission_list(35,0)
        /// module:35, action:0
        /// request:[Utils.ShortUtil]
        /// response:[[Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil]
        /// Line 52-55 in HeroMissionController.as:
        ///     _loc_2.id = param1[0];
        ///     _loc_2.isCanChallenge = param1[1];
        ///     _loc_2.rank = this._rankobj[param1[2]];
        ///     _loc_2.isFinished = param1[3];
        /// </summary>
        public JArray GetHeroMissionList(int townId)
        {
            done.Reset();
            Send(new JArray { townId }, 35, 0);
            done.WaitOne();
            return response;
        }//GetHeroMissionList

        // 开始扫荡
        /// <summary>
        /// Mod_HeroMission_Base.start_practice(35,2)
        /// module:35, action:2
        /// request:[Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil]
        /// Line 50 in HeroPracticeView.as:
        ///     _data.call(Mod_HeroMission_Base.start_practice, this.startPracticeCallBack, [this.showTownId, this._autoNum(1:自动售出副本掉落物品;0:不售出), this.heroType]);
        /// response:[Utils.UByteUtil, Utils.IntUtil]
        /// Line 77-80 in HeroMissionController.as
        ///     var _loc_1:* = _data.heroMission.startPractice;
        ///     var _loc_2:* = {};
        ///     _loc_2.msg = _loc_1[0];
        ///     _loc_2.practiceTime = _loc_1[1];
        /// Line 10 in Mod_HeroMission_Base.as
        ///     public static const SUCCESS:int = 3;
        /// </summary>
        public JArray StartPractice(int townId, byte autoNum, byte heroType)
        {
            done.Reset();
            Send(new JArray { townId, autoNum, heroType }, 35, 2);
            done.WaitOne();
            return response;
        }//StartPractice

        /// <summary>
        /// Mod_HeroMission_Base.quickly(35,7)
        /// module:35, action:7
        /// request:[]
        /// response:[Utils.UByteUtil]
        /// Line 206-208 in HeroMissionController.as
        ///     var _loc_1:* = _data.heroMission.getQuickly;
        ///     var _loc_2:* = {};
        ///     _loc_2.msg = _loc_1[0];
        /// Line 10 in Mod_HeroMission_Base.as
        ///     public static const SUCCESS:int = 3;
        /// </summary>
        public JArray Quickly()
        {
            done.Reset();
            Send(null, 35, 7);
            done.WaitOne();
            return response;
        }//Quickly

        /// <summary>
        /// Mod_HeroMission_Base.notify(35,4)
        /// module:35, action:4
        /// request:[]
        /// response:[Utils.UByteUtil, 
        ///           [[Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.ShortUtil], 
        ///           [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil], 
        ///           Utils.ShortUtil]
        /// Line 13 in Mod_HeroMission_Base.as
        ///     public static const BAG_FULL:int = 6;
        /// Line 14 in Mod_HeroMission_Base.as
        ///     public static const NOT_ENOUGH_POWER:int = 7;
        /// Line 15 in Mod_HeroMission_Base.as
        ///     public static const NO_MISSION:int = 8;
        /// Line 17 in Mod_HeroMission_Base.as
        ///     public static const FINISH:int = 10;
        /// </summary>
        private void NotifyCallback(JArray data)
        {
            if ((byte)data[0] == 6 || (byte)data[0] == 7 || (byte)data[0] == 8 || (byte)data[0] == 10)
            {
                response = data;
                done.Set();
            }
        }//NotifyCallback

        // 竞技场
        /// <summary>
        /// 打开竞技场
        /// Mod_SuperSport_Base.open_super_sport(28,0)
        /// module:28, action:0
        /// request:[]
        /// response:[0.Utils.IntUtil, 1.Utils.ShortUtil, 2.Utils.IntUtil, 3.Utils.ShortUtil, 4.Utils.ShortUtil, 
        ///           5.Utils.ShortUtil, 6.Utils.ShortUtil, 7.Utils.IntUtil, 8.Utils.IntUtil, 9.Utils.IntUtil, 
        ///           10.Utils.IntUtil, 11.Utils.IntUtil, 12.[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil], 
        ///           13.[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil]]
        /// Line 39-57 in SuperSportController.as:
        ///     _loc_3.mainData.myRank = _loc_2[0];
        ///     _loc_3.mainData.name = _data.player.nickname;
        ///     _loc_3.mainData.winCount = _loc_2[1];
        ///     _loc_3.mainData.fame = _loc_2[2];
        ///     _loc_3.mainData.fameName = FameLevel.getFameName(_loc_2[3]);
        ///     _loc_3.ChallengeNum.remainChallengeTimes = _loc_2[4];
        ///     _loc_3.ChallengeNum.remainBuyTimes = _loc_2[5];
        ///     _loc_3.ChallengeNum.nextBuyPrice = _loc_2[6];
        ///     _loc_3.awardInfo.awardCoin = _loc_2[7];
        ///     _loc_3.awardInfo.awardFame = _loc_2[8];
        ///     var _loc_4:* = _ctrl.player.serverTime;
        ///     _loc_3.awardInfo.awardTime = DateTime.formatServerTimeNull(_loc_2[9]) - _loc_4;
        ///     _loc_3.openTimer = DateTime.formatServerTimeNull(_loc_2[10]) - _loc_4;
        ///     _loc_3.cdTimer = _loc_2[11];
        ///     _loc_3.challengePersonList = this.renderChallengePersonList(_loc_2[12]);
        ///     _loc_3.sportReportList = this.renderSportReportList(_loc_2[13]);
        ///     _loc_3.winCountData.winId = _loc_2[14];
        ///     _loc_3.winCountData.winName = _loc_2[15];
        ///     _loc_3.winCountData.winTimesTop = _loc_2[16];
        /// Example: [2874,0,993468,40,5,
        ///           0,2,1000,0,1509325906,
        ///           1509067006,0,
        ///           [[2824,239651,1,142,"大魔导师.s1",1000,0],[2774,321395,1,145,"邹濯检.s4",1000,0],[2724,276806,1,149,"殷桥奉.s1",1000,0],[2674,35779,1,151,"弑神信仰.s1",1000,0],[2624,252730,106,148,"念乖乖.s1",1000,0]],
        ///           [[748912,1,23753,"lx1026.s1",355553,"甄斐斐.s1",355553,2874,2874,"2017101401",1508042103],[622667,1,355553,"甄斐斐.s1",252730,"念乖乖.s1",252730,2874,2874,"2017081801",1503818074],[607023,1,355553,"甄斐斐.s1",252730,"念乖乖.s1",252730,2874,2874,"2017081801",1503508173],[427194,1,355553,"甄斐斐.s1",239651,"大魔导师.s1",239651,2874,2874,"2017072101",1501820490],[427172,1,355553,"甄斐斐.s1",239651,"大魔导师.s1",239651,2874,2874,"2017072101",1501820459]]]
        /// </summary>
        public JArray OpenSuperSport()
        {
            done.Reset();
            Send(null, 28, 0);
            done.WaitOne();
            return response;
        }//OpenSuperSport

        /// <summary>
        /// 开始挑战
        /// Mod_SuperSport_Base.start_challenge(28,2)
        /// module:28, action:2
        /// request:[Utils.IntUtil]
        /// response:[0.Utils.UByteUtil, 1.Utils.ShortUtil, 2.Utils.IntUtil, 3.[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil], [Utils.IntUtil, Utils.IntUtil]]]
        /// Line 166-189 in SuperSportController.as:
        ///     _loc_2.result = _loc_1[0];
        ///     _loc_2.msg = _loc_1[0];
        ///     _loc_2.remain = _loc_1[1];
        ///     _loc_2.cdTimer = _loc_1[2];
        ///     if (_loc_2.result == Mod_SuperSport_Base.SUCCESS)
        ///     {
        ///         _loc_3 = _loc_1[3][0];
        ///         _loc_2.awardFame = _loc_3[0];
        ///         _loc_2.awardCoin = _loc_3[1];
        ///         _loc_2.awardGun = _loc_3[2];
        ///         _loc_2.scrapId = _loc_3[3];
        ///         _loc_2.reportId = _loc_3[4];
        ///         _loc_2.warData = [0, 0, 0, [_loc_3[5][0]]];
        ///         _loc_2.itemList = new Array();
        ///         _loc_4 = _loc_3[6];
        ///         for each (_loc_5 in _loc_4)
        ///         {
        ///             
        ///             _loc_6 = new Object();
        ///             _loc_6.itemId = _loc_5[0];
        ///             _loc_6.count = _loc_5[1];
        ///             _loc_2.itemList.push(_loc_6);
        ///         }
        ///     }
        /// Line 7 in Mod_SuperSport_Base.as
        ///     public static const SUCCESS:int = 0;
        /// </summary>
        public JArray StartChallenge(int rank)
        {
            done.Reset();
            Send(new JArray { rank }, 28, 2);
            done.WaitOne();
            return response;
        }//StartChallenge

        // 小助手
        /// <summary>
        /// Mod_Assistant_Base.info(52,0)
        /// module:52, action:0
        /// request:[]
        /// response:[Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]
        /// Line 253-259 in AssistantData.as
        ///     public function info(param1:Array) : void
        ///     {
        ///         this._aryBoxInfo = this.getBoxData(param1);
        ///         this._liveNum = param1[0] * 5;
        ///         this._boxInfo = this.renderBoxInfo(param1);
        ///         return;
        ///     }// end function
        /// </summary>
        public JArray AssistantInfo()
        {
            done.Reset();
            Send(null, 52, 0);
            done.WaitOne();
            return response;
        }//AssistantInfo

        /// <summary>
        /// Mod_Assistant_Base.get_award(52,1)
        /// module:52, action:1
        /// request:[Utils.IntUtil]
        /// response:[Utils.UByteUtil]
        /// Line 264 in AssistantData.as
        ///     oObject.list(param1, this._objGetAward, ["result"]);
        /// Line 7 in Mod_Assistant_Base.as
        ///     public static const SUCCESS:int = 0;
        /// </summary>
        public JArray AssistantGetAward(int sn)
        {
            done.Reset();
            Send(new JArray { sn }, 52, 1);
            done.WaitOne();
            return response;
        }//AssistantGetAward

        // 钓鱼
        /// <summary>
        /// Mod_Fish_Base.get_player_fishhook(217,0)
        /// module:217, action:0
        /// request:[]
        /// response:[Utils.IntUtil]
        /// Line 23 in FishData.as
        ///     oObject.list(this._aryGetPlayerFishhook, _loc_1, ["fishhook_number"]);
        /// </summary>
        public JArray GetPlayerFishhook()
        {
            done.Reset();
            Send(null, 217, 0);
            done.WaitOne();
            return response;
        }//GetPlayerFishhook

        /// <summary>
        /// Mod_Fish_Base.do_fishing(217,1)
        /// module:217, action:1
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 31 in FishData.as
        ///     oObject.list(this._aryDoFishing, _loc_1, ["result", "item_id", "number"]);
        /// Line 7 in Mod_Fish_Base.as
        ///     public static const SUCCESS:int = 0;
        /// </summary>
        public JArray DoFishing()
        {
            done.Reset();
            Send(null, 217, 1);
            done.WaitOne();
            return response;
        }//DoFishing

        // 仙旅奇缘
        /// <summary>
        /// Mod_TravelEvent_Base.get_event_and_answer(21,1)
        /// module:21, action:1
        /// request:[]
        /// response:[0.Utils.IntUtil, 1.Utils.StringUtil, 2.[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil], 3.Utils.UByteUtil, 4.Utils.IntUtil, 5.Utils.IntUtil, 6.Utils.IntUtil]
        /// Line 31-37 in TravelEventController.as
        ///     _loc_2.eventId = _loc_1[0];
        ///     _loc_2.event = _loc_1[1];
        ///     _loc_2.answerList = this.renderAnswer(_loc_1[2]);
        ///     _loc_2.msg = _loc_1[3];
        ///     _loc_2.cur_answer_times = _loc_1[4];
        ///     _loc_2.tol_answer_times = _loc_1[5];
        ///     _loc_2.joinCount = _loc_1[6];
        /// Line 9 in Mod_TravelEvent_Base.as
        ///     public static const SUCCESS:int = 2;
        /// Example: [37,"鬼谷子传人在此开山收徒，传授奇门遁甲，玄道法术。\n",[[54,"B","专心修仙之道，不走歪路。\r\n"],[52,"A","拜师学艺，练就一身奇术。\r\n"]],2,0,5,9]
        /// Example: [0,"",[],1,0,0,0]
        /// </summary>
        public JArray GetEventAndAnswer()
        {
            done.Reset();
            Send(null, 21, 1);
            done.WaitOne();
            return response;
        }//GetEventAndAnswer

        /// <summary>
        /// 仙旅秘宝（每完成5天的仙旅奇缘可抽取一次仙旅秘宝）
        /// Mod_TravelEvent_Base.lottery_draw(21,4)
        /// module:21, action:4
        /// request:[]
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]
        /// Line 64-65 in TravelEventData.as
        ///     this.drawResult = param1[0];
        ///     this.awardArray = param1[1];
        /// Line 9 in Mod_TravelEvent_Base.as
        ///     public static const SUCCESS:int = 2;
        /// </summary>
        public JArray LotteryDraw()
        {
            done.Reset();
            Send(null, 21, 4);
            done.WaitOne();
            return response;
        }//GetEventAndAnswer

        /// <summary>
        /// Mod_TravelEvent_Base.answer_travel_event(21,2)
        /// module:21, action:2
        /// request:[Utils.IntUtil, Utils.IntUtil]
        /// ?
        /// response:[Utils.StringUtil, [Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 31-37 in TravelEventController.as
        ///     _loc_2.eventId = _loc_1[0];
        ///     _loc_2.event = _loc_1[1];
        ///     _loc_2.answerList = this.renderAnswer(_loc_1[2]);
        ///     _loc_2.msg = _loc_1[3];
        ///     _loc_2.cur_answer_times = _loc_1[4];
        ///     _loc_2.tol_answer_times = _loc_1[5];
        ///     _loc_2.joinCount = _loc_1[6];
        /// </summary>
        public JArray AnswerTravelEvent(int eventId, int answerId)
        {
            done.Reset();
            Send(new JArray { eventId, answerId }, 21, 2);
            done.WaitOne();
            return response;
        }//AnswerTravelEvent

        // -------------------------------------------------------------------------------------------
        // 魔王试炼
        // -------------------------------------------------------------------------------------------
        /// <summary>
        /// 领取道行奖励
        /// Mod_BeelzebubTrials_Base.get_moral_award(57,24)
        /// module:57, action:24
        /// request:[Utils.IntUtil]
        /// Line 170 in BeelzebubTrialsTeamCreatView.as
        ///     _data.call(Mod_BeelzebubTrials_Base.get_moral_award, this.onGetAwardBack, [0]);
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]
        /// Line 787-199 in BeelzebubTrialsData.as
        ///     this.moralObj.result = param1[0];
        ///     if (this.moralObj.result == Mod_BeelzebubTrials_Base.SUCCESS)
        ///     {
        ///         this.moralObj.bGet = true;
        ///         this.moralAwardItems = new Array();
        ///         for each (_loc_2 in param1[1])
        ///         {
        ///             
        ///             _loc_3 = {};
        ///             oObject.list(_loc_2, _loc_3, ["item_id", "count"]);
        ///             this.moralAwardItems.push(_loc_3);
        ///         }
        ///     }
        /// Line 12 in .as
        ///     public static const SUCCESS:int = 5;
        /// </summary>
        public JArray GetMoralAward()
        {
            done.Reset();
            Send(new JArray { 0 }, 57, 24);
            done.WaitOne();
            return response;
        }//GetMoralAward

        // -------------------------------------------------------------------------------------------
        // 叶公好龙
        // -------------------------------------------------------------------------------------------
        /// <summary>
        /// 打开叶公好龙
        /// Mod_PetAnimal_Base.pet_animal_info(48,0)
        /// module:48, action:0
        /// request:[Utils.IntUtil]
        /// response:[Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 19 in PetAnimalData.as
        ///     this.info.reset(param1[1], param1[2], param1[3], param1[4]);
        /// Line 44-55 in PetAnimalData.as
        ///     public function reset(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0) : void
        ///     {
        ///         this.lv = param1;
        ///         this.star = param2;
        ///         this.isUpStar = false;
        ///         this.isUpLv = false;
        ///         this.exp = param3;
        ///         this.expAdd = 0;
        ///         this.expMax = PetType.getExp(param1, param2);
        ///         this.feedNum = param4;
        ///         return;
        ///     }// end function
        /// </summary>
        public JArray PetAnimalInfo()
        {
            done.Reset();
            Send(new JArray { _playerId }, 48, 0);
            done.WaitOne();
            return response;
        }//PetAnimalInfo

        /// <summary>
        /// 普通培养
        /// Mod_PetAnimal_Base.feed_pet_animal(48,2)
        /// module:48, action:2
        /// request:[Utils.ByteUtil]
        /// response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil]
        /// Line 25-29 in PetAnimalData.as
        ///     this.result = param1[0];
        ///     if (this.result == Mod_PetAnimal_Base.SUCCESS)
        ///     {
        ///         this.info.feed(param1[1], param1[2], param1[3], param1[4], param1[5], param1[6], param1[7]);
        ///     }
        /// Line 57-70 in PetAnimalData.as
        ///     public function feed(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
        ///     {
        ///         this.isUpStar = this.star != param2;
        ///         this.isUpLv = false;
        ///         this.lv = param1;
        ///         this.star = param2;
        ///         this.feedType = param5;
        ///         this.hit = param7;
        ///         this.exp = param3;
        ///         this.expAdd = param4;
        ///         this.expMax = PetType.getExp(param1, param2);
        ///         this.feedNum = param6;
        ///         return;
        ///     }// end function
        /// Line 7 in .as
        ///     public static const SUCCESS:int = 0;
        /// </summary>
        public JArray FeedPetAnimal()
        {
            done.Reset();
            Send(new JArray { 0 }, 48, 2);
            done.WaitOne();
            return response;
        }//FeedPetAnimal

        // -------------------------------------------------------------------------------------------
        // 猎妖
        // -------------------------------------------------------------------------------------------
        /// <summary>
        /// 打开猎妖
        /// Mod_HuntDemon_Base.open_hunt_demon(105,1)
        /// module:105, action:1
        /// request:[Utils.ByteUtil]
        /// Line 83 in HuntDemonView.as
        ///     _data.call(Mod_HuntDemon_Base.open_hunt_demon, this.loadAsset, [1]);
        /// response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.IntUtil]]
        /// Line 47-63 in HuntDemonData.as
        ///     this._free_times = uint(param1[0]);
        ///     this._coin_times = uint(param1[1]);
        ///     this._ingot_times = uint(param1[2]);
        ///     this._need_ingot = uint(param1[3]);
        /// </summary>
        public JArray OpenHuntDemon()
        {
            done.Reset();
            Send(new JArray { 1 }, 105, 1);
            done.WaitOne();
            return response;
        }//OpenHuntDemon

        /// <summary>
        /// 猎妖
        /// Mod_HuntDemon_Base.hunt_demon(105,2)
        /// module:105, action:2
        /// request:[Utils.ByteUtil, Utils.ByteUtil]
        /// Line 212 in HuntDemonView.as
        ///     // sendFreeFun
        ///     _data.call(Mod_HuntDemon_Base.hunt_demon, this.huntCallBack, [0, param1]);
        /// Line 196 in HuntDemonView.as
        ///     // sendCommonFun
        ///     _data.call(Mod_HuntDemon_Base.hunt_demon, this.huntCallBack, [1, param1]);
        /// Line 261 in HuntDemonView.as
        ///     // sendIngotFun
        ///     _data.call(Mod_HuntDemon_Base.hunt_demon, huntCallBack, [2, itemType]);
        /// response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, [Utils.ByteUtil, Utils.IntUtil]]
        /// Line 84-93 in HuntDemonData.as
        ///     this._hunt_demon_result = param1[0];
        ///     if (this._hunt_demon_result != Mod_HuntDemon_Base.SUCCESS)
        ///     {
        ///         return;
        ///     }
        ///     this._hunt_demon_is_lucky = param1[2];
        ///     this._free_times = param1[3];
        ///     this._coin_times = param1[4];
        ///     this._ingot_times = param1[5];
        ///     this._need_ingot = param1[6];
        /// Line 12 in Mod_HuntDemon_Base.as
        ///     public static const SUCCESS:int = 5;
        /// </summary>
        public JArray HuntDemon(byte type)
        {
            done.Reset();
            Send(new JArray { type, 0 }, 105, 2);
            done.WaitOne();
            return response;
        }//HuntDemon

        // -------------------------------------------------------------------------------------------
        // 觉醒
        // -------------------------------------------------------------------------------------------
        /// <summary>
        /// 打开禁地之书
        /// Mod_Awake_Base.player_forbidden_book_info(199,11)
        /// module:199, action:11
        /// request:[]
        /// response:[[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil], Utils.IntUtil]
        /// Line 123 in AwakeData.as
        ///     oObject.list(_loc_4, _loc_3, ["forbidden_type", "explore_type", "cost_coin", "cost_ingot", "cur_number", "total_number", "next_free_time"]);
        /// Line 23-27 in Mod_Awake_Base.as
        ///     public static const MORTAL:int = 16;  // 人间
        ///     public static const REGULUS:int = 17; // 轩辕
        ///     public static const ANCIENT:int = 18; // 上古
        ///     public static const ONCE:int = 19;
        ///     public static const MULTI:int = 20;
        /// Example: [[[17,19,0,0,0,21,1509897600],[16,19,0,0,0,21,1509897600],[16,20,0,100,0,20,0],[18,19,0,0,0,21,1509897600],[18,20,0,300,0,20,0],[17,20,0,200,0,20,0]],0]
        ///          [[[17,19,0,0,0,21,1509897600],[16,19,500000,0,0,20,1509897600],[16,20,0,100,0,20,0],[18,19,0,0,0,21,1509897600],[18,20,0,300,0,20,0],[17,20,0,200,0,20,0]],0]
        ///          [[[17,19,0,0,0,21,1509897600],[16,19,500000,0,0,20,1509897600],[16,20,0,100,0,20,0],[18,19,0,30,0,20,1509897600],[18,20,0,300,0,20,0],[17,20,0,200,0,20,0]],0]
        ///          [[[17,19,0,20,0,20,1509897600],[16,19,500000,0,0,20,1509897600],[16,20,0,100,0,20,0],[18,19,0,30,0,20,1509897600],[18,20,0,300,0,20,0],[17,20,0,200,0,20,0]],0]
        /// </summary>
        public JArray PlayerForbiddenBookInfo()
        {
            done.Reset();
            Send(null, 199, 11);
            done.WaitOne();
            return response;
        }//PlayerForbiddenBookInfo

        /// <summary>
        /// 探索禁地之书
        /// Mod_Awake_Base.explore_forbidden_book(199,12)
        /// module:199, action:12
        /// request:[Utils.UByteUtil, Utils.UByteUtil]
        /// Line 224 in AwakeForbiddenBookView.as
        ///     this.explore_forbidden_book(forbiddenType, timesType, this.exploreForbiddenBookCallBack);
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil]]
        /// Line 143,150 in AwakeData.as
        ///     this._exploreForbiddenBookObj.result = param1[0];
        ///     oObject.list(_loc_4, _loc_3, ["player_awake_id", "item_id", "grid_id", "level", "resolve_price", "number"]);
        /// Line 12,23-27 in Mod_Awake_Base.as
        ///     public static const SUCCESS:int = 5;
        ///     public static const MORTAL:int = 16;  // 人间
        ///     public static const REGULUS:int = 17; // 轩辕
        ///     public static const ANCIENT:int = 18; // 上古
        ///     public static const ONCE:int = 19;
        ///     public static const MULTI:int = 20;
        /// Example: Send data: [16,19]
        ///          Receive data: [5,[[0,2924,0,0,0,1]]]
        ///          Send data: [18,19]
        ///          Receive data: [5,[[0,2909,0,0,0,1]]]
        ///          Send data: [17,19]
        ///          Receive data: [5,[[0,2912,0,0,0,1]]]
        /// </summary>
        public JArray ExploreForbiddenBook(byte forbiddenType)
        {
            done.Reset();
            Send(new JArray { forbiddenType, 19 }, 199, 12);
            done.WaitOne();
            return response;
        }//ExploreForbiddenBook

        // -------------------------------------------------------------------------------------------
        // 吉星高照
        // -------------------------------------------------------------------------------------------
        //吉星高照-获取状态
        /// <summary>
        /// 吉星高照-获取状态
        /// Mod_RollCake_Base.get_state(38,5)
        /// module:38, action:5
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil]
        /// Line 146-147,152 in RollCakeController.as
        ///     _loc_2.msg = param1[0];
        ///     _loc_2.type = param1[1];
        ///     _loc_2.rerollIngot = param1[2];
        /// Line 11-12 in Mod_RollCake_Base.as
        ///     public static const NO_RECORD:int = 4;
        ///     public static const HAVE_RECORD:int = 5;
        /// From roll_cake.txt
        ///     [{"1":["空","平安","300","0","0"],"2":["一秀","一吉","500","0","0"],"3":["二举","二吉","1300","0","0"],"4":["四进","大运","0","0","50000"],"5":["三红","三吉","5000","3","0"],"6":["对堂","福禄寿","0","0","200000"],"7":["状元","大吉大利","17000","7","0"],"8":["五子","五子登科","0","0","300000"],"9":["五王","吉祥如意","50000","13","0"],"10":["六子","洪福齐天","0","0","500000"],"11":["六王","吉星高照","130000","19","0"],"12":["状元插金花","大吉大利","0","0","0"],"13":["四进1","寿比南山","0","0","50000"],"14":["四进2","财源滚滚","0","0","60000"],"15":["四进3","平步青云","0","0","70000"],"16":["四进4","万事如意","0","0","80000"],"17":["四进5","招财进宝","0","0","100000"]},
        ///      {"1":["运","云"],"2":["财","元宝"],"3":["寿","蟠桃"],"4":["吉","文字吉"],"5":["福","如意"],"6":["禄","铜钱"]}]
        /// Example
        ///     [4,0,0,0,0,0,0,0,0]
        ///     [5,2,10,1,4,5,6,6,5] // 一吉
        ///     [5,2,10,5,4,6,5,1,5] // 一吉
        ///     [5,2,10,2,4,5,2,2,3] // 一吉
        ///     [5,2,10,3,4,3,5,6,5] // 一吉
        ///     [5,3,10,5,4,3,4,6,2] // 二吉
        /// </summary>
        public JArray RollCakeGetState()
        {
            done.Reset();
            Send(null, 38, 5);
            done.WaitOne();
            return response;
        }//RollCakeGetState

        //吉星高照-获取数量
        /// <summary>
        /// 吉星高照-获取数量
        /// Mod_RollCake_Base.get_count(38,2)
        /// module:38, action:2
        /// request:[]
        /// response:[Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]
        /// Line 47-50 in .as
        ///     _loc_2.count = _loc_1[0];       // 今日可投掷次数
        ///     _loc_2.freeRobeNum = _loc_1[1]; // 免费改运次数
        ///     _loc_2.robeMaxNum = _loc_1[2];
        ///     _loc_2.rollCount = _loc_1[3];
        /// Example
        ///     [10,9,99,5686]
        ///     [9,9,99,5690]
        ///     [7,8,99,5697]
        /// </summary>
        public JArray RollCakeGetCount()
        {
            done.Reset();
            Send(null, 38, 2);
            done.WaitOne();
            return response;
        }//RollCakeGetCount

        //吉星高照-掷骰子
        /// <summary>
        /// 吉星高照-掷骰子
        /// Mod_RollCake_Base.roll(38,0)
        /// module:38, action:0
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]
        /// Line 146-147,152 in RollCakeController.as
        ///     _loc_2.msg = param1[0];
        ///     _loc_2.type = param1[1];
        ///     _loc_2.rerollIngot = param1[2];
        /// Line 7 in Mod_RollCake_Base.as
        ///     public static const SUCCESS:int = 0;
        /// Example
        ///     [0,2,10,6,4,1,1,1,5,5690]
        ///     [0,2,10,1,3,6,4,2,6,5693]
        ///     [0,2,10,1,4,5,6,6,5,5697]
        /// </summary>
        public JArray RollCakeRoll()
        {
            done.Reset();
            Send(null, 38, 0);
            done.WaitOne();
            return response;
        }//RollCakeRoll

        //吉星高照-逆天改运
        /// <summary>
        /// 吉星高照-逆天改运
        /// Mod_RollCake_Base.reroll(38,3)
        /// module:38, action:3
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]
        /// Line 64,65,70,71 in .as
        ///     _loc_2.msg = param1[0];
        ///     _loc_2.type = param1[1];
        ///     _loc_2.canFree = param1[2];
        ///     _loc_2.rerollIngot = param1[3];
        /// Line 7 in Mod_RollCake_Base.as
        ///     public static const SUCCESS:int = 0;
        /// Example
        ///     [0,2,8,10,5,4,6,5,1,5,5697]
        ///     [0,2,7,10,2,4,5,2,2,3,5697]
        ///     [0,2,6,10,3,4,3,5,6,5,5697]
        ///     [0,3,5,10,5,4,3,4,6,2,5697]
        /// </summary>
        public JArray RollCakeReRoll()
        {
            done.Reset();
            Send(null, 38, 3);
            done.WaitOne();
            return response;
        }//RollCakeReRoll

        //吉星高照-收获
        /// <summary>
        /// 吉星高照-收获
        /// Mod_RollCake_Base.get_award(38,4)
        /// module:38, action:4
        /// request:[]
        /// response:[Utils.UByteUtil]
        /// Line 199 in RollCakeController.as
        ///     _loc_2.msg = _loc_1[0];
        /// Line 7 in Mod_RollCake_Base.as
        ///     public static const SUCCESS:int = 0;
        /// </summary>
        public JArray RollCakeGetAward()
        {
            done.Reset();
            Send(null, 38, 4);
            done.WaitOne();
            return response;
        }//RollCakeGetAward

        // -------------------------------------------------------------------------------------------
        // 帮派
        // -------------------------------------------------------------------------------------------
        // 打开帮派祭神
        /// <summary>
        /// 打开帮派祭神
        /// Mod_Faction_Base.faction_god_info(10,22)
        /// module:10, action:22
        /// request:[]
        /// response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        /// Line 448,461 in FactionController.as
        ///     oObject.list(this._data.faction.godInfo, _loc_1, ["faction_god_level", "faction_god_exp", "require_exp", "incense_count", "total_count", "is_cover"]);
        ///     oObject.list(_loc_3, _loc_1, ["player_id", "player_name", "incense_id", "exp", "time"]);
        /// Example: [3,2225,8000,0,1,0,[[355527,"庄恭春.s1",1,5,1503230585],[355527,"庄恭春.s1",1,5,1502965267],[355549,"董乘六.s1",1,5,1501820321],[355527,"庄恭春.s1",1,5,1503462256],[355527,"庄恭春.s1",1,5,1502541780],[355527,"庄恭春.s1",1,5,1503032889],[355553,"甄斐斐.s1",1,5,1501820337],[355527,"庄恭春.s1",1,5,1503315329]]]
        ///          [3,2230,8000,1,1,0,[[355527,"庄恭春.s1",1,5,1503230585],[355527,"庄恭春.s1",1,5,1509889809],[355527,"庄恭春.s1",1,5,1502965267],[355527,"庄恭春.s1",1,5,1503462256],[355527,"庄恭春.s1",1,5,1502541780],[355527,"庄恭春.s1",1,5,1503032889],[355553,"甄斐斐.s1",1,5,1501820337],[355527,"庄恭春.s1",1,5,1503315329]]]
        /// </summary>
        public JArray FactionGodInfo()
        {
            done.Reset();
            Send(null, 10, 22);
            done.WaitOne();
            return response;
        }//FactionGodInfo

        // 帮派上香
        /// <summary>
        /// 帮派上香
        /// Mod_Faction_Base.incense(10,23)
        /// module:10, action:23
        /// request:[Utils.IntUtil]
        /// response:[Utils.UByteUtil]
        /// Line 39 in .as
        ///     public static const SUCCESS:int = 32;
        /// </summary>
        public JArray Incense()
        {
            done.Reset();
            Send(new JArray { 1 }, 10, 23);
            done.WaitOne();
            return response;
        }//Incense

        // 获取七星封魔成员
        /// <summary>
        /// 获取七星封魔成员
        /// Mod_Faction_Base.seal_satan_member_list(10,34)
        /// module:10, action:34
        /// request:[]
        /// response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil]]
        /// </summary>
        public JArray SealSatanMemberList()
        {
            done.Reset();
            Send(null, 10, 34);
            done.WaitOne();
            return response;
        }//SealSatanMemberList

        // 加入七星封魔
        /// <summary>
        /// 加入七星封魔
        /// Mod_Faction_Base.join_seal_satan(10,28)
        /// module:10, action:28
        /// request:[]
        /// response:[Utils.UByteUtil]
        /// Line 61-62 in Mod_Faction_Base.as
        ///     public static const JOIN_SUCCESS:int = 54;
        ///     public static const IS_JOIN:int = 55;
        /// </summary>
        public JArray JoinSealSatan()
        {
            done.Reset();
            Send(null, 10, 28);
            done.WaitOne();
            return response;
        }//JoinSealSatan

        // 打开帮派吉星高照
        /// <summary>
        /// 打开帮派吉星高照
        /// Mod_Faction_Base.faction_roll_cake_info(10,45)
        /// module:10, action:45
        /// request:[]
        /// response:[Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil]]
        /// Line 698-702 in FactionController.as
        ///     _loc_2.weekBestScore = _loc_1[0];
        ///     _loc_2.todayBestScore = _loc_1[1];
        ///     _loc_2.remainTimes = _loc_1[2];
        ///     _loc_2.factionScore = _loc_1[3];
        ///     _loc_2.factionRCInfo = this.renderFactionRollCakeInfo(_loc_1[4]);
        /// </summary>
        public JArray FactionRollCakeInfo()
        {
            done.Reset();
            Send(null, 10, 45);
            done.WaitOne();
            return response;
        }//FactionRollCakeInfo

        // 帮派吉星高照-掷骰子
        /// <summary>
        /// 帮派吉星高照-掷骰子
        /// Mod_Faction_Base.roll_cake(10,46)
        /// module:10, action:46
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil], Utils.ByteUtil]
        /// Line 732-740 in FactionController.as
        ///     _loc_2.msg = _loc_1[0];
        ///     _loc_2.type = _loc_1[1];
        ///     _loc_2.typeName = RollCakeType.getRollCakeNickName(_loc_2.type);
        ///     _loc_2.coin = RollCakeType.getRollCakeCoin(_loc_2.type);
        ///     _loc_2.score = _loc_1[2];
        ///     _loc_2.todayScore = _loc_1[3];
        ///     _loc_2.numList = [];
        ///     var _loc_3:* = _loc_1[4];
        ///     _loc_2.remainTimes = _loc_1[5];
        /// Line 39 in Mod_Faction_Base.as
        ///     public static const SUCCESS:int = 32;
        /// </summary>
        public JArray RollCake()
        {
            done.Reset();
            Send(null, 10, 46);
            done.WaitOne();
            return response;
        }//RollCake

        // 打开帮派转盘
        /// <summary>
        /// 打开帮派转盘
        /// Mod_LuckyWheel_Base.open_lucky_wheel(69,1)
        /// module:69, action:1
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 23-24 in LuckyWheelData.as
        ///     _loc_1.faction_today_con = this._openInfo[1];
        ///     _loc_1.rosefinch_number = this._openInfo[2];
        /// </summary>
        public JArray OpenLuckyWheel()
        {
            done.Reset();
            Send(null, 69, 1);
            done.WaitOne();
            return response;
        }//OpenLuckyWheel

        // 帮派转盘-抽奖
        /// <summary>
        /// 帮派转盘-抽奖
        /// Mod_LuckyWheel_Base.start_lucky_wheel(69,2)
        /// module:69, action:2
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 36-38 in LuckyWheelData.as
        ///     _loc_1.type = this._runInfo[1];
        ///     _loc_1.rosefinch_number = this._runInfo[2];
        ///     _loc_1.item_id = this._runInfo[3];
        /// </summary>
        public JArray StartLuckyWheel()
        {
            done.Reset();
            Send(null, 69, 2);
            done.WaitOne();
            return response;
        }//StartLuckyWheel





        private void Callback(JArray data)
        {
            response = data;
            done.Set();
        }//Callback











    }//class SxdClientTown


}//namespace