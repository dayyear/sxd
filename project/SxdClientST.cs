using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace 神仙道
{
    public class SxdClientST
    {
        // Socket
        private Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

        // Socket状态
        private short previousModule;
        private short previousAction;
        private bool isConnected;
        private readonly ManualResetEvent done = new ManualResetEvent(false);
        private readonly ManualResetEvent receiveDone = new ManualResetEvent(false);


        // 用于Receive Callback
        readonly byte[] bufferRcvd = new byte[256];
        readonly List<byte> bytesRcvd = new List<byte>();



        /// <summary>
        /// Mod_StLogin_Base.login(94,0)
        /// module:94, action:0
        /// request:[Utils.StringUtil, Utils.IntUtil, Utils.StringUtil, Utils.IntUtil, Utils.StringUtil]
        /// Line 6985 in View.as:
        ///   _data.call(Mod_StLogin_Base.login, chatConnectLoginBack, [obj.serverName, _ctrl.player.playerInfo.id, _ctrl.player.originNickName, obj.time, obj.passCode], true, 1);
        /// </summary>
        public void Login(SxdClient client)
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
            socket.Connect(new IPEndPoint(Dns.GetHostEntry(client.serverHostST).AddressList[0], client.portST));
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
            Send(new JArray { client.serverName, client.playerId, client.nickName, client.serverTime, client.passCode }, 94, 0);
            done.WaitOne();
        }//Login

        /// <summary>
        /// Mod_StLogin_Base.login(94,0)
        /// module:94, action:0
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil]
        /// example: [0,203957,1506950717]
        /// Line 15-28 in STLoginData.as:
        ///   public function login(param1:Array) : void
        ///   {
        ///       this.result = param1[0];
        ///       this.playerId = param1[1];
        ///       this._data.stFlyingChessActivity.info.myStPlayerId = this.playerId;
        ///       var _loc_2:* = new Date();
        ///       var _loc_3:* = _loc_2.getTime() / 1000;
        ///       if (_loc_2.timezoneOffset != DateTime.timeArea * 60)
        ///       {
        ///           _loc_3 = _loc_3 - (_loc_2.timezoneOffset - DateTime.timeArea * 60) * 60;
        ///       }
        ///       _data.player.diffWorldServerTime = _loc_3 - param1[2];
        ///       return;
        ///   }// end function
        /// </summary>
        /// <param name="data"></param>
        private void LoginCallback(JArray data)
        {
            var logined = (byte)data[0];
            if (logined != 0)
                throw new Exception("仙界登录失败");
            var playerId = (int)data[1];
            Logger.Log(string.Format("仙界登录成功, 玩家ID: {0}", playerId), ConsoleColor.Green);
            done.Set();
        }//LoginCallback

        /// <summary>
        /// Mod_StTakeBible_Base.open_take_bible(114,0)
        /// module:114, action:0
        /// request:[]
        /// </summary>
        public void OpenTakeBible()
        {
            done.Reset();
            Send(null, 114, 0);
            done.WaitOne();
        }//OpenTakeBible

        /// <summary>
        /// Mod_StTakeBible_Base.open_take_bible(114,0)
        /// module:114, action:0
        /// response:[[Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.IntUtil, Utils.ShortUtil, Utils.IntUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.IntUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil, [Utils.ByteUtil, Utils.ShortUtil, Utils.StringUtil, Utils.StringUtil, Utils.StringUtil, Utils.ShortUtil], Utils.ByteUtil]
        /// example: [[[6849,3,1506952585,1506954385,1800,621,1,0],[206714,2,1506953866,1506955366,1500,0,1,0],[5855,2,1506953811,1506955311,1500,0,1,0],[14674,2,1506952910,1506954410,1500,0,1,0],[3560,3,1506952904,1506954704,1800,2064,1,0],[11708,3,1506953210,1506955010,1800,0,1,0],[8352,2,1506952856,1506954356,1500,0,1,0],[2128,4,1506953868,1506955968,2100,0,1,0],[6334,4,1506952803,1506954903,2100,0,1,0],[8210,2,1506953647,1506955147,1500,0,1,0],[206971,3,1506953231,1506955031,1800,0,1,0],[613,4,1506952703,1506954803,2100,322,1,0],[200937,1,1506953705,1506954905,1200,0,1,0],[7913,3,1506952853,1506954653,1800,0,1,0],[1884,1,1506953633,1506954833,1200,0,1,0],[168712,3,1506952617,1506954417,1800,0,1,0],[206954,2,1506952921,1506954421,1500,0,1,0],[7898,1,1506953671,1506954871,1200,0,1,0],[8007,2,1506953007,1506954507,1500,0,1,0],[168680,3,1506954276,1506956076,1800,0,1,0],[642,2,1506952853,1506954353,1500,0,1,0],[8351,2,1506952852,1506954352,1500,0,1,0],[206,1,1506953676,1506954876,1200,0,1,0],[802,3,1506952705,1506954505,1800,0,1,0]],0,5,2,2,0,0,6,0,[],0]
        /// Line in StTakeBibleController.as
        ///   
        /// </summary>
        private void OpenTakeBibleCallback(JArray data)
        {
            Logger.Log("OpenTakeBible");
            done.Set();
        }//OpenTakeBibleCallback

        /// <summary>
        /// Mod_StTakeBible_Base.get_take_bible_info(114,2)
        /// module:114, action:2
        /// request:[]
        /// </summary>
        public void GetTakeBibleInfo()
        {
            done.Reset();
            Send(null, 114, 2);
            done.WaitOne();
        }//GetTakeBibleInfo

        /// <summary>
        /// Mod_StTakeBible_Base.get_take_bible_info(114,2)
        /// module:114, action:2
        /// response:[[Utils.UByteUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ShortUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.IntUtil], [Utils.IntUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil, Utils.ByteUtil], Utils.ByteUtil, Utils.ByteUtil, Utils.ShortUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.StringUtil, Utils.ByteUtil, Utils.ByteUtil]
        /// example: [[[1,20,775000,90,40,5,13],[2,25,925000,180,80,3,538],[3,30,1265000,340,150,3,600],[4,35,1815000,550,300,2,560],[5,40,4199980,1500,1000,1,0]],[],1,3,0,0,0,"",0,0]
        /// example: [[[1,20,775000,90,40,5,13],[2,25,925000,180,80,3,538],[3,30,1265000,340,150,3,600],[4,35,1815000,550,300,2,560],[5,40,4199980,1500,1000,1,0]],[],2,3,10,1,3,"",0,16] 正在护送猪八戒
        /// 2.takeBibleTimes, 3.totalTakeBibleTimes, 4.refreshPrice, 5.takeBibleStatus, 6.canProtection, 7.protectPlayer, 8.bless, 9.buff(声望加成)
        /// Line in StTakeBibleController.as
        ///   
        /// </summary>
        private void GetTakeBibleInfoCallback(JArray data)
        {
            Logger.Log("GetTakeBibleInfo");
            done.Set();
        }//GetTakeBibleInfoCallback





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
                    case "open_take_bible":
                        OpenTakeBibleCallback(data);
                        break;
                    case "get_take_bible_info":
                        GetTakeBibleInfoCallback(data);
                        break;
                    default:
                        break;
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
                    Logger.Log("已断开仙界服务器", ConsoleColor.Red);
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
            if (module != 94 || action != 0)
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

    }//class SxdClient


}//namespace