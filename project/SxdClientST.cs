using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using Newtonsoft.Json.Linq;

namespace 神仙道
{
    public class SxdClientST : SxdClient
    {
        public SxdClientST()
        {
            ServerName = "仙界服务器";
        }

        // 登录
        /// <summary>
        /// 登录
        /// Mod_StLogin_Base.login(94,0)
        /// module:94, action:0
        /// request:[Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil]
        /// Line 6985 in View.as:
        ///     _data.call(Mod_StLogin_Base.login, chatConnectLoginBack, [obj.serverName, _ctrl.player.playerInfo.id, _ctrl.player.originNickName, obj.time, obj.passCode], true, 1);
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]
        /// example: [0,203957,1506950717]
        /// Line 15-28 in STLoginData.as:
        ///     public function login(param1:Array) : void
        ///     {
        ///         this.result = param1[0];
        ///         this.playerId = param1[1];
        ///         this._data.stFlyingChessActivity.info.myStPlayerId = this.playerId;
        ///         var _loc_2:* = new Date();
        ///         var _loc_3:* = _loc_2.getTime() / 1000;
        ///         if (_loc_2.timezoneOffset != DateTime.timeArea * 60)
        ///         {
        ///             _loc_3 = _loc_3 - (_loc_2.timezoneOffset - DateTime.timeArea * 60) * 60;
        ///         }
        ///         _data.player.diffWorldServerTime = _loc_3 - param1[2];
        ///         return;
        ///     }// end function
        /// </summary>
        public int Login(string serverHost, int port, string serverName, int playerId, string nickName, int serverTime, string passCode)
        {
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
            socket.Connect(new IPEndPoint(Dns.GetHostEntry(serverHost).AddressList[0], port));
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
            Send(new JArray { serverName, playerId, nickName, serverTime, passCode }, 94, 0);
            done.WaitOne();

            // -----------------------------------------------------------------------------
            // 5. 处理返回数据
            // -----------------------------------------------------------------------------
            if ((byte)response[0] != 0)
                throw new Exception("仙界登录失败");
            _playerId = (int)response[1];

            return _playerId;
        }//Login

        // 进入仙界城镇
        /// <summary>
        /// 进入仙界城镇
        /// Mod_StTown_Base.enter_town(95,0)
        /// module:95, action:0, 
        /// request:[Utils.IntUtil], 
        /// Line 277 in TownTypeData.as
        ///     41:["XianJie","仙界",{
        /// Example
        ///     [41]
        /// response:[Utils.UByteUtil]
        /// Line 9 in Mod_StTown_Base.as
        ///     public static const SUCCESS:int = 2;
        /// Example
        ///     [2]
        /// </summary>
        public JArray EnterTown()
        {
            done.Reset();
            Send(new JArray { 41 }, 95, 0);
            done.WaitOne();
            return response;
        }//EnterTown

        // 仇人
        /// <summary>
        /// 获取最近打劫玩家，猜想可能用于仇人
        /// Mod_StTakeBible_Base.get_recent_rob_player(114,19)
        /// module:114, action:19
        /// request:[]
        /// response:[[Utils.IntUtil]]
        /// </summary>
        public JArray GetRecentRobPlayer()
        {
            done.Reset();
            Send(null, 114, 19);
            done.WaitOne();
            return response;
        }//GetRecentRobPlayer

        // 打开护送取经总界面
        /// <summary>
        /// Mod_StTakeBible_Base.open_take_bible(114,0)
        /// module:114, action:0
        /// request:[]
        /// response:[[Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil], Utils.ByteUtil]
        /// example: [[[3520,1,1507113758,1507114958,1200,0,1,0],[17995,3,1507114743,1507116543,1800,0,1,0],[815,1,1507113740,1507114940,1200,0,1,0],[1977,3,1507113586,1507115386,1800,1780,1,0],[205317,4,1507113927,1507116027,2100,0,1,0],[205754,2,1507114498,1507115998,1500,0,1,0],[205960,1,1507114244,1507115444,1200,0,1,0],[8897,2,1507114448,1507115948,1500,7659,1,0],[17764,4,1507112830,1507114930,2100,1033,1,0],[17840,3,1507113415,1507115215,1800,0,1,0],[206801,1,1507114333,1507115533,1200,0,1,0],[3122,2,1507114699,1507116199,1500,0,1,0],[22160,2,1507114020,1507115520,1500,0,1,0],[7815,3,1507113095,1507114895,1800,7714,1,0],[203725,2,1507114698,1507116198,1500,0,1,0],[19232,2,1507113777,1507115277,1500,0,1,0],[903,1,1507114319,1507115519,1200,0,1,0],[8247,3,1507113148,1507114948,1800,0,1,0],[1980,2,1507113904,1507115404,1500,0,1,0],[3445,1,1507114254,1507115454,1200,0,1,0],[3507,4,1507113562,1507115662,2100,3520,1,0],[19173,1,1507114151,1507115351,1200,0,1,0],[7790,4,1507113300,1507115400,2100,0,1,0],[205320,1,1507113579,1507114779,1200,0,1,0]],
        ///             0,5,2,3,0,0,6,0,[],0]
        /// Line 58-66 in StTakeBibleController.as:
        ///     _loc_2.protectPlayerId = _loc_1[1];
        ///     _loc_2.classTakePlayer = this.renderClssTakePlayer(_loc_1[0]);
        ///     _loc_2.canRobTimes = _loc_1[2];
        ///     _loc_2.canProtectTimes = _loc_1[3];
        ///     _loc_2.canTakeBibleTimes = _loc_1[4];
        ///     _loc_2.quicklyTimes = _loc_1[5];
        ///     _loc_2.bless = _loc_1[6];
        ///     _loc_2.type = _loc_1[7];
        ///     _loc_2.time = _loc_1[8];
        /// Line 99-110 in StTakeBibleController.as:
        ///     _loc_7.protectPlayerId = param1[_loc_6][5];
        ///     _loc_7.playerId = param1[_loc_6][0];
        ///     _loc_7.isMainPlayer = _loc_7.playerId == _ctrl.stLogin.playerId;
        ///     _loc_7.isProtectPlayer = _loc_7.protectPlayerId == _ctrl.stLogin.playerId;
        ///     _loc_7.protection = param1[_loc_6][1];
        ///     _loc_7.startTime = DateTime.formatServerTime(param1[_loc_6][2]);
        ///     _loc_7.mainTime = _loc_3;
        ///     _loc_7.arrivalTime = DateTime.formatServerTime(param1[_loc_6][3]);
        ///     _loc_7.distance = param1[_loc_6][4];
        ///     _loc_7.sequence_id = param1[_loc_6][6];
        ///     _loc_7.is_deeds_so = param1[_loc_6][7];
        ///     _loc_7.isDeeds = _loc_7.is_deeds_so == 1;
        /// </summary>
        public JArray OpenTakeBible()
        {
            done.Reset();
            Send(null, 114, 0);
            done.WaitOne();
            return response;
        }//OpenTakeBible

        // 打开护送取经面板
        /// <summary>
        /// Mod_StTakeBible_Base.get_take_bible_info(114,2)
        /// module:114, action:2
        /// request:[]
        /// response:[[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], 
        ///           [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], 
        ///            Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil]
        /// example: [[[1,20,775000,90,40,5,13],[2,25,925000,180,80,3,538],[3,30,1265000,340,150,3,625],[4,35,1815000,550,300,2,560],[5,40,4199980,1500,1000,1,0]],
        ///          [],0,3,0,0,0,"",0,0]
        /// 白龙马:  [[[1,20,775000,90,40,5,13],[2,25,925000,180,80,3,538],[3,30,1265000,340,150,3,625],[4,35,1815000,550,300,2,560],[5,40,4199980,1500,1000,1,0]],
        ///          [],0,3,10,0,1,"",0,2]
        /// 开始护送:[[[1,20,775000,90,40,5,13],[2,25,925000,180,80,3,538],[3,30,1265000,340,150,3,625],[4,35,1815000,550,300,2,560],[5,40,4199980,1500,1000,1,0]],
        ///          [],1,3,10,1,1,"",0,2]
        /// 沙悟净： [[[1,20,670000,80,0,4,870],[2,25,830000,180,0,3,120],[3,30,1170000,340,0,3,275],[4,35,1620000,500,0,1,230],[5,40,4134720,1600,0,2,120]],
        ///          [],0,3,10,0,2,"",0,10]
        /// 开始护送:[[[1,20,675000,80,0,4,870],[2,25,835000,180,0,3,120],[3,30,1175000,340,0,3,275],[4,35,1625000,500,0,1,230],[5,40,4153500,1600,0,2,120]],
        ///          [],1,3,10,1,2,"",0,10]
        /// Line 217-226 in StTakeBibleController.as:
        ///   _loc_2.protectionList = this.renderProtectionList(_loc_1[0]);
        ///   _loc_2.protectPlayerList = this.renderProtectPlayerList(_loc_1[1]);
        ///   _loc_2.takeBibleTimes = _loc_1[2];
        ///   _loc_2.totalTakeBibleTimes = _loc_1[3];
        ///   _loc_2.refreshPrice = _loc_1[4];
        ///   _loc_2.takeBibleStatus = _loc_1[5];
        ///   _loc_2.canProtection = _loc_1[6];
        ///   _loc_2.protectPlayer = _ctrl.player.removeNickNameSuffix(_loc_1[7]);
        ///   _loc_2.bless = _loc_1[8];
        ///   _loc_2.buff = _loc_1[9]; // 声望加成
        /// </summary>
        public JArray GetTakeBibleInfo()
        {
            done.Reset();
            Send(null, 114, 2);
            done.WaitOne();
            return response;
        }//GetTakeBibleInfo

        // 刷新使者
        /// <summary>
        /// Mod_StTakeBible_Base.refresh(114,8)
        /// module:114, action:8
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil]
        /// example: [9,1,12,2]
        /// Line 340-343 in StTakeBibleController.as:
        ///     _loc_2.msg = _loc_1[0];
        ///     _loc_2.newProtection = _loc_1[1];
        ///     _loc_2.nextPrice = _loc_1[2];
        ///     _loc_2.buff = _loc_1[3];
        /// </summary>
        public JArray Refresh()
        {
            done.Reset();
            Send(null, 114, 8);
            done.WaitOne();
            return response;
        }//Refresh

        // 开始护送
        /// <summary>
        /// Mod_StTakeBible_Base.start_take_bible(114,10)
        /// module:114, action:10
        /// request:[]
        /// response:[Utils.UByteUtil, Utils.ByteUtil]
        /// example: [9,20]
        /// Line 407-408 in StTakeBibleController.as:
        ///     _loc_2.msg = _loc_1[0];
        ///     _loc_2.item_id = _loc_1[1];
        /// </summary>
        public JArray StartTakeBible()
        {
            done.Reset();
            Send(null, 114, 10);
            done.WaitOne();
            return response;
        }//StartTakeBible

        // -------------------------------------------------------------------------------------------
        // 家园
        // -------------------------------------------------------------------------------------------
        /// <summary>
        /// 每日领取家园奖励
        /// Mod_MarryHome_Base.batch_get_furniture_effect(210,18)
        /// module:210, action:18
        /// request:[]
        /// response:[[Utils.IntUtil, Utils.IntUtil]]
        /// Line 310 in MarryHomeData.as
        ///     oObject.list(_loc_2, _loc_3, ["item_id", "effect"]);
        /// Example: [[[1747,200000],[3418,5]]]
        /// </summary>
        public JArray BatchGetFurnitureEffect()
        {
            done.Reset();
            Send(null, 210, 18);
            done.WaitOne();
            return response;
        }//BatchGetFurnitureEffect

        // -------------------------------------------------------------------------------------------
        // 神魔竞技
        // -------------------------------------------------------------------------------------------
        // 神魔竞技-状态
        /// <summary>
        /// 神魔竞技-状态
        /// Mod_StSuperSport_Base.get_st_super_sport_status(115,0)
        /// request:[]
        /// response:[Utils.UByteUtil]
        /// Line 28-32 in Mod_StSuperSport_Base.as
        ///     public static const POINT_RACE_FIRST_DAY:int = 21;
        ///     public static const POINT_RACE_SECOND_DAY:int = 22;
        ///     public static const POINT_RACE_THIRD_DAY:int = 23;
        ///     public static const POINT_RACE_FOUR_DAY:int = 24;
        ///     public static const WAR_RACE:int = 25;
        /// Example
        ///     [21]
        /// </summary>
        public JArray GetStSuperSportStatus()
        {
            done.Reset();
            Send(null, 115, 0);
            done.WaitOne();
            return response;
        }//GetStSuperSportStatus

        // 神魔竞技-玩家信息
        /// <summary>
        /// 神魔竞技-玩家信息
        /// Mod_StSuperSport_Base.get_player_st_super_sport(115,1)
        /// module:115, action:1
        /// request:[]
        /// response:[Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.ShortUtil]
        /// Line 81 in StSuperSportData.as
        ///     oObject.list(param1, this._getPlayerStSuperSport, ["st_super_sport_rank", "continue_win_times", "remain_challenge_times", "cd_time", "clear_cd_ingot", "is_get_award", "today_buy_times"]);
        /// Line 34 in Mod_StSuperSport_Base.as
        ///     public static const NO:int = 27;
        /// Example
        ///     [2227,0,5,0,0,27,0] // 2227:排名, 0:continue_win_times, 5:今日还可挑战次数, 0:cd_time, 0:clear_cd_ingot, 27:is_get_award(NO), 0:today_buy_times
        /// </summary>
        public JArray GetPlayerStSuperSport()
        {
            done.Reset();
            Send(null, 115, 1);
            done.WaitOne();
            return response;
        }//GetPlayerStSuperSport

        // 神魔竞技-挑战列表
        /// <summary>
        /// 神魔竞技-挑战列表
        /// Mod_StSuperSport_Base.challenge_list(115,2)
        /// module:115, action:2
        /// request:[]
        /// response:[[Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.IntUtil, Utils.UByteUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil], Utils.IntUtil]
        /// Line 110,116 in StSuperSportData.as
        ///     oObject.list(param1, this._challengeList, ["challenge_players", "next_refresh_time"]);
        ///     oObject.list(_loc_3, _loc_4, ["sequence_id", "st_player_id", "nickname", "role_id", "player_level", "attack_power", "is_challenge", "stage_name", "server_name", "equip_item_id"]);
        /// Example
        ///     [[[4,25783,"伊人★物语.s8",4,84,264760,27,"37wan","37wan_s0273",837],[3,15156,"樊硕暴.s1",100,158,913882,27,"37wan","37wan_s0273",1440],[5,204896,"听风吹◆.s1",1,66,265007,27,"7k7k","yx567_s0125",841],[1,200672,"彡森.s1",99,132,913264,27,"心动","s04",1308],[2,56495,"冷秋秋.s7",1,152,914442,27,"心动","s04",1457]],1510891200]
        /// </summary>
        public JArray ChallengeList()
        {
            done.Reset();
            Send(null, 115, 2);
            done.WaitOne();
            return response;
        }//ChallengeList

        // 神魔竞技-领取排名奖励
        /// <summary>
        /// 神魔竞技-领取排名奖励
        /// Mod_StSuperSport_Base.get_rank_award(115,9)
        /// request:[Utils.ShortUtil]
        /// Line 930 in StSuperSportInfoView.as
        ///     data.call(Mod_StSuperSport_Base.get_rank_award, this.onGetAwardCallBack, [_ctrl.player.level], true, 1);
        /// Example
        ///     [155]
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil]
        /// Line 727 in StSuperSportData.as
        ///     oObject.list(param1, this._rankAward, ["result", "award_coin", "award_fame", "award_blood"]);
        /// Line 35 in Mod_StSuperSport_Base.as
        ///     public static const SUCCESS:int = 28;
        /// Example
        ///     [28,50000,50,0] 28:SUCCESS, 50000:铜钱, 50:声望, 0:血脉精华
        /// </summary>
        public JArray GetRankAward(short level)
        {
            done.Reset();
            Send(new JArray { level }, 115, 9);
            done.WaitOne();
            return response;
        }//GetRankAward

        // 神魔竞技-挑战
        /// <summary>
        /// 神魔竞技-挑战
        /// Mod_StSuperSport_Base.challenge(115,3)
        /// module:115, action:3
        /// request:[Utils.ByteUtil]
        /// Example
        ///     [1]
        /// response:[0.Utils.UByteUtil, 1.Utils.IntUtil, 2.Utils.ByteUtil, 3.Utils.ShortUtil, 4.[...], 
        ///           5.Utils.ShortUtil, 6.Utils.ShortUtil, 7.Utils.ShortUtil, 8.Utils.ShortUtil, 9.Utils.ByteUtil, 
        ///           10.Utils.ByteUtil, 11.Utils.StringUtil, 12.Utils.StringUtil, 13.Utils.ShortUtil, 14.Utils.IntUtil, 
        ///           15.Utils.IntUtil, 16.Utils.IntUtil, 17.Utils.IntUtil, 18.Utils.IntUtil, 19.Utils.IntUtil, 
        ///           20.Utils.IntUtil, 21.[Utils.IntUtil, Utils.IntUtil]]
        /// Line 147 in StSuperSportData.as
        ///     oObject.list(param1, this._challengeResult, 
        ///     [0."result", 1."award_coin", 2."award_fame", 3."award_score", 4."war_result", 
        ///      5."st_super_sport_rank", 6."cur_score", 7."remain_challenge_times", 8."cd_time", 9."clear_cd_ingot", 
        ///      10."award_blood_essence", 11."stage_name", 12."server_name", 13."continue_win_times", 14."award_dao_yuan", 
        ///      15."award_gun", 16."scrapId", 17."scrapNum", 18."awardItemId", 19."awardCount", 
        ///      20."war_report_id", 21."award_item_list"]);
        /// Line 35 in Mod_StSuperSport_Base.as
        ///     public static const SUCCESS:int = 28;
        /// Example
        ///     胜利 [28,13200,20,36,[...],  19,1036,4,0,0,   4,"心动","s04",1,0,   0,0,0,0,0,   224854,[]] 28:SUCCESS, 13200:铜钱, 20:声望, 36:积分 
        ///     失败 [28,3040,10,6,[...],    17,1042,3,30,1,  2,"心动","s04",0,0,   0,0,0,0,0,   224911,[]]   28:SUCCESS, 2040:铜钱,  10:声望, 6:积分
        /// </summary>
        public JArray Challenge(byte index)
        {
            done.Reset();
            Send(new JArray { index }, 115, 3);
            done.WaitOne();
            return response;
        }//Challenge

        // 神魔竞技-可以领取神魔大礼吗
        /// <summary>
        /// 神魔竞技-可以领取神魔大礼吗
        /// Mod_StSuperSport_Base.can_get_score_award(115,11)
        /// module:115, action:11
        /// request:[]
        /// response:[Utils.UByteUtil]
        /// Line 33-34 in Mod_StSuperSport_Base.as
        ///     public static const YES:int = 26;
        ///     public static const NO:int = 27;
        /// Example
        ///     [27]
        /// </summary>
        public JArray CanGetScoreAward()
        {
            done.Reset();
            Send(null, 115, 11);
            done.WaitOne();
            return response;
        }//CanGetScoreAward

        // 神魔竞技-打开神魔大礼
        /// <summary>
        /// 神魔竞技-打开神魔大礼
        /// Mod_StSuperSport_Base.player_score_award_info(115,12)
        /// module:115, action:12
        /// request:[]
        /// response:[Utils.ShortUtil, [Utils.ByteUtil, Utils.UByteUtil]]
        /// Line 771,777 in StSuperSportData.as
        ///     oObject.list(param1, this._playerScoreAwardInfo, ["self_score", "award_info"]);
        ///     oObject.list(_loc_3, _loc_4, ["award_id", "is_get"]);
        /// Line 33-34 in Mod_StSuperSport_Base.as
        ///     public static const YES:int = 26;
        ///     public static const NO:int = 27;
        /// Example
        ///     [1136,[[5,27],[4,27],[8,27],[2,27],[1,26],[6,27],[3,27],[7,27]]]
        /// </summary>
        public JArray PlayerScoreAwardInfo()
        {
            done.Reset();
            Send(null, 115, 12);
            done.WaitOne();
            return response;
        }//PlayerScoreAwardInfo

        // 神魔竞技-领取神魔大礼
        /// <summary>
        /// 神魔竞技-领取神魔大礼
        /// Mod_StSuperSport_Base.player_get_score_award(115,13)
        /// module:115, action:13
        /// request:[Utils.ByteUtil]
        /// Example
        ///     [1]
        /// response:[Utils.UByteUtil]
        /// Line 35 in Mod_StSuperSport_Base.as
        ///     public static const SUCCESS:int = 28;
        /// Example
        ///     [28]
        /// </summary>
        public JArray PlayerGetScoreAward(byte index)
        {
            done.Reset();
            Send(new JArray { index }, 115, 13);
            done.WaitOne();
            return response;
        }//PlayerGetScoreAward

        // 神魔竞技-
        /// <summary>
        /// 神魔竞技-
        /// Mod_StSuperSport_Base.get_race_step(115,30)
        /// module:115, action:30, 
        /// request:[], 
        /// response:[Utils.UByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, [Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.UByteUtil, Utils.StringUtil, [Utils.StringUtil, Utils.StringUtil], Utils.IntUtil]
        ///     
        ///     oObject.list(param1, _loc_2, ["race_step", "player_step", "war_round", "player_number", "time_list", "cup_race_time_step", "apply_id", "group", "war_zone", "server_list", "bet_player_id"]);
        /// 
        ///     public static const ST_SUPER_SPORT_WAR_CLOSE:int = 4;
        ///     public static const ST_SUPER_SPORT_WAR_PREPARE:int = 5;
        ///     public static const ST_SUPER_SPORT_WAR_16:int = 6;
        ///     public static const ST_SUPER_SPORT_WAR_16_COMPLETE:int = 7;
        ///     public static const ST_SUPER_SPORT_WAR_8:int = 8;
        ///     public static const ST_SUPER_SPORT_WAR_8_COMPLETE:int = 9;
        ///     public static const ST_SUPER_SPORT_WAR_4:int = 10;
        ///     public static const ST_SUPER_SPORT_WAR_4_COMPLETE:int = 11;
        ///     public static const ST_SUPER_SPORT_WAR_2:int = 12;
        ///     public static const ST_SUPER_SPORT_WAR_2_COMPLETE:int = 13;
        ///     public static const ST_SUPER_SPORT_WAR_1:int = 14;
        ///     public static const ST_SUPER_SPORT_WAR_1_COMPLETE:int = 15;
        ///     public static const ST_SUPER_SPORT_WAR_0:int = 16;
        ///     public static const ST_SUPER_SPORT_WAR_0_COMPLETE:int = 17;
        ///     public static const ST_SUPER_SPORT_WAR_START:int = 18;
        /// Example
        ///     准备：[5,6,0,0,[[6,1511773200],[8,1511776800],[10,1511780400],[12,1511784000],[14,1511787600],[16,1511791200]],600,203957,1,"",[],0]
        ///     16强：[6,6,0,64,[[6,1511773200],[8,1511776800],[10,1511780400],[12,1511784000],[14,1511787600],[16,1511791200]],600,203957,1,"",[],5417]
        ///     16强完：[7,6,0,0,[[6,1511773200],[8,1511776800],[10,1511780400],[12,1511784000],[14,1511787600],[16,1511791200]],600,203957,1,"",[],5417]
        /// </summary>
        public JArray StSuperSportGetRaceStep()
        {
            done.Reset();
            Send(null, 115, 30);
            done.WaitOne();
            return response;
        }//StSuperSportGetRaceStep

        // 神魔竞技-
        /// <summary>
        /// 神魔竞技-
        /// Mod_StSuperSport_Base.get_race_list(115,32)
        /// module:115, action:32, 
        /// request:[Utils.UByteUtil], 
        /// 
        ///     public static const GROUP_TIAN_BANG:int = 1;
        ///     public static const GROUP_DI_BANG:int = 2;
        ///     public static const GROUP_FINALLY:int = 3;
        /// Example
        ///     [1], [2], [3]
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, [Utils.ShortUtil, Utils.ShortUtil], Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.ShortUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.LongUtil, [Utils.ShortUtil, Utils.ShortUtil], Utils.StringUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.UByteUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil], Utils.IntUtil, [Utils.IntUtil]]
        /// 
        ///     oObject.list(param1, _loc_2, [0."group", 1."player_list", 2."current_war_result", 3."top_16", 4."top_8", 5."top_4", 6."top_2", 7."top_1", 8."can_bet_coin_list"]);
        ///     _loc_7 = [0."player_id", 1."player_nickname", 2."role_id", 3."attack_power", 4."fame", 
        ///               5."level", 6."stage_name", 7."view_server_name", 8."bet_coin", 9."role_list", 
        ///               10."pet_name", 11."pet_level", 12."pet_step", 13."enemy"];
        /// Example
        ///     [1,[[24373,"度日如年.s1",104,7186843,0,250,"心动","s04",2000000,[],"",0,0,20,6395,"金麟龙.s8",100,3890726,0,217,"37wan","37wan_s0273",0,[],"",0,0,20],[4074,"问道.s1",104,3526116,0,250,"心动","s04",0,[],"",0,0,20,204132,"轩辕豹.s1",100,882214,0,149,"心动","s04",0,[],"",0,0,20],[197708,"蓝牙国家.s1",5,7010203,0,250,"心动","s04",0,[],"",0,0,20,4554,"让艳晨爱上我.s1",104,782668,0,125,"心动","s04",0,[],"",0,0,20],[205960,"唐蕊卉.s1",6,767188,0,126,"心动","s04",0,[],"",0,0,20,203964,"高千字.s1",104,478252,0,152,"心动","s04",0,[],"",0,0,20],[5417,"海欲.s6",104,8865013,0,210,"37wan","37wan_s0273",131500000,[],"",0,0,20,205955,"尹晴萱.s3",2,1301225,0,146,"心动","s02",0,[],"",0,0,20],[2917,"硅步万里.s10",100,3044919,0,250,"要玩","yaowan_s0152",0,[],"",0,0,20,14792,"候博.s4",1,1070376,0,142,"心动","s04",0,[],"",0,0,20],[201283,"闻人飞云.s1",2,5300471,0,246,"37wan","37wan_s0273",0,[],"",0,0,20,6508,"金麟龙.s7",5,3223408,0,217,"37wan","37wan_s0273",0,[],"",0,0,20],[203725,"绝色倾城.s1",102,3108479,0,204,"心动","s04",0,[],"",0,0,20,2874,"石红.s10",104,3125595,0,197,"要玩","yaowan_s0152",0,[],"",0,0,20],[8536,"☆弑神者☆.s1",102,5394715,0,250,"7k7k","yx567_s0125",0,[],"",0,0,20,26581,"无可奈何.s1",100,5061826,0,223,"心动","s04",0,[],"",0,0,20],[203966,"甄斐斐.s1",104,397770,0,154,"心动","s04",0,[],"",0,0,20,6511,"金麟龙.s6",1,3319714,0,217,"37wan","37wan_s0273",0,[],"",0,0,20],[7804,"万里挑一.s5",6,5821585,0,205,"7k7k","yx567_s0125",0,[],"",0,0,20,17756,"诸葛义锋.s1",100,1188761,0,162,"7k7k","yx567_s0125",0,[],"",0,0,20],[203962,"伍岚芷.s1",110,516879,0,156,"心动","s04",0,[],"",0,0,20,11083,"强大的蜗牛.s1",104,3392974,0,211,"心动","s04",0,[],"",0,0,20],[10243,"梦幻小紫晶.s1",102,5175558,0,236,"7k7k","yx567_s0125",0,[],"",0,0,20,203957,"庄恭春.s1",5,753066,0,167,"心动","s04",0,[],"",0,0,20],[2112,"牛牛.s3",106,4209741,0,250,"6711","6711_s0160",0,[],"",0,0,20,14969,"lx1026.s1",5,907332,0,134,"心动","s04",0,[],"",0,0,20],[200547,"哥玩地寂寞.s1",104,7018813,0,250,"心动","s04",0,[],"",0,0,20,206601,"白字钦.s1",3,1033570,0,146,"心动","s04",0,[],"",0,0,20],[2833,"春桃1.s4",100,4518472,0,232,"95k","95k_s081",0,[],"",0,0,20,203960,"和謇暴.s1",3,356303,0,151,"心动","s04",0,[],"",0,0,20]],[],[],[],[],[],0,[[2000000]]]
        ///     [2,[[684,"超级邪剑仙.s4",100,5567983,0,237,"95k","95k_s081",0,[],"",0,0,20,206932,"袁载狱.s1",1,582194,0,110,"37wan","37wan_s0273",0,[],"",0,0,20],[9167,"骨灰玩家丶.s1",2,4571859,0,226,"心动","s04",0,[],"",0,0,20,3270,"奶油糖兔死妈.s4",1,1586823,0,149,"心动","s04",0,[],"",0,0,20],[8147,"李嘯龙.s5",106,7380024,0,250,"7k7k","yx567_s0125",0,[],"",0,0,20,2364,"好无聊.s10",104,5408628,0,220,"要玩","yaowan_s0152",0,[],"",0,0,20],[207059,"舒衣萦.s1",6,397035,0,89,"心动","s04",0,[],"",0,0,20,205754,"诸葛贤圣.s3",102,1169741,0,154,"心动","s02",0,[],"",0,0,20],[201992,"夜凉诚.s1",100,5817810,0,220,"心动","s04",0,[],"",0,0,20,2934,"司马婷娆.s10",106,2390827,0,192,"要玩","yaowan_s0152",0,[],"",0,0,20],[203965,"董乘六.s1",107,391110,0,153,"心动","s04",0,[],"",0,0,20,2224,"马妹汁.s8",102,4312194,0,246,"心动","s05",0,[],"",0,0,20],[200966,"姐玩的寂寞.s1",102,6079973,0,250,"心动","s04",0,[],"",0,0,20,206708,"王丘闪.s1",100,857972,0,130,"37wan","37wan_s0273",0,[],"",0,0,20],[1000,"徐御茂.s1",100,3854562,0,215,"心动","s04",0,[],"",0,0,20,206808,"纪衣妙.s2",109,549625,0,106,"37wan","37wan_s0273",0,[],"",0,0,20],[1237,"江门古天乐.s1",100,7209889,0,217,"心动","s04",5000000,[],"",0,0,20,206177,"欧阳柏岚.s4",6,1393017,0,159,"37wan","37wan_s0273",0,[],"",0,0,20],[22112,"凌风箭羽.s4",108,1221336,0,161,"7k7k","yx567_s0125",0,[],"",0,0,20,7975,"拳王1号.s5",104,4116792,0,250,"7k7k","yx567_s0125",0,[],"",0,0,20],[2187,"圣⊙何仙姑.s3",206,7817505,0,231,"56","56_s024",0,[],"",0,0,20,12618,"云渠青.s9",1,880587,0,142,"心动","s05",0,[],"",0,0,20],[204599,"吕悟茂.s4",104,2477404,0,195,"37wan","37wan_s0273",0,[],"",0,0,20,2821,"黄驹炼.s4",102,3964554,0,222,"95k","95k_s081",0,[],"",0,0,20],[3212,"毕柳薰.s1",106,6497897,0,249,"心动","s04",0,[],"",0,0,20,205700,"欧阳千伟.s1",5,1118576,0,153,"心动","s04",0,[],"",0,0,20],[10585,"苏苏.s3",6,4199984,0,209,"心动","s02",0,[],"",0,0,19,190989,"吕洞宾.s10",6,5313525,0,243,"95k","95k_s081",0,[],"",0,0,20],[8474,"无敌铁砂掌.s1",102,6885750,0,250,"7k7k","yx567_s0125",0,[],"",0,0,20,3426,"阿珂.s9",6,5119910,0,250,"心动","s05",0,[],"",0,0,20],[9890,"霸气剑皇.s2",5,1205008,0,158,"7k7k","yx567_s0125",0,[],"",0,0,20,203963,"郎森三.s1",104,475050,0,153,"心动","s04",0,[],"",0,0,20]],[],[],[],[],[],0,[[2000000]]]
        ///     [3,[],[[2,243822,"2017112401"]],[],[],[],[],0,[]]
        /// </summary>
        public JArray StSuperSportGetRaceList(byte i)
        {
            done.Reset();
            Send(new JArray { i }, 115, 32);
            done.WaitOne();
            return response;
        }//StSuperSportGetRaceList

        // 神魔竞技-
        /// <summary>
        /// 神魔竞技-
        /// Send method: Mod_StSuperSport_Base.bet(115,37)
        /// module:115, action:37, 
        /// request:[Utils.IntUtil], 
        /// Example
        ///     [5417]
        /// response:[Utils.UByteUtil, Utils.IntUtil]
        /// 
        ///     public static const SUCCESS:int = 28;
        /// Example
        ///     [28,5417]
        /// </summary>
        public JArray StSuperSportBet(int id)
        {
            done.Reset();
            Send(new JArray { id }, 115, 37);
            done.WaitOne();
            return response;
        }//StSuperSportBet

        // -------------------------------------------------------------------------------------------
        // 仙界竞技场
        // -------------------------------------------------------------------------------------------
        // 仙界竞技场-比赛阶段
        /// <summary>
        /// 仙界竞技场-比赛阶段
        /// Mod_StArena_Base.get_race_step(214,15)
        /// module:214, action:15, 
        /// request:[], 
        /// response:[Utils.UByteUtil, [Utils.UByteUtil, Utils.IntUtil], Utils.IntUtil]
        /// Line 247 in StArenaData.as
        ///     oObject.list(param1, _loc_2, ["race_step", "time_list", "cup_race_time_step"]);
        /// Line 7-8 in Mod_StArena_Base.as
        ///     public static const SCORE_RACE:int = 0;
        ///     public static const SCORE_RACE_COMPLETE:int = 1;
        /// Example
        ///     [0,[[3,1511082000],[5,1511085600],[7,1511089200],[9,1511092800],[11,1511096400]],600]
        /// </summary>
        public JArray GetRaceStep()
        {
            done.Reset();
            Send(null, 214, 15);
            done.WaitOne();
            return response;
        }//GetRaceStep

        // 仙界竞技场-打开
        /// <summary>
        /// 仙界竞技场-打开
        /// Mod_StArena_Base.open_st_arena(214,0)
        /// module:214, action:0, 
        /// request:[], 
        /// response:[0.Utils.IntUtil, 1.Utils.ShortUtil, 2.Utils.IntUtil, 3.Utils.IntUtil, 4.Utils.IntUtil, 
        ///           5.[Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil], 6.[Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.ByteUtil], 7.[Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil]]
        /// Line 37 in StArenaData.as
        ///     oObject.list(param1, _loc_2, [0."integral", 1."reduceChallengeCount", 2."awardFeats", 3."awardGetTime", 4."reduceRefreshTime", 
        ///                                   5."challengeList", 6."reportList", 7."integralRankList"]);
        /// Line 58 in StArenaData.as
        ///     oObject.list(_loc_3, _loc_4, ["st_player_id", "integral", "role_id", "level"]);
        /// Example
        ///     [1220,5,52,1511625600,0,
        ///     [[13924,1205,1,119],[17284,1127,6,121],[78944,1126,4,112],[137264,1128,3,120],[153604,1168,2,136]],[...],[...]]
        /// </summary>
        public JArray OpenStArena()
        {
            done.Reset();
            Send(null, 214, 0);
            done.WaitOne();
            return response;
        }//OpenStArena

        // 仙界竞技场-挑战
        /// <summary>
        /// 仙界竞技场-挑战
        /// Mod_StArena_Base.challenge(214,2)
        /// module:214, action:2, 
        /// request:[Utils.IntUtil, Utils.IntUtil], 
        /// Example
        ///     [17284,0]
        /// response:[0.Utils.UByteUtil, 1.[Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.StringUtil, [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil, Utils.StringUtil, Utils.StringUtil, Utils.IntUtil, Utils.LongUtil, Utils.LongUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil], Utils.ByteUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ShortUtil, Utils.ShortUtil, [Utils.ShortUtil], [Utils.ShortUtil], Utils.ShortUtil, Utils.ByteUtil, Utils.LongUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil], [Utils.IntUtil, Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, [Utils.IntUtil, Utils.ByteUtil], Utils.LongUtil, Utils.LongUtil, [Utils.IntUtil], Utils.ByteUtil, [Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, [Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.IntUtil]]], [[Utils.ByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, [Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], [Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, [Utils.UByteUtil, Utils.ShortUtil, Utils.ByteUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], Utils.StringUtil, [Utils.IntUtil], [Utils.StringUtil], Utils.IntUtil, Utils.ShortUtil, Utils.LongUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.StringUtil, Utils.IntUtil, Utils.UByteUtil, [Utils.IntUtil, Utils.ShortUtil, [Utils.UByteUtil, Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], [Utils.StringUtil], [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.ShortUtil], Utils.StringUtil, [Utils.IntUtil], Utils.IntUtil, Utils.IntUtil, Utils.LongUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil], [Utils.IntUtil, Utils.StringUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil]], [Utils.IntUtil, Utils.IntUtil], [Utils.UByteUtil, Utils.StringUtil, [Utils.UByteUtil, Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil], [Utils.StringUtil]], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil], [Utils.IntUtil, Utils.LongUtil, Utils.IntUtil]], Utils.ShortUtil], 
        ///           2.Utils.IntUtil, 3.Utils.IntUtil, 4.Utils.StringUtil, 
        ///           5.Utils.StringUtil, 6.Utils.ShortUtil, 7.Utils.IntUtil, 8.Utils.IntUtil, 9.Utils.IntUtil, 
        ///           10.Utils.IntUtil, 11.[Utils.IntUtil, Utils.IntUtil]]
        /// Line 123 in StArenaData.as
        ///     oObject.list(param1, _loc_2, [0."result", 1."warResult", 2."challengeAwardFeats", 3."challengeAddIntegral", 4."defenseStageName", 
        ///                                   5."defenseServerName", 6."reduceChallengeCount", 7."item_id", 8."number", 9."award_st_snatch_treasure_scrap_id", 
        ///                                   10."scrap_num", 11."award_item_list"]);
        /// Line 20 in Mod_StArena_Base.as
        ///     public static const SUCCESS:int = 13;
        /// Example
        ///     [13,[[...]],10,2,"7k7k",
        ///     "yx567_s0125",4,0,0,0,
        ///     0,[]]
        /// </summary>
        public JArray StArenaChallenge(int st_player_id)
        {
            done.Reset();
            Send(new JArray { st_player_id, 0 }, 214, 2);
            done.WaitOne();
            return response;
        }//StArenaChallenge

        // 仙界竞技场-换一批
        /// <summary>
        /// 仙界竞技场-换一批
        /// Mod_StArena_Base.refresh_player_list(214,1)
        /// module:214, action:1, 
        /// request:[], 
        /// response:[Utils.UByteUtil, [Utils.IntUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil], Utils.IntUtil]
        /// Line 111 in StArenaData.as
        ///     oObject.list(param1, _loc_2, ["result", "challengeList", "reduceRefreshTime"]);
        /// Line 20,21 in Mod_StArena_Base.as
        ///     public static const SUCCESS:int = 13;
        ///     public static const CD_TIME:int = 14;
        /// </summary>
        public JArray RefreshPlayerList()
        {
            done.Reset();
            Send(null, 214, 1);
            done.WaitOne();
            return response;
        }//RefreshPlayerList


        private void Callback(JArray data)
        {
            response = data;
            done.Set();
        }//Callback



    }//class SxdClient


}//namespace