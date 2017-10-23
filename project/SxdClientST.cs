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
        private void LoginCallback(JArray data)
        {
            response = data;
            done.Set();
        }//LoginCallback

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
        private void GetRecentRobPlayerCallback(JArray data)
        {
            response = data;
            done.Set();
        }//GetRecentRobPlayerCallback

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
        private void OpenTakeBibleCallback(JArray data)
        {
            response = data;
            done.Set();
        }//OpenTakeBibleCallback

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
        private void GetTakeBibleInfoCallback(JArray data)
        {
            /*takeBibleStatus = TakeBibleStatus.None;
            var _takeBibleTimes = (byte)data[2];
            var _totalTakeBibleTimes = (byte)data[3];
            var _takeBibleStatus = (byte)data[5];
            var _canProtection = (byte)data[6];
            Logger.Log(string.Format("今日可取经共{0}次，已经取经{1}次，当前取经使者：{2}（{3}）",
                _totalTakeBibleTimes, _takeBibleTimes, protections[_canProtection], _takeBibleStatus == 0 ? "未开始" : "已开始"));

            if (_takeBibleTimes == _totalTakeBibleTimes)
                takeBibleStatus = TakeBibleStatus.NoMoreTimes;
            else if (_canProtection == 0)
                takeBibleStatus = TakeBibleStatus.ReadyToRefresh;
            else if (_takeBibleStatus == 0)
                takeBibleStatus = TakeBibleStatus.ReadyToStart;
            else
                takeBibleStatus = TakeBibleStatus.IsRunning;*/
            response = data;
            done.Set();
        }//GetTakeBibleInfoCallback

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
        private void RefreshCallback(JArray data)
        {
            response = data;
            done.Set();
        }//RefreshCallback

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
        private void StartTakeBibleCallback(JArray data)
        {
            response = data;
            done.Set();
        }//StartTakeBibleCallback



    }//class SxdClient


}//namespace