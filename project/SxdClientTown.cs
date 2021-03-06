﻿using System;
using System.Collections.Generic;
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
        public int Login(string playPage)
        {
            var match1 = Regex.Match(playPage, @"""&player_name=(.*)""[\s\S]*""&hash_code=(.*)""[\s\S]*""&time=(.*)""[\s\S]*""&ip=(.*)""[\s\S]*""&port=(.*)""[\s\S]*""&server_id=(.*)""[\s\S]*""&source=(.*)""[\s\S]*""&regdate=(.*)""[\s\S]*""&id_card=(.*)""[\s\S]*""&open_time=(.*)""[\s\S]*""&is_newst=(.*)""[\s\S]*""&stage=(.*)""[\s\S]*""&client=(.*)""");
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
                receiveDone.WaitOne(timeout);
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
            done.WaitOne(timeout);

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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
            return response;
        }//PlantHerbs

        // 收获
        /// <summary>
        /// Mod_Farm_Base.harvest(13,6)
        /// module:13, action:6
        /// R162: request:[Utils.IntUtil]
        /// R164: request:[Utils.IntUtil, Utils.UByteUtil]
        /// Line 883 in FarmNewView.as
        ///     this._data.call(Mod_Farm_Base.harvest, callBack, [intfarmlandId, isDouble ? (Mod_Farm_Base.IS_DOUBLE) : (Mod_Farm_Base.NO_DOUBLE)]);
        /// Line 21-22 in Mod_Farm_Base.as
        ///     public static const IS_DOUBLE:int = 14;
        ///     public static const NO_DOUBLE:int = 15;
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
            Send(new JArray { fieldId, 15 }, 13, 6);
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
            return response;
        }//GetHeroMissionList

        // 开始扫荡
        /// <summary>
        /// 开始扫荡
        /// Mod_HeroMission_Base.start_practice(35,2)
        /// module:35, action:2
        /// request:[Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil]
        /// Example
        ///     [35,1,0]
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
        /// Example
        ///     [3,1]
        /// </summary>
        public JArray StartPractice(int townId, byte autoNum, byte heroType)
        {
            done.Reset();
            Send(new JArray { townId, autoNum, heroType }, 35, 2);
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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

        // -------------------------------------------------------------------------------------------
        // 竞技场
        // -------------------------------------------------------------------------------------------
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
            return response;
        }//StartChallenge

        // -------------------------------------------------------------------------------------------
        // 小助手
        // -------------------------------------------------------------------------------------------
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
            return response;
        }//AssistantGetAward

        // -------------------------------------------------------------------------------------------
        // 钓鱼
        // -------------------------------------------------------------------------------------------
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
            return response;
        }//DoFishing

        // -------------------------------------------------------------------------------------------
        // 仙旅奇缘
        // -------------------------------------------------------------------------------------------
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
            return response;
        }//GetMoralAward

        // -------------------------------------------------------------------------------------------
        // 叶公好龙
        // -------------------------------------------------------------------------------------------
        // 打开叶公好龙
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
            done.WaitOne(timeout);
            return response;
        }//PetAnimalInfo

        // 普通培养
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
            done.WaitOne(timeout);
            return response;
        }//FeedPetAnimal

        // 进化
        /// <summary>
        /// 普通培养
        /// Mod_PetAnimal_Base.up_pet_animal(48,3)
        /// module:48, action:3
        /// request:[]
        /// response:[Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil]
        /// Line 74,75,78 in PetLongInfo
        ///     this.lv = param1;
        ///     this.star = param2;
        ///     this.exp = param3;
        /// Example
        ///     [9,1,43402]
        /// </summary>
        public JArray UpPetAnimal()
        {
            done.Reset();
            Send(null, 48, 3);
            done.WaitOne(timeout);
            return response;
        }//UpPetAnimal

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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
            return response;
        }//RollCakeGetAward

        // -------------------------------------------------------------------------------------------
        // 混沌虚空
        // -------------------------------------------------------------------------------------------
        // 打开混沌虚空
        /// <summary>
        /// 打开混沌虚空
        /// Mod_SpaceFind_Base.open_space_find(123,0)
        /// module:123, action:0
        /// request:[]
        /// response:[Utils.ShortUtil, Utils.IntUtil, Utils.ShortUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil, Utils.UByteUtil]
        /// Line 20 in SpaceFindController.as
        ///     oObject.list(_loc_2, _loc_1, ["count", "item_id", "golden", "be_app_nickname", "can_buy_count", "integral", "useType"]);
        /// Example
        ///     [4,0,5,"",20,0,0]
        /// </summary>
        public JArray OpenSpaceFind()
        {
            done.Reset();
            Send(null, 123, 0);
            done.WaitOne(timeout);
            return response;
        }//OpenSpaceFind

        // 寻找异兽
        /// <summary>
        /// 寻找异兽
        /// Mod_SpaceFind_Base.do_space_find(123,1)
        /// module:123, action:1
        /// request:[Utils.UByteUtil]
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.UByteUtil]
        /// Line 34 in SpaceFindController.as
        ///     oObject.list(_loc_2, _loc_1, ["result", "item_id", "golden", "integral", "useType"]);
        /// Line 9 in Mod_SpaceFind_Base.as
        ///     public static const SUCCESS:int = 2;
        /// Example
        ///     [2,1831,5,0,0]
        /// </summary>
        public JArray DoSpaceFind()
        {
            done.Reset();
            Send(new JArray { 0 }, 123, 1);
            done.WaitOne(timeout);
            return response;
        }//DoSpaceFind

        // 抓捕异兽
        /// <summary>
        /// 抓捕异兽
        /// Mod_SpaceFind_Base.get_space_find(123,2)
        /// module:123, action:2
        /// request:[]
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil]
        /// Line 44 in SpaceFindController.as
        ///     oObject.list(_loc_2, _loc_1, ["result", "find_goods", "count", "can_buy_count"]);
        /// Line 9 in Mod_SpaceFind_Base.as
        ///     public static const SUCCESS:int = 2;
        /// Example
        ///     [2,[[5117,1],[1845,4],[1861,1]],3,20]
        /// </summary>
        public JArray GetSpaceFind()
        {
            done.Reset();
            Send(null, 123, 2);
            done.WaitOne(timeout);
            return response;
        }//GetSpaceFind

        // -------------------------------------------------------------------------------------------
        // 五行天仪
        // -------------------------------------------------------------------------------------------
        // 打开五行天仪
        /// <summary>
        /// 打开五行天仪
        /// Mod_Laba_Base.laba_info(172,0)
        /// module:172, action:0
        /// request:[]
        /// response:[Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil]
        /// Line 29-46 in LabaData.as
        ///     _loc_1.free_count = this._aryLabaInfo[0];
        ///     _loc_1.coin_count = this._aryLabaInfo[1];
        ///     _loc_1.ingot_count = this._aryLabaInfo[2];
        ///     _loc_1.ten_ingot_count = this._aryLabaInfo[3];
        ///     _loc_1.score = this._aryLabaInfo[4];
        ///     if (this._aryLabaInfo.length > 5)
        ///     {
        ///         for each (_loc_3 in this._aryLabaInfo[5])
        ///         {
        ///             _loc_4 = {};
        ///             _loc_4.scrap_id = _loc_3[0];
        ///             _loc_4.number = _loc_3[1];
        ///             _loc_2.push(_loc_4);
        ///         }
        ///     }
        ///     _loc_1.scrapArr = _loc_2;
        ///     _loc_1.proficiency = this._aryLabaInfo[6];
        /// Example
        ///     [1,9,0,0,380,[[10,2],[9,1],[7,1],[4,2],[5,2],[6,2],[2,2],[1,1],[8,4],[3,0]],410]
        /// </summary>
        public JArray LabaInfo()
        {
            done.Reset();
            Send(null, 172, 0);
            done.WaitOne(timeout);
            return response;
        }//LabaInfo

        // 五行天仪-转一次
        /// <summary>
        /// 五行天仪-转一次
        /// Mod_Laba_Base.draw(172,1)
        /// module:172, action:1
        /// request:[Utils.UByteUtil]
        /// response:[Utils.UByteUtil, [[Utils.ByteUtil]], Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil]
        /// Line 60-93 in LabaData.as
        ///     _loc_1.result = this._aryDraw[0];
        ///     if (this._aryDraw.length > 1)
        ///     {
        ///         for each (_loc_5 in this._aryDraw[1])
        ///         {
        ///             _loc_3 = [];
        ///             for each (_loc_6 in _loc_5[0])
        ///                 _loc_3.push(_loc_6[0]);
        ///             _loc_2.push(_loc_3);
        ///         }
        ///     }
        ///     _loc_1.newScrapArr = _loc_2;
        ///     _loc_1.score = this._aryDraw[2];
        ///     _loc_1.free_count = this._aryDraw[3];
        ///     _loc_1.coin_count = this._aryDraw[4];
        ///     _loc_1.ingot_count = this._aryDraw[5];
        ///     _loc_1.ten_ingot_count = this._aryDraw[6];
        ///     if (this._aryDraw.length > 7)
        ///     {
        ///         for each (_loc_7 in this._aryDraw[7])
        ///         {
        ///             _loc_8 = {};
        ///             _loc_8.scrap_id = _loc_7[0];
        ///             _loc_8.number = _loc_7[1];
        ///             _loc_4.push(_loc_8);
        ///         }
        ///     }
        ///     _loc_1.scrapArr = _loc_4;
        ///     _loc_1.proficiency = this._aryDraw[8];
        /// Line 9 in Mod_Laba_Base.as
        ///     public static const SUCCESS:int = 2;
        /// Example
        ///     [2,[[[[9],[5],[9]]]],380,0,9,0,0,[[10,2],[9,2],[7,1],[4,2],[5,2],[6,2],[2,2],[1,1],[8,4],[3,0]],416]
        /// </summary>
        public JArray LabaDraw()
        {
            done.Reset();
            Send(new JArray { 0 }, 172, 1);
            done.WaitOne(timeout);
            return response;
        }//LabaDraw

        // -------------------------------------------------------------------------------------------
        // 好友
        // -------------------------------------------------------------------------------------------
        // 好友列表
        /// <summary>
        /// 好友列表
        /// Mod_Friend_Base.get_friend_list(9,5)
        /// module:9, action:5
        /// request:[Utils.UByteUtil]
        /// Line 21 in Mod_Friend_Base.as
        ///     public static const FRIEND:int = 14;
        /// Example
        ///     [14]
        /// response:[[Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]]
        /// Line 194,195,201,203,220,228,229,231,254-256 in FriendController.as
        ///     _loc_4.id = param1[_loc_3][0];
        ///     _loc_4.msgNum = param1[_loc_3][2];
        ///     _loc_4.name = param1[_loc_3][1];
        ///     if (param1[_loc_3][3] == Mod_Friend_Base.ONLINE)
        ///     _loc_4.missionId = param1[_loc_3][4];
        ///     _loc_4.isGm = param1[5] == 3;
        ///     _loc_4.isStart = param1[6] == 1;
        ///     _loc_4.isMate = param1[_loc_3][10] == 1;
        ///     _loc_4.vipLevel = param1[_loc_3][7];
        ///     _loc_4.sex = RoleType.getRoleGender(param1[_loc_3][8]);
        ///     _loc_4.isFavourite = param1[_loc_3][9] == 1;
        /// Example
        ///     [[[288299,"度日如年.s1",0,18,1585,0,0,0,104,0,0],[355527,"庄恭春.s1",0,18,959,0,0,0,5,1,0],[355553,"甄斐斐.s1",0,18,843,0,0,0,104,0,0],[355546,"郎森三.s1",0,18,790,0,0,0,104,0,0],[355548,"和謇暴.s1",0,18,779,0,0,0,3,0,0],[355549,"董乘六.s1",0,18,832,0,0,0,107,0,0],[355547,"高千字.s1",0,18,784,0,0,0,104,0,0]]]
        /// </summary>
        public JArray GetFriendList()
        {
            done.Reset();
            Send(new JArray { 14 }, 9, 5);
            done.WaitOne(timeout);
            return response;
        }//GetFriendList

        // -------------------------------------------------------------------------------------------
        // 送花
        // -------------------------------------------------------------------------------------------
        // 打开送花界面
        /// <summary>
        /// 打开送花界面
        /// Mod_SendFlower_Base.player_send_flower_info(31,0)
        /// module:31, action:0
        /// request:[Utils.IntUtil]
        /// Example
        ///     [288299]
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        /// Line 86 in SendFlowerData.as
        ///     oObject.list(param1, this._objSendFlowerInfo, [0."result", 1."player_id", 2."nickname", 3."role_id", 4."max_player_id", 5."max_nickname", 6."max_flower_count", 7."total_flower_count", 8."is_can_send"]);
        /// Line 7,10 in Mod_SendFlower_Base.as
        ///     public static const SUCCESS:int = 0;
        ///     public static const YES:int = 3;
        /// Example
        ///     [0,288299,"度日如年.s1",104,355527,"庄恭春.s1",185,1537,3,[[355368,"绝色倾城.s1",102,1,1508580324],[302649,"Nina.s1",102,1,1507288193],[302649,"Nina.s1",102,1,1507898289],[302649,"Nina.s1",102,1,1504796445],[302649,"Nina.s1",102,1,1510238398],[302649,"Nina.s1",102,1,1509709692],[302649,"Nina.s1",102,1,1507134640],[302649,"Nina.s1",102,1,1504266634],[302649,"Nina.s1",102,1,1510456629],[302649,"Nina.s1",102,1,1508941521],[302649,"Nina.s1",102,1,1508767889],[302649,"Nina.s1",102,1,1503588659],[302649,"Nina.s1",102,1,1509623913],[302649,"Nina.s1",102,1,1509893209],[302649,"Nina.s1",102,1,1508857031],[302649,"Nina.s1",102,1,1510066521],[302649,"Nina.s1",102,1,1503764593],[302649,"Nina.s1",102,1,1503924178],[302649,"Nina.s1",102,1,1505658803],[302649,"Nina.s1",102,1,1508683191]]]
        /// </summary>
        public JArray PlayerSendFlowerInfo(int playerId)
        {
            done.Reset();
            Send(new JArray { playerId }, 31, 0);
            done.WaitOne(timeout);
            return response;
        }//PlayerSendFlowerInfo

        // 送花
        /// <summary>
        /// 送花
        /// Mod_SendFlower_Base.send_player_flower(31,1)
        /// module:31, action:1
        /// request:[Utils.IntUtil, Utils.IntUtil]
        /// Example
        ///     [288299,1]
        /// response:[Utils.UByteUtil]
        /// Line 7 Mod_SendFlower_Base.as
        ///     public static const SUCCESS:int = 0;
        /// Example
        ///     [0]
        /// </summary>
        public JArray SendPlayerFlower(int playerId)
        {
            done.Reset();
            Send(new JArray { playerId, 1 }, 31, 1);
            done.WaitOne(timeout);
            return response;
        }//SendPlayerFlower

        // -------------------------------------------------------------------------------------------
        // 猎命
        // -------------------------------------------------------------------------------------------
        // 猎命NPC
        /// <summary>
        /// 猎命NPC
        /// Mod_Fate_Base.get_fate_npc(22,0)
        /// module:22, action:0
        /// request:[]
        /// response:[Utils.ByteUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.IntUtil]
        /// Line 33,34,40-86 in FateController.as
        ///     _loc_2.freeAppointTimes = _loc_1[0];
        ///     var _loc_3:* = this.renderFateNpc(_loc_1[1], _loc_1[2]);
        ///     private function renderFateNpc(param1:Array, param2:int) : Array
        ///     {
        ///         var _loc_8:* = null;
        ///         var _loc_3:* = [];
        ///         var _loc_4:* = 0;
        ///         var _loc_5:* = 0;
        ///         var _loc_6:* = param1.length;
        ///         var _loc_7:* = 0;
        ///         while (_loc_7 《 _loc_6)
        ///         {
        ///             _loc_8 = {};
        ///             _loc_8.fateNpcId = param1[_loc_7][0];
        ///             _loc_8.status = param1[_loc_7][1];
        ///             _loc_8.url = URI.getRoleIconUrl("Npc" + _loc_8.fateNpcId);
        ///             _loc_8.canBuyTimer = param1[_loc_7][2];
        ///             _loc_8.maxBuyTimes = param1[_loc_7][3];
        ///             _loc_8.buyPrice = param1[_loc_7][4];
        ///             if (_loc_8.status == 1)
        ///             {
        ///                 if (_loc_4 《= _loc_8.fateNpcId)
        ///                 {
        ///                     _loc_4 = _loc_8.fateNpcId;
        ///                     if (_loc_3.length > 0)
        ///                     {
        ///                         _loc_3[_loc_5].isShowChat = false;
        ///                     }
        ///                     _loc_5 = _loc_7;
        ///                     _loc_8.isShowChat = true;
        ///                 }
        ///             }
        ///             if (_loc_8.fateNpcId == 4)
        ///             {
        ///                 _loc_8.isBuy = true;
        ///             }
        ///             else
        ///             {
        ///                 _loc_8.isBuy = false;
        ///             }
        ///             _loc_8.isVip5 = VIPType.check(VIPType.Level1);
        ///             _loc_8.npcName = FateType.getNPCName(_loc_8.fateNpcId);
        ///             _loc_8.coins = int(FateType.getNPCFee(_loc_8.fateNpcId) * param2 / 100);
        ///             _loc_3.push(_loc_8);
        ///             _loc_7++;
        ///         }
        ///         return _loc_3;
        ///     }// end function
        /// Example
        ///     [0,[[3,0,0,0,0],[1,1,0,0,0],[2,1,0,0,0],[5,0,0,0,0],[4,0,0,0,0]],100] // 0:免费猎命次数, 周一仙和小仙女亮灯
        /// </summary>
        public JArray GetFateNpc()
        {
            done.Reset();
            Send(null, 22, 0);
            done.WaitOne(timeout);
            return response;
        }//GetFateNpc

        // 猎命
        /// <summary>
        /// 猎命
        /// Mod_Fate_Base.appoint_fate_npc(22,9)
        /// module:22, action:9
        /// request:[Utils.ByteUtil]
        /// Line 317 in LodgeView.as
        ///     this.appoint_fate_npc(_loc_1.fateNpcId);
        /// Line 9 in FateType.as
        ///     private static const FateNPCs:Object = {1:["周一仙", 8000, 100, "升级周一仙后，命格等级上限提升至14级。"], 2:["小仙女", 10000, 300, "升级小仙女后，命格等级上限提升至16级。"], 3:["左慈", 20000, 500, "升级左慈后，命格等级上限提升至18级。"], 4:["张道陵", 40000, 800, "升级张道陵后，命格等级上限提升至20级。"], 5:["姜子牙", 60000, 1000, "升级姜子牙后，增加2个命格槽数，可通过姜子牙
        /// Example
        ///     [1] // 周一仙
        /// response:[Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil]
        /// Line 473-476 in 
        ///     _loc_2.msg = _loc_1[0];
        ///     _loc_2.fateId = _loc_1[1];
        ///     _loc_2.fateNpcId = _loc_1[2];
        ///     _loc_2.tempFateId = _loc_1[3];
        /// Line 7 in 
        ///     public static const SUCCESS:int = 0;
        /// Example
        ///     [0,9,2,179443692] // 0:SUCCESS, 9:千年未竟, 2:小仙女, 179443692:tempFateId
        /// </summary>
        public JArray AppointFateNpc(byte fateNpcId)
        {
            done.Reset();
            Send(new JArray { fateNpcId }, 22, 9);
            done.WaitOne(timeout);
            return response;
        }//AppointFateNpc

        // 猎命-命格空间
        /// <summary>
        /// 猎命-命格空间
        /// Mod_Fate_Base.get_temp_fate(22,1)
        /// module:22, action:1, 
        /// request:[], 
        /// response:[[Utils.LongUtil, Utils.ShortUtil]]
        /// Line 104-105 in FateController.as
        ///     _loc_5.tempFateId = param1[_loc_4][0];
        ///     _loc_5.fateId = param1[_loc_4][1];
        /// Example
        ///     [[[860607932,5],[861505872,21],[860948584,9],[860412713,21],[860438938,1],[861530824,9],[860850599,21],[861383470,25],[860922394,21],[861027827,9],[861091942,21],[860466931,2],[860672434,25],[860729962,5],[860589597,8],[861431831,2],[861278808,9],[860994071,5],[860635144,7],[860892744,2]]]
        /// </summary>
        public JArray GetTempFate()
        {
            done.Reset();
            Send(null, 22, 1);
            done.WaitOne(timeout);
            return response;
        }//GetTempFate

        // 猎命-一键拾取
        /// <summary>
        /// 猎命-一键拾取
        /// Mod_Fate_Base.pickup_fate(22,2)
        /// module:22, action:2, 
        /// request:[[Utils.LongUtil]], 
        /// Example
        ///     [[[860412713],[860672434],[860850599],[860922394],[861091942],[861383470],[861505872]]]
        /// response:[Utils.UByteUtil, [Utils.LongUtil]]
        /// Line 7 in Mod_Fate_Base.as
        ///     public static const SUCCESS:int = 0;
        /// Example
        ///     [0,[[861505872],[861383470],[861091942],[860922394],[860850599],[860672434],[860412713]]]
        /// </summary>
        public JArray PickupFate(IEnumerable<long> tempFateIds)
        {
            done.Reset();
            var data = new JArray { new JArray() };
            foreach (var id in tempFateIds)
                ((JArray)data[0]).Add(new JArray(id));
            Send(data, 22, 2);
            done.WaitOne(timeout);
            return response;
        }//PickupFate

        // 猎命-一键卖出
        /// <summary>
        /// 猎命-一键卖出
        /// Mod_Fate_Base.sale_temp_fate(22,3)
        /// module:22, action:3, 
        /// request:[[Utils.LongUtil]], 
        /// Example
        ///     [[[860438938],[860466931],[860589597],[860607932],[860635144],[860729962],[860892744],[860948584],[860994071],[861027827],[861278808],[861431831],[861530824]]]
        /// response:[Utils.UByteUtil]
        /// Line 7 in Mod_Fate_Base.as
        ///     public static const SUCCESS:int = 0;
        /// Example
        ///     [0]
        /// </summary>
        public JArray SaleTempFate(IEnumerable<long> tempFateIds)
        {
            done.Reset();
            var data = new JArray { new JArray() };
            foreach (var id in tempFateIds)
                ((JArray)data[0]).Add(new JArray(id));
            Send(data, 22, 3);
            done.WaitOne(timeout);
            return response;
        }//SaleTempFate

        // 猎命-一键合成
        /// <summary>
        /// 猎命-一键合成
        /// Mod_Fate_Base.merge_all_in_bag(22,17)
        /// module:22, action:17, 
        /// request:[], 
        /// response:[]
        /// 不会有数据返回
        /// </summary>
        public void MergeAllInBag()
        {
            done.Reset();
            Send(null, 22, 17);
            //done.WaitOne(timeout);
            //return response;
        }//MergeAllInBag

        // -------------------------------------------------------------------------------------------
        // 周末水果机
        // -------------------------------------------------------------------------------------------
        // 周末水果机-活动状态
        /// <summary>
        /// 周末水果机-活动状态
        /// Mod_SundayFruit_Base.active_status(242,0)
        /// module:242, action:0
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 25-27 in SundayFruitData.as
        ///     this.sundayFruitInfo.status = param1[0];
        ///     this.sundayFruitInfo.start_time = param1[1];
        ///     this.sundayFruitInfo.end_time = param1[2];
        /// Line 7 in Mod_SundayFruit_Base.as
        ///     public static const YES:int = 0;
        /// Example
        ///     [0,1510934400,1511107199]
        /// </summary>
        public JArray SundayFruitActiveStatus()
        {
            done.Reset();
            Send(null, 242, 0);
            done.WaitOne(timeout);
            return response;
        }//ActiveStatus

        // 周末水果机-打开界面
        /// <summary>
        /// 周末水果机-打开界面
        /// Mod_SundayFruit_Base.sunday_fruit_info(242,1)
        /// module:242, action:1
        /// request:[]
        /// response:[Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        /// Line 33-34 in SundayFruitData.as
        ///     this.sundayFruitInfo.remain_draw_times = param1[0];
        ///     this.sundayFruitInfo.award_list = this.parseAwardList(param1[1]);
        /// Example
        ///     [9,[[15,4,1],[1,0,800000],[16,13,1],[27,34,2],[1,0,600000],[1,0,1000000],[10,0,1],[15,3,1],[16,5,1],[1,0,1500000],[1,0,1200000],[27,55,2],[12,3399,2],[12,347,10],[7,0,5],[27,71,1],[7,0,3],[3,0,100],[5,0,60000],[12,1488,5],[27,7,2],[25,0,1],[12,1411,1],[12,347,5]]]
        /// </summary>
        public JArray SundayFruitInfo()
        {
            done.Reset();
            Send(null, 242, 1);
            done.WaitOne(timeout);
            return response;
        }//SundayFruitInfo

        // 周末水果机-开始转
        /// <summary>
        /// 周末水果机-开始转
        /// Mod_SundayFruit_Base.draw(242,2)
        /// module:242, action:2
        /// request:[]
        /// response:[Utils.UByteUtil, [Utils.ByteUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        /// Line 40-42 in SundayFruitData.as
        ///     this.sundayFruitInfo.result = param1[0];
        ///     this.sundayFruitInfo.draw_fruit_list = param1[1];
        ///     this.sundayFruitInfo.draw_award_list = this.parseAwardList(param1[2]);
        /// Line 9 in Mod_SundayFruit_Base.as
        ///     public static const SUCCESS:int = 2;
        /// Example
        ///     [2,[[2],[4],[3]],[[1,0,1000000],[12,347,8],[5,0,30000]]]
        /// </summary>
        public JArray SundayFruitDraw()
        {
            done.Reset();
            Send(null, 242, 2);
            done.WaitOne(timeout);
            return response;
        }//SundayFruitDraw

        // -------------------------------------------------------------------------------------------
        // 五福临门
        // -------------------------------------------------------------------------------------------
        // 五福临门-是否开通
        /// <summary>
        /// 五福临门-是否开通
        /// Mod_FindImmortal_Base.is_five_blessings_open(68,14)
        /// module:68, action:14, 
        /// request:[], 
        /// response:[Utils.UByteUtil]
        /// Line 146 in FindImmortalData.as
        ///     this.fiveBlessingInfo.isOpen = param1[0] == Mod_FindImmortal_Base.YES;
        /// Line 18 in Mod_FindImmortal_Base.as
        ///     public static const YES:int = 11;
        /// </summary>
        public JArray IsFiveBlessingsOpen()
        {
            done.Reset();
            Send(null, 68, 14);
            done.WaitOne(timeout);
            return response;
        }//IsFiveBlessingsOpen

        // 五福临门-打开
        /// <summary>
        /// 五福临门-打开
        /// Mod_FindImmortal_Base.open_five_blessings(68,10)
        /// module:68, action:10
        /// request:[]
        /// response:[Utils.ShortUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil], Utils.ByteUtil]
        /// Line 152-156 in FindImmortalData.as
        ///     this.fiveBlessingInfo.bless_number = param1[0];
        ///     this.fiveBlessingInfo.stage = param1[1];
        ///     this.fiveBlessingInfo.award = this.parseAward(param1[2]);
        ///     this.fiveBlessingInfo.total_count = param1[3];
        /// Example
        ///     [8,0,[],20]
        ///     [7,1,[[3,600,3,0,0],[4,1200,0,2,1],[3,600,3,0,0],[5,1200,0,3,2],[4,1200,0,2,1]],20]
        ///     [7,0,[],20]
        ///     [6,1,[[3,600,3,0,0],[4,1200,0,2,1],[2,600,2,0,0],[2,600,2,0,0],[5,1200,0,3,2]],20]
        ///     [6,0,[],20]
        /// </summary>
        public JArray OpenFiveBlessings()
        {
            done.Reset();
            Send(null, 68, 10);
            done.WaitOne(timeout);
            return response;
        }//OpenFiveBlessings

        // 五福临门-画龙鱼
        /// <summary>
        /// 五福临门-画龙鱼
        /// Mod_FindImmortal_Base.start_bless(68,11)
        /// module:68, action:11
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]]
        /// Line 161-163 in FindImmortalData.as
        ///     this.fiveBlessingInfo.result = param1[0];
        ///     this.fiveBlessingInfo.stage = param1[1];
        ///     this.fiveBlessingInfo.award = this.parseAward(param1[2]);
        /// Line 7 in Mod_FindImmortal_Base.as
        ///     public static const SUCCESS:int = 0;
        /// Example
        ///     [0,1,[[5,1200,0,3,2],[4,1200,0,2,1],[3,600,3,0,0],[3,600,3,0,0],[4,1200,0,2,1]]]
        ///     [0,1,[[2,600,2,0,0],[4,1200,0,2,1],[3,600,3,0,0],[2,600,2,0,0],[5,1200,0,3,2]]]
        /// </summary>
        public JArray StartBless()
        {
            done.Reset();
            Send(null, 68, 11);
            done.WaitOne(timeout);
            return response;
        }//StartBless

        // 五福临门-见好就收
        /// <summary>
        /// 五福临门-见好就收
        /// Mod_FindImmortal_Base.end_bless(68,13)
        /// module:68, action:13
        /// request:[]
        /// response:[Utils.UByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]]
        /// Line 177-178 in FindImmortalData.as
        ///     this.fiveBlessingInfo.result = param1[0];
        ///     this.fiveBlessingInfo.award = this.parseAward(param1[1]);
        /// Line 7 in Mod_FindImmortal_Base.as
        ///     public static const SUCCESS:int = 0;
        /// Example
        ///     [0,[[3,600,3,0,0],[4,1200,0,2,1],[3,600,3,0,0],[5,1200,0,3,2],[4,1200,0,2,1]]]
        ///     [0,[[3,600,3,0,0],[4,1200,0,2,1],[2,600,2,0,0],[2,600,2,0,0],[5,1200,0,3,2]]]
        /// </summary>
        public JArray EndBless()
        {
            done.Reset();
            Send(null, 68, 13);
            done.WaitOne(timeout);
            return response;
        }//EndBless

        // -------------------------------------------------------------------------------------------
        // 灵脉
        // -------------------------------------------------------------------------------------------
        // 灵脉-打开
        /// <summary>
        /// 灵脉-打开
        /// Mod_Nimbus_Base.nimbus_info(104,0)
        /// module:104, action:0
        /// request:[], 
        /// response:[Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]
        /// Line 23-29 in NimbusData.as
        ///     this.openInfo.nimbus = param1[_loc_2++];
        ///     this.openInfo.commonTimes = param1[_loc_2++];
        ///     this.openInfo.ingotTimes = param1[_loc_2++];
        ///     this.openInfo.crit = param1[_loc_2++];
        ///     this.openInfo.needIngot = param1[_loc_2++];
        ///     this.openInfo.total_count = param1[_loc_2++];
        ///     this.totalTimes = this.openInfo.commonTimes + this.openInfo.ingotTimes;
        /// Example
        ///     [3067,566,5,1,10,2657]
        /// </summary>
        public JArray NimbusInfo()
        {
            done.Reset();
            Send(null, 104, 0);
            done.WaitOne(timeout);
            return response;
        }//NimbusInfo

        // 灵脉-采集灵气
        /// <summary>
        /// 灵脉-采集灵气
        /// Mod_Nimbus_Base.gather_nimbus(104,1)
        /// module:104, action:1, 
        /// request:[Utils.ByteUtil], 
        /// Example
        ///     [0]
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil]
        /// Line 45-54 in NimbusData.as
        ///     this.collectionObj.result = param1[_loc_2++];
        ///     this.collectionObj.nimbus = param1[_loc_2++];
        ///     this.collectionObj.getNimbus = param1[_loc_2++];
        ///     this.collectionObj.isLucky = param1[_loc_2++] == 1;
        ///     this.collectionObj.crit = param1[_loc_2++];
        ///     this.collectionObj.commonTimes = param1[_loc_2++];
        ///     this.collectionObj.ingotTimes = param1[_loc_2++];
        ///     this.collectionObj.needIngot = param1[_loc_2++];
        ///     this.collectionObj.total_count = param1[_loc_2++];
        ///     this.totalTimes = this.collectionObj.commonTimes + this.collectionObj.ingotTimes;
        /// Line 7 in Mod_Nimbus_Base.as
        ///     public static const SUCCESS:int = 0;
        /// Example
        ///     [0,3067,0,1,2,565,5,10,2659]
        ///     [0,3069,2,0,1,564,5,10,2663]
        ///     [0,3069,0,1,2,563,5,10,2668]
        ///     [0,3075,6,0,1,562,5,10,2670]
        /// </summary>
        public JArray GatherNimbus()
        {
            done.Reset();
            Send(new JArray { 0 }, 104, 1);
            done.WaitOne(timeout);
            return response;
        }//GatherNimbus

        // -------------------------------------------------------------------------------------------
        // 荣誉商店
        // -------------------------------------------------------------------------------------------
        // 荣誉商店-打开
        /// <summary>
        /// 荣誉商店-打开
        /// Mod_StArena_Base.exploit_shop_item_list(214,5)
        /// module:214, action:5, 
        /// request:[], 
        /// response:[[Utils.ByteUtil, Utils.ShortUtil]]
        /// Line 177 in StArenaData.as
        ///     oObject.list(_loc_3, _loc_2, ["good_id", "good_count"]);
        /// Example
        ///     [[[4,50],[6,10],[5,10],[2,3],[1,10],[3,10],[7,50]]] // 2表示内丹
        /// </summary>
        public JArray ExploitShopItemList()
        {
            done.Reset();
            Send(null, 214, 5);
            done.WaitOne(timeout);
            return response;
        }//ExploitShopItemList

        // 荣誉商店-买买买
        /// <summary>
        /// 荣誉商店-买买买
        /// Mod_StArena_Base.buy_exploit_shop_item(214,6)
        /// module:214, action:6, 
        /// request:[Utils.ByteUtil, Utils.ShortUtil], 
        /// Example
        ///     [2,1]
        /// response:[Utils.UByteUtil]
        /// Line 20 in Mod_StArena_Base.as
        ///     public static const SUCCESS:int = 13;
        /// Example
        ///     [13]
        /// </summary>
        public JArray BuyExploitShopItem(byte good_id, short good_count)
        {
            done.Reset();
            Send(new JArray { good_id, good_count }, 214, 6);
            done.WaitOne(timeout);
            return response;
        }//BuyExploitShopItem

        // -------------------------------------------------------------------------------------------
        // 劫镖
        // -------------------------------------------------------------------------------------------
        // 劫镖-打开
        /// <summary>
        /// 劫镖-打开
        /// Mod_RobMoney_Base.get_rob_money_info(314,0)
        /// module:314, action:0, 
        /// request:[], 
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil], Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 37 in RobMoneyData.as
        ///     oObject.list(param1, this.robMoneyObject, ["rob_status", "total_rob_times", "free_rob_times", "left_buy_times", "max_buy_times", "ship_list", "nickname", "had_rob_times", "max_rob_times"]);
        /// Line 7-8 in Mod_RobMoney_Base.as
        ///     public static const NOT_SEARCH:int = 0;
        ///     public static const SEARCHED:int = 1;
        /// Example
        ///     [0,1,1,3,3,[[236608,2,95744,0],[236605,3,117100,0],[236780,2,59010,0],[236778,2,74448,0],[236603,2,136730,0],[238091,3,25645,0],[236609,4,83807,0],[236610,4,77020,0],[238093,4,11497,0],[236606,4,107130,0],[236779,4,63648,0],[238090,2,36639,0],[238092,2,20884,0],[236607,2,102858,0],[236781,4,47675,0],[236604,2,125749,0]],"",143,50]
        ///     [1,1,1,3,3,[[236608,2,97744,0],[236605,3,119100,1],[236780,2,61010,0],[236778,2,76448,0],[236603,2,138730,0],[238091,3,27645,0],[236609,4,85807,0],[236610,4,79020,0],[238093,4,13497,0],[236606,4,109130,0],[236779,4,65648,0],[238090,2,38639,0],[238092,2,22884,0],[236607,2,104858,0],[236781,4,49675,0],[236604,2,127749,0]],"",143,50]
        ///     [0,0,0,3,3,[[236608,2,97744,0],[238094,3,1116,0],[236780,2,61010,0],[236778,2,76448,0],[236603,2,138730,0],[238091,3,27645,0],[236609,4,85807,0],[236610,4,79020,0],[238093,4,13497,0],[236606,4,109130,0],[236779,4,65648,0],[238090,2,38639,0],[238092,2,22884,0],[236607,2,104858,0],[236781,4,49675,0],[236604,2,127749,0]],"",144,50]
        /// </summary>
        public JArray GetRobMoneyInfo()
        {
            done.Reset();
            Send(null, 314, 0);
            done.WaitOne(timeout);
            return response;
        }//GetRobMoneyInfo

        // 劫镖-开始勘察
        /// <summary>
        /// 劫镖-开始勘察
        /// Mod_RobMoney_Base.search(314,1)
        /// module:314, action:1, 
        /// request:[], 
        /// response:[[Utils.IntUtil], Utils.UByteUtil]
        /// Line 67 in RobMoneyData.as
        ///     oObject.list(param1, this.searchObject, ["ship_id_list", "result"]);
        /// Line 12 in Mod_RobMoney_Base.as
        ///     public static const SUCCESS:int = 5;
        /// Example
        ///     [[[236605]],5]
        /// </summary>
        public JArray RobMoneySearch()
        {
            done.Reset();
            Send(null, 314, 1);
            done.WaitOne(timeout);
            return response;
        }//RobMoneySearch

        // 劫镖-开始劫镖
        /// <summary>
        /// 劫镖-开始劫镖
        /// Mod_RobMoney_Base.rob(314,2)
        /// module:314, action:2, 
        /// request:[], 
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]
        /// Line 76,84 in RobMoneyData.as
        ///     this.result = param1[0];
        ///     oObject.list(_loc_3, _loc_2, ["item_id", "item_count"]);
        /// Line 12 in Mod_RobMoney_Base.as
        ///     public static const SUCCESS:int = 5;
        /// Example
        ///     [5,[[1747,10000000]]]
        /// </summary>
        public JArray RobMoneyRob()
        {
            done.Reset();
            Send(null, 314, 2);
            done.WaitOne(timeout);
            return response;
        }//RobMoneyRob

        // -------------------------------------------------------------------------------------------
        // 九空无界-聚灵
        // -------------------------------------------------------------------------------------------
        // 九空无界面板
        /// <summary>
        /// 九空无界面板
        /// Mod_NineRegions_Base.open_panel(58,0)
        /// module:58, action:0, 
        /// request:[], 
        /// response:[Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]
        /// Line 58-61 in NineRegionsData.as
        ///     this.nineRegionsInfo.isFrist = param1[0] == 1;
        ///     this.nineRegionsInfo.curJie = param1[1];
        ///     this.nineRegionsInfo.curLevel = param1[2];
        ///     this.hiddenLevel = param1[3];
        /// Example
        ///     [0,11,9,0] 11: 玄木界
        ///     [0,1,0,0]  1:  厚土界
        ///     [1,0,0,0]  0:  没有开通九空无界
        /// </summary>
        public JArray NineRegionsOpenPanel()
        {
            done.Reset();
            Send(null, 58, 0);
            done.WaitOne(timeout);
            return response;
        }//NineRegionsOpenPanel

        // 仙葫数量
        /// <summary>
        /// 仙葫数量
        /// Mod_NineRegions_Base.get_calabash_count(58,29)
        /// module:58, action:29, 
        /// request:[], 
        /// response:[Utils.ByteUtil, Utils.ByteUtil]
        /// Line 509-510 in NineRegionsData.as
        ///     this._calabashInfo.usable_count = param1[0];
        ///     this._calabashInfo.total_count = param1[1];
        /// Example
        ///     [5,7]
        ///     [0,0]
        /// </summary>
        public JArray GetCalabashCount()
        {
            done.Reset();
            Send(null, 58, 29);
            done.WaitOne(timeout);
            return response;
        }//GetCalabashCount

        // 聚灵面板
        /// <summary>
        /// 聚灵面板
        /// Mod_NineRegions_Base.get_calabash_info(58,25)
        /// module:58, action:25, 
        /// request:[Utils.ShortUtil], 
        /// Example
        ///     [11]
        /// response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil], Utils.IntUtil, Utils.ByteUtil]
        /// Line 409-426 in NineRegionsData.as
        ///     this._calabashInfo.state = param1[0];
        ///     this._calabashInfo.calabash = param1[1];
        /// 	this._calabashInfo.awardList = new Array();
        /// 		_loc_3.item_id = _loc_2[0];
        ///         _loc_3.item_count = _loc_2[1];
        ///     this._calabashInfo.value = param1[3];
        ///     this._calabashInfo.avaliable_times = param1[4];
        /// Line 29-30 in Mod_NineRegions_Base.as
        ///     public static const NEW_START:int = 22;
        ///     public static const CONTINUE:int = 23;
        /// Line 31-33 in Mod_NineRegions_Base.as
        ///     public static const TONG:int = 24;
        ///     public static const YIN:int = 25;
        ///     public static const JIN:int = 26;
        /// Example
        ///     [22,24,[],0,7]
        ///     [23,26,[[4033,16],[4034,12]],9,5]
        ///     [22,24,[],0,0]
        /// </summary>
        public JArray GetCalabashInfo(short curJie)
        {
            done.Reset();
            Send(new JArray { curJie }, 58, 25);
            done.WaitOne(timeout);
            return response;
        }//GetCalabashInfo

        // 召唤仙葫
        /// <summary>
        /// 召唤仙葫
        /// Mod_NineRegions_Base.call(58,26)
        /// module:58, action:26, 
        /// request:[Utils.ShortUtil], 
        /// Example
        ///     [11]
        /// response:[Utils.UByteUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil], Utils.ByteUtil]
        /// Line 437-453 in NineRegionsData.as
        ///     this._calabashInfo.callResult = param1[0];
        ///     this._calabashInfo.calabash = param1[1];
        ///     this._calabashInfo.awardList = new Array();
        ///         _loc_3.item_id = _loc_2[0];
        ///         _loc_3.item_count = _loc_2[1];
        ///     this._calabashInfo.value = param1[3];
        /// Line 12 in Mod_NineRegions_Base.as
        ///     public static const SUCCESS:int = 5;
        /// Line 31-33 in Mod_NineRegions_Base.as
        ///     public static const TONG:int = 24;
        ///     public static const YIN:int = 25;
        ///     public static const JIN:int = 26;
        /// Example
        ///     [5,25,[[4034,12],[4033,12]],16]
        /// </summary>
        public JArray NineRegionsCall(short curJie)
        {
            done.Reset();
            Send(new JArray { curJie }, 58, 26);
            done.WaitOne(timeout);
            return response;
        }//NineRegionsCall

        // 聚气
        /// <summary>
        /// 聚气
        /// Mod_NineRegions_Base.gathering(58,27)
        /// module:58, action:27, 
        /// request:[Utils.ShortUtil, Utils.UByteUtil], 
        /// Example
        ///     [11,33]
        /// Line 37-40 in Mod_NineRegions_Base.as
        ///     public static const BUFF_1:int = 30;
        ///     public static const BUFF_2:int = 31;
        ///     public static const BUFF_3:int = 32;
        ///     public static const BUFF_0:int = 33;
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil], Utils.ByteUtil]
        /// Line 463-478 in NineRegionsData.as
        ///     this._calabashInfo.gatherResult = param1[0];
        ///     this._calabashInfo.awardList = new Array();
        ///         _loc_3.item_id = _loc_2[0];
        ///         _loc_3.item_count = _loc_2[1];
        ///     this._calabashInfo.value = param1[2];
        /// Line 12 in Mod_NineRegions_Base.as
        ///     public static const SUCCESS:int = 5;
        /// Example
        ///     [5,[[4034,24],[4033,24]],20]
        /// </summary>
        public JArray NineRegionsGathering(short curJie)
        {
            done.Reset();
            Send(new JArray { curJie, 33 }, 58, 27);
            done.WaitOne(timeout);
            return response;
        }//NineRegionsGathering

        // 收取
        /// <summary>
        /// 收取
        /// Mod_NineRegions_Base.collect(58,28)
        /// module:58, action:28, 
        /// request:[Utils.ShortUtil], 
        /// Example
        ///     [11]
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil]]
        /// Line 488-503 in NineRegionsData.as
        ///     this._calabashInfo.collectResult = param1[0];
        ///     this._calabashInfo.awardList = new Array();
        ///         _loc_3.item_id = _loc_2[0];
        ///         _loc_3.item_count = _loc_2[1];
        /// Line 12 in Mod_NineRegions_Base.as
        ///     public static const SUCCESS:int = 5;
        /// Example
        ///     [5,[[4034,24],[4033,24]]]
        /// </summary>
        public JArray NineRegionsCollect(short curJie)
        {
            done.Reset();
            Send(new JArray { curJie }, 58, 28);
            done.WaitOne(timeout);
            return response;
        }//NineRegionsCollect

        // -------------------------------------------------------------------------------------------
        // 背包
        // -------------------------------------------------------------------------------------------
        // 背包物品列表
        /// <summary>
        /// 背包物品列表
        /// Mod_Item_Base.get_player_pack_item_list(2,41)
        /// module:2, action:41, 
        /// request:[], 
        /// response:[Utils.ShortUtil, Utils.IntUtil, [0.Utils.IntUtil, 1.Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, 5.Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil]]
        /// Example
        ///     [48,0,[[49283478,380,15,1,5,6,0,0,0,0,0,0,0,0,0],[47907319,1197,14,1,0,5,0,0,0,0,0,0,0,0,0],[49372106,1488,23,1,1,8,0,0,0,0,0,0,0,0,0],[49283543,3782,20,1,0,5,0,0,0,0,0,0,0,0,0],[49295363,1461,11,1,320,10,0,0,0,0,0,0,0,0,0],[49295373,1462,12,1,320,1,0,0,0,0,0,0,0,0,0],[49283399,1419,8,1,320,99,0,0,0,0,0,0,0,0,0],[49323800,260,2,1,93,99,0,0,0,0,0,0,0,0,0],[49323799,261,3,1,64,99,0,0,0,0,0,0,0,0,0],[49372096,386,16,1,36155,1,0,0,0,0,0,0,0,0,0],[49309104,1444,18,1,1,39,0,0,0,0,0,0,0,0,0],[49324407,1531,13,1,320,40,0,0,0,0,0,0,0,0,0],[49372095,403,21,1,78534,1,0,0,0,0,0,0,0,0,0],[48848647,1420,10,1,320,64,0,0,0,0,0,0,0,0,0],[49372105,1463,22,1,320,20,0,0,0,0,0,0,0,0,0],[49324406,1411,17,1,74,39,0,0,0,0,0,0,0,0,0],[49295273,1488,19,1,1,58,0,0,0,0,0,0,0,0,0],[49283398,1378,5,1,320,99,0,0,0,0,0,0,0,0,0],[49283400,1375,4,1,320,99,0,0,0,0,0,0,0,0,0],[48848888,1420,9,1,320,99,0,0,0,0,0,0,0,0,0],[49326956,415,1,1,14456,3,0,0,0,0,0,0,0,0,0],[48829931,1417,6,1,320,18,0,0,0,0,0,0,0,0,0],[48829930,1418,7,1,320,23,0,0,0,0,0,0,0,0,0]]]
        ///     49283478(0): id, 380(1):一品武力丹, 6(5):数量
        /// </summary>
        public JArray GetPlayerPackItemList()
        {
            done.Reset();
            Send(null, 2, 41);
            done.WaitOne(timeout);
            return response;
        }//GetPlayerPackItemList

        // 批量使用物品
        /// <summary>
        /// 批量使用物品
        /// Mod_Item_Base.large_use_grid_item(2,130)
        /// module:2, action:130, 
        /// request:[Utils.IntUtil], 
        /// Example
        ///     [49372106]
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil]]
        /// Line 27 in Mod_Item_Base.as
        ///     public static const ACTION_SUCCESS:int = 20;
        /// Example
        ///     [20,[[0,0,21,0,0,0,0,0,0,0,0,0,0,0,0]]]
        /// </summary>
        public JArray LargeUseGridItem(int id)
        {
            done.Reset();
            Send(new JArray { id }, 2, 130);
            done.WaitOne(timeout);
            return response;
        }//LargeUseGridItem

        // 使用物品
        /// <summary>
        /// 使用物品
        /// Mod_Item_Base.player_use_grid_item(2,53)
        /// module:2, action:53, 
        /// request:[Utils.ShortUtil], 
        ///     [32]
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil]]
        /// Line 27 in Mod_Item_Base.as
        ///     public static const ACTION_SUCCESS:int = 20;
        /// Example
        ///     [20,[[0,0,32,0,0,0,0,0,0,0,0,0,0,0,0]]]
        /// </summary>
        public JArray PlayerUseGridItem(short position)
        {
            done.Reset();
            Send(new JArray { position }, 2, 53);
            done.WaitOne(timeout);
            return response;
        }//PlayerUseGridItem

        // 卖物品
        /// <summary>
        /// 卖物品
        /// Mod_Item_Base.player_sell_item(2,73)
        /// module:2, action:73, 
        /// request:[Utils.ShortUtil], 
        /// Example
        ///     [31]
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil], [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil]]
        /// Line 27 in Mod_Item_Base.as
        ///     public static const ACTION_SUCCESS:int = 20;
        /// Example
        ///     [20,[[0,0,31,0,0,0,0,0,0,0,0,0,0,0,0]],[[1,5057,1,320,4,1512374089,0]]]
        /// </summary>
        public JArray PlayerSellItem(short position)
        {
            done.Reset();
            Send(new JArray { position }, 2, 73);
            done.WaitOne(timeout);
            return response;
        }//PlayerSellItem

        // 卷轴信息
        /// <summary>
        /// 卷轴信息
        /// Mod_Item_Base.get_facture_reel_data(2,21)
        /// module:2, action:21, 
        /// request:[Utils.IntUtil], 
        /// Example
        ///     [422] // 六品法术丹制作卷
        ///     [424] // 七品法术丹制作卷
        /// response:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil], 
        ///           Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil]
        /// Line 220 in RefineView.as
        ///     this.reelIngot = param1[5];
        /// Example
        ///     [422,501,1,1,[[249,42,"玄暝界(7)掉落",124,72],[262,4,"虚天殿(6)掉落",148,127],[255,60,"水下宫殿(7)掉落",132,159],[257,53,"幽冥地府(4)掉落",138,257],[254,42,"水下宫殿(4)掉落",129,60],[252,42,"玄暝界(1)掉落",119,477]],
        ///     0,0,0,0,0]   // 材料充足
        ///     [424,503,1,1,[[258,15,"跌水崖(7)掉落",546,243],[220,60,"跌水崖(2)掉落",537,198],[219,60,"天境(2)掉落",552,495],[234,30,"东瀛(2)掉落",567,297],[263,15,"天境(6)掉落",560,0]],
        ///     217,0,0,0,0] // 材料不足，需要217元宝
        /// </summary>
        public JArray GetFactureReelData(int itemId)
        {
            done.Reset();
            Send(new JArray { itemId }, 2, 21);
            done.WaitOne(timeout);
            return response;
        }//GetFactureReelData

        // 卷轴合成
        /// <summary>
        /// 卷轴合成
        /// Mod_Item_Base.player_use_grid_reel(2,27)
        /// module:2, action:27, 
        /// request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], 
        /// Line 460 in RefineView.as
        ///     _data.call(Mod_Item_Base.player_use_grid_reel, this.player_use_grid_reel_back, [this.reelPlayerItemId, param1, _loc_3]);
        /// Example
        ///     [49382368,0,0]
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ShortUtil]]
        /// Line 27 in Mod_Item_Base.as
        ///     public static const ACTION_SUCCESS:int = 20;
        /// Example
        ///     [20,501,1,[[49382384,501,31,1,74,1,0,0,0,0,0,0,0,0,0],[49382384,501,31,1,74,1,0,0,0,0,0,0,0,0,0],[48885435,252,323,1,47,81,0,0,0,0,0,0,0,0,0],[48963891,252,322,1,47,99,0,0,0,0,0,0,0,0,0],[49379258,252,18,1,47,99,0,0,0,0,0,0,0,0,0],[49129723,252,17,1,47,99,0,0,0,0,0,0,0,0,0],[49330458,252,19,1,47,57,0,0,0,0,0,0,0,0,0],[48404425,254,324,1,55,18,0,0,0,0,0,0,0,0,0],[48849914,257,328,1,60,99,0,0,0,0,0,0,0,0,0],[49168212,257,26,1,60,99,0,0,0,0,0,0,0,0,0],[49214159,257,25,1,60,6,0,0,0,0,0,0,0,0,0],[48883494,255,325,1,55,42,0,0,0,0,0,0,0,0,0],[49348943,255,21,1,55,18,0,0,0,0,0,0,0,0,0],[49380662,255,22,1,55,39,0,0,0,0,0,0,0,0,0],[48839807,262,337,1,69,28,0,0,0,0,0,0,0,0,0],[45100969,262,336,1,69,95,0,0,0,0,0,0,0,0,0],[49376597,249,16,1,51,30,0,0,0,0,0,0,0,0,0]]]
        /// </summary>
        public JArray PlayerUseGridReel(int id)
        {
            done.Reset();
            Send(new JArray { id, 0, 0 }, 2, 27);
            done.WaitOne(timeout);
            return response;
        }//PlayerUseGridReel

        // -------------------------------------------------------------------------------------------
        // 群仙乱舞
        // -------------------------------------------------------------------------------------------
        // 
        /// <summary>
        /// 
        /// Mod_Dance_Base.start_dance(76,1)
        /// </summary>
        /*public JArray StartDance()
        {
            done.Reset();
            Send(null, 76, 1);
            done.WaitOne(timeout);
            return response;
        }//StartDance*/

        // 
        /// <summary>
        /// 
        /// Mod_Dance_Base.receive_award(76,2)
        /// </summary>
        /*public JArray ReceiveAward()
        {
            done.Reset();
            Send(null, 76, 1);
            done.WaitOne(timeout);
            return response;
        }//ReceiveAward*/

        // -------------------------------------------------------------------------------------------
        // 结婚
        // -------------------------------------------------------------------------------------------
        // 夫妻宝箱
        /// <summary>
        /// 夫妻宝箱
        /// Mod_Marry_Base.get_marry_box(206,40)
        /// module:206, action:40, 
        /// request:[], 
        /// response:[Utils.UByteUtil]
        /// Line 20,40 in Mod_Marry_Base.as
        ///     public static const SUCCESS:int = 13;
        ///     public static const NO_ENOUGH_GET_COUNT:int = 33;
        /// Example
        ///     [13]
        /// </summary>
        public JArray GetMarryBox()
        {
            done.Reset();
            Send(null, 206, 40);
            done.WaitOne(timeout);
            return response;
        }//GetMarryBox

        // -------------------------------------------------------------------------------------------
        // 神秘商人
        // -------------------------------------------------------------------------------------------
        // 神秘商人-打开
        /// <summary>
        /// 神秘商人-打开
        /// Mod_LuckyStore_Base.get_lucky_store_item_list(87,5)
        /// module:87, action:5, 
        /// request:[], 
        /// response:[[Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.UByteUtil], Utils.ShortUtil]
        /// Line 273 in LuckyShopData.as
        ///     oObject.list(_loc_4, _loc_2, ["item_id", "lucky_store_id", "buy_flag", "is_fresh"]);
        /// Line 15-16 in Mod_LuckyStore_Base.as
        ///     public static const LUCKY_YES:int = 8;
        ///     public static const LUCKY_NO:int = 9;
        /// Example
        ///     [[[3706,157,9,8],[256,0,9,8],[1892,140,9,9],[4035,170,9,9],[1735,55,9,9],[1411,125,9,9],[420,3,9,9],[4543,0,9,9],[1744,114,9,9],[257,0,9,9],[9,0,9,9],[1742,45,9,9]],1161]
        ///     256: 鬼树枝, 0: lucky_store_id, 9: 未卖
        /// </summary>
        public JArray GetLuckyStoreItemList()
        {
            done.Reset();
            Send(null, 87, 5);
            done.WaitOne(timeout);
            return response;
        }//GetLuckyStoreItemList

        // 神秘商人-买
        /// <summary>
        /// 神秘商人-买
        /// Mod_LuckyStore_Base.buy_lucky_store_item(87,6)
        /// module:87, action:6, 
        /// request:[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil], 
        /// Line 209 in SuperLuckyShopView.as
        ///     _data.call(Mod_LuckyStore_Base.buy_lucky_store_item, buyClickCallback, [intNpcID, this._superLuckyShop.intItemId, this._superLuckyShop.intLuckyStoreId]);
        /// Example
        ///     [196,389,4]
        /// response:[Utils.UByteUtil]
        /// Ling 17 in Mod_LuckyStore_Base.as
        ///     public static const LUCKY_SUCCESS:int = 10;
        /// Example
        ///     [10]
        /// </summary>
        public JArray BuyLuckyStoreItem(int npcId, int itemId, int luckyStoreId)
        {
            done.Reset();
            Send(new JArray { npcId, itemId, luckyStoreId }, 87, 6);
            done.WaitOne(timeout);
            return response;
        }//BuyLuckyStoreItem

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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
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
            done.WaitOne(timeout);
            return response;
        }//StartLuckyWheel

        // 吃仙宴
        /// <summary>
        /// 吃仙宴
        /// Mod_Faction_Base.join_feast(10,53)
        /// module:10, action:53, 
        /// request:[], 
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil]]
        /// Line 626-631 in FactionData.as
        ///     var _loc_2:* = 0;
        ///     this.factionEatInfo.eatResult = param1[_loc_2++];
        ///     if (this.factionEatInfo.eatResult == Mod_Faction_Base.SUCCESS)
        ///     {
        ///         this.factionEatInfo.award_item_list = this.parseFactionEatAwards(param1[_loc_2++]);
        ///     }
        /// Line 39 in Mod_Faction_Base.as
        ///     public static const SUCCESS:int = 32;
        /// Example
        ///     [32,[[3418,40],[1739,300]]]
        /// </summary>
        public JArray JoinFeast()
        {
            done.Reset();
            Send(null, 10, 53);
            done.WaitOne(timeout);
            return response;
        }//JoinFeast





        private void Callback(JArray data)
        {
            response = data;
            done.Set();
        }//Callback











    }//class SxdClientTown


}//namespace