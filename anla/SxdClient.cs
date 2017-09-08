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

namespace anla
{

    public class SxdClient
    {
        // 更新界面委托
        public delegate void UpdateUI(UpdateType type, object data);
        public UpdateUI UpdateUIDelegate;

        // Socket
        private Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        private Socket socketST = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

        // Socket状态
        private short previousModule;
        private short previousAction;
        private short previousModuleST;
        private short previousActionST;

        // 玩家信息
        private int playerId;
        private string serverName;
        private string nickName;
        private string passCode;

        // 服务器地址与端口
        private string serverHost;
        private int port;
        private string serverHostST;
        private int portST;

        // 用于登录仙界
        private int serverTime;

        private readonly ManualResetEvent loginDone = new ManualResetEvent(false);
        private readonly ManualResetEvent getLoginInfoDone = new ManualResetEvent(false);
        private readonly ManualResetEvent getPlayerInfoDone = new ManualResetEvent(false);
        private readonly ManualResetEvent stLoginDone = new ManualResetEvent(false);

        private bool loginSuccess;
        private bool getLoginInfoSuccess;
        private bool getPlayerInfoSuccess;
        private bool stLoginSuccess;

        private void Receive(Socket _socket)
        {
            var state = new StateObject { workSocket = _socket };
            _socket.BeginReceive(state.buffer, 0, StateObject.BufferSize, SocketFlags.None, ReceiveCallback, state);
        }//Receive

        private void ReceiveCallback(IAsyncResult ar)
        {
            var state = (StateObject)ar.AsyncState;
            var _socket = state.workSocket;

            if (!_socket.Connected)
                return;
            /* EndReceive 方法将一直阻止到有数据可用为止。 
             * 如果您使用的是无连接协议，则 EndReceive 将读取传入网络缓冲区中第一个排队的可用数据报。 
             * 如果您使用的是面向连接的协议，则 EndReceive 方法将读取所有可用的数据，直到达到 BeginReceive 方法的 size 参数所指定的字节数为止。*/
            var bytesRead = _socket.EndReceive(ar);

            if (bytesRead <= 0)
            {
                UpdateUIDelegate(UpdateType.LogBoth, "已断开游戏服务器");
                return;
            }

            state.byteList.AddRange(state.buffer.ToList().GetRange(0, bytesRead));
            while (state.byteList.Count > 4)
            {
                var length = ToInt32(state.byteList);
                if (state.byteList.Count < length + 4)
                {
                    UpdateUIDelegate(UpdateType.LogBoth, "不完整的数据包");
                    return;
                }

                ProcessPackage(state.byteList.GetRange(4, length).ToArray());
                state.byteList.RemoveRange(0, length + 4);
            }

            _socket.BeginReceive(state.buffer, 0, StateObject.BufferSize, SocketFlags.None, ReceiveCallback, state);
        }//ReceiveCallback

        private void ReceiveST(Socket _socket)
        {
            var state = new StateObject { workSocket = _socket };
            _socket.BeginReceive(state.buffer, 0, StateObject.BufferSize, SocketFlags.None, ReceiveCallbackST, state);
        }//ReceiveST

        private void ReceiveCallbackST(IAsyncResult ar)
        {
            var state = (StateObject)ar.AsyncState;
            var _socket = state.workSocket;

            if (!_socket.Connected)
                return;
            /* EndReceive 方法将一直阻止到有数据可用为止。 
             * 如果您使用的是无连接协议，则 EndReceive 将读取传入网络缓冲区中第一个排队的可用数据报。 
             * 如果您使用的是面向连接的协议，则 EndReceive 方法将读取所有可用的数据，直到达到 BeginReceive 方法的 size 参数所指定的字节数为止。*/
            var bytesRead = _socket.EndReceive(ar);

            if (bytesRead <= 0)
            {
                UpdateUIDelegate(UpdateType.LogBoth, "已断开仙界服务器");
                return;
            }

            state.byteList.AddRange(state.buffer.ToList().GetRange(0, bytesRead));
            while (state.byteList.Count > 4)
            {
                var length = ToInt32(state.byteList);
                if (state.byteList.Count < length + 4)
                {
                    UpdateUIDelegate(UpdateType.LogBoth, "不完整的数据包");
                    return;
                }

                ProcessPackage(state.byteList.GetRange(4, length).ToArray());
                state.byteList.RemoveRange(0, length + 4);
            }

            _socket.BeginReceive(state.buffer, 0, StateObject.BufferSize, SocketFlags.None, ReceiveCallbackST, state);
        }//ReceiveCallbackST

        private void ProcessPackage(byte[] package)
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
                            UpdateUIDelegate(UpdateType.LogBoth, package[4] == 0 ? "登录成功" : "登录失败");
                            playerId = ToInt32(package, 5);
                            UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("playerId: {0}", playerId));

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
                            UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("nickName: {0}", nickName));
                            UpdateUIDelegate(UpdateType.Nickname, nickName);
                            index += 2 + count;
                            var level = ToInt32(package, index).ToString();
                            UpdateUIDelegate(UpdateType.Level, level);
                            index += 4;
                            var ingot = ToInt32(package, index).ToString();
                            UpdateUIDelegate(UpdateType.Ingot, ingot);
                            index += 4;
                            var coins = ToInt64(package, index).ToString();
                            UpdateUIDelegate(UpdateType.Coins, coins);
                            index += 8;
                            var health = ToInt32(package, index).ToString();
                            UpdateUIDelegate(UpdateType.Health, health);
                            index += 8;
                            var power = ToInt32(package, index).ToString();
                            UpdateUIDelegate(UpdateType.Power, power);
                            index += 4;
                            var experience = ToInt64(package, index).ToString();
                            UpdateUIDelegate(UpdateType.Experience, experience);
                            //index += 8;
                            //var maxExperience = ToInt64(package, index).ToString();
                            UpdateUIDelegate(UpdateType.LogBoth, string.Format("昵称：{0}，等级{1}：元宝：{2}，铜钱：{3}，生命：{4}，体力：{5}，经验值：{6}", nickName, level, ingot, coins, health, power, experience));

                            getPlayerInfoSuccess = true;
                            getPlayerInfoDone.Set();
                        }
                        break;
                    #endregion

                    #region 更新玩家信息 update_player_data
                    case (0 << 4) + 3:
                        // PLAYER_EXPERIENCE:int = 20; 更新经验值
                        if (ToInt16(package, 4) == 1 && package[6] == 20)
                            UpdateUIDelegate(UpdateType.Experience, ToInt64(package, 7).ToString());
                        return;
                    #endregion

                    #region 领取俸禄 get_player_camp_salary
                    case (0 << 4) + 20:
                        UpdateUIDelegate(UpdateType.LogBoth, package[4] == 0x57 ? string.Format("成功领取俸禄: {0}", ToInt32(package, 5)) : "领取俸禄失败");
                        break;
                    #endregion

                    #region 领取仙令 player_get_xian_ling_gift
                    case (13 << 4) + 20:
                        UpdateUIDelegate(UpdateType.LogBoth, package[4] == 0x8 ? string.Format("成功领取仙令: {0}", package[5]) : "领取仙令失败");
                        break;
                    #endregion

                    #region 领取灵石 get_day_stone
                    case (34 << 4) + 18:
                        UpdateUIDelegate(UpdateType.LogBoth, package[4] == 0x1 ? string.Format("成功领取灵石: {0}", ToInt32(package, 5)) : "领取灵石失败");
                        break;
                    #endregion

                    #region 世界聊天 bro_to_players
                    case (6 << 4) + 1:
                        {
                            var index1 = 10;
                            var count1 = ToInt16(package, index1);
                            var index2 = index1 + 2 + count1 + 3;
                            var count2 = ToInt16(package, index2);
                            UpdateUIDelegate(UpdateType.LogBoth, string.Format("{0}说: {1}", Encoding.UTF8.GetString(package, index1 + 2, count1), Encoding.UTF8.GetString(package, index2 + 2, count2)));
                            break;
                        }
                    #endregion

                    #region 登录仙界 Mod_StLogin_Base.login
                    case (94 << 4) + 0:
                        {
                            UpdateUIDelegate(UpdateType.LogBoth, package[4] == 0x0 ? "仙界登录成功" : "仙界登录失败");

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
                            UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("serverHostST: {0}", serverHostST));
                            index += 2 + count;
                            portST = ToInt16(package, index);
                            UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("portST: {0}", portST));
                            index += 2;
                            count = ToInt16(package, index);
                            index += 2 + count;
                            serverTime = ToInt32(package, index);
                            UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("serverTime: {0}", serverTime));
                            index += 4;
                            count = ToInt16(package, index);
                            passCode = Encoding.UTF8.GetString(package, index + 2, count);
                            UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("passCode: {0}", passCode));

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
                UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("module: {0}, action: {1}, data: [{2}]", module, action, sb));

                break;
            }//while
        } //ProcessPackage


        /// <summary>
        /// 登录
        /// [1. playerName, 2. hashCode, 3. time, 4. URI.sourceUrl, 5. URI.regdate, 
        ///  6. strIdCard, 7. URI.openTime, 8. URI.isNewSt, 9. URI.stageName, 10. URI.client]
        /// [1. logined, 2. playerId, 3. , 4. enableTime, 5. enableType
        ///  6. PlayerInfo.bAllActivity(==0), 7. isOpenMusic(==1), 8. WarType.WarEffectShowType, 9. uiSetValue]
        /// public static const login:Object = {
        /// module:0, action:0, 
        /// request:[1. Utils.StringUtil, 2. Utils.StringUtil, 3. Utils.StringUtil, 4. Utils.StringUtil, 5. Utils.IntUtil, 
        ///          6. Utils.StringUtil, 7. Utils.IntUtil, 8. Utils.ByteUtil, 9. Utils.StringUtil, 10. Utils.StringUtil], 
        /// response:[1. Utils.UByteUtil, 2. Utils.IntUtil, 3. Utils.UByteUtil, 4. Utils.IntUtil, 5. Utils.ByteUtil, 
        ///           6. Utils.IntUtil, 7. Utils.ByteUtil, 8. Utils.UByteUtil, 9. Utils.IntUtil]};
        /// </summary>
        /// <param name="url">e.g. http://s1.sxd.xd.com/</param>
        /// <param name="code">e.g. jqIvApbvTv9qKdY</param>
        /// <param name="time">e.g. 1504099144</param>
        /// <param name="hash">e.g. d9092c1fb0f5313022ada7fcf15a3d2c</param>
        /// <param name="time1">e.g. 1504099144</param>
        /// <param name="hash1">e.g. 44ee5d7670384dc58eeeb7cf7d913e7c</param>
        public bool Login(string url, string code, string time, string hash, string time1, string hash1)
        {
            loginSuccess = false;
            loginDone.Reset();

            string responseString;

            var request = (HttpWebRequest)WebRequest.Create(url);
            request.Headers.Add("Cookie", string.Format("user={0};_time={1};_hash={2};login_time_sxd_xxxxxxxx={3};login_hash_sxd_xxxxxxxx={4}", code, time, hash, time1, hash1));
            request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31";

            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            {
                if (stream == null)
                    throw new NullReferenceException("stream is null");
                using (var sr = new StreamReader(stream, Encoding.UTF8))
                    responseString = sr.ReadToEnd();
            }

            var m = Regex.Match(responseString, @"""&player_name=(.*)""[\s\S]*""&hash_code=(.*)""[\s\S]*""&time=(.*)""[\s\S]*""&ip=(.*)""[\s\S]*""&port=(.*)""[\s\S]*""&server_id=(.*)""[\s\S]*""&source=(.*)""[\s\S]*""&regdate=(.*)""[\s\S]*""&id_card=(.*)""[\s\S]*""&open_time=(.*)""[\s\S]*""&is_newst=(.*)""[\s\S]*""&stage=(.*)""[\s\S]*""&client=(.*)""");
            if (!m.Success)
                throw new Exception("登录失败，请使用登录器重新登录");
            var player_name = m.Groups[1].Value;
            var hash_code = m.Groups[2].Value;
            var time2 = m.Groups[3].Value;
            serverHost = m.Groups[4].Value;
            port = int.Parse(m.Groups[5].Value);
            serverName = m.Groups[6].Value;
            var source = m.Groups[7].Value;
            var regdate = m.Groups[8].Value;
            var id_card = m.Groups[9].Value;
            var open_time = m.Groups[10].Value;
            var is_newst = m.Groups[11].Value;
            var stage = m.Groups[12].Value;
            var client = m.Groups[13].Value;
            UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("serverName: {0}", serverName));

            var sentBytes = new List<byte>();

            // 0. add module and action
            const short module = 0;
            const short action = 0;
            AppendInt16(sentBytes, module);
            AppendInt16(sentBytes, action);

            // 1. add player_name
            AppendString(sentBytes, player_name);
            // 2. add hash_code
            AppendString(sentBytes, hash_code);
            // 3. add time
            AppendString(sentBytes, time2);
            // 4. add source
            AppendString(sentBytes, source);
            // 5. add regdate
            AppendInt32(sentBytes, int.Parse(regdate));
            // 6. add strIdCard
            AppendString(sentBytes, id_card);
            // 7. add open_time
            AppendInt32(sentBytes, int.Parse(open_time));
            // 8. add URI.isNewSt
            AppendByte(sentBytes, byte.Parse(is_newst));
            // 9. add stage（心动）
            AppendString(sentBytes, HttpUtility.UrlDecode(stage));
            // 10. add client
            AppendString(sentBytes, HttpUtility.UrlDecode(client));
            // E. intert hader
            IntertHead(sentBytes);

            UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("ip: {0}", serverHost));
            UpdateUIDelegate(UpdateType.LogOnlyToFile, string.Format("port: {0}", port));

            if (socket.Connected)
            {
                socket.Shutdown(SocketShutdown.Both);
                socket.Close();
            }
            socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            socket.Connect(new IPEndPoint(Dns.GetHostEntry(serverHost).AddressList[0], port));
            socket.Send(sentBytes.ToArray());
            Receive(socket);

            previousModule = module;
            previousAction = action;

            loginDone.WaitOne();
            return loginSuccess;
        }//Login

        /// <summary>
        /// Mod_StcLogin_Base.get_login_info
        /// </summary>
        public bool GetLoginInfo()
        {
            getLoginInfoSuccess = false;
            getLoginInfoDone.Reset();

            var sentBytes = new List<byte>();

            // 0. add module and action
            const short module = 96;
            const short action = 0;
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

            getLoginInfoDone.WaitOne();
            return getLoginInfoSuccess;
        }//GetLoginInfo

        /// <summary>
        /// GetPlayerInfo
        /// </summary>
        public bool GetPlayerInfo()
        {
            getPlayerInfoSuccess = false;
            getPlayerInfoDone.Reset();

            var sentBytes = new List<byte>();

            // 0. add module and action
            const short module = 0;
            const short action = 2;
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

            getPlayerInfoDone.WaitOne();
            return getPlayerInfoSuccess;
        }//GetPlayerInfo

        /// <summary>
        /// Mod_StLogin_Base.login
        /// 必备参数
        /// serverName: from Http
        /// playerId: from Mod_Player_Base.login
        /// nickName: from Mod_Player_Base.get_player_info
        /// passCode: from Mod_StcLogin_Base.get_login_info
        /// </summary>
        public bool StLogin()
        {
            stLoginSuccess = false;
            stLoginDone.Reset();

            var sentBytes = new List<byte>();

            // 0. add module and action
            const short module = 94;
            const short action = 0;
            AppendInt16(sentBytes, module);
            AppendInt16(sentBytes, action);

            // 1. add serverName
            AppendString(sentBytes, serverName);
            // 2. add playerId
            AppendInt32(sentBytes, playerId);
            // 3. add nickName
            AppendString(sentBytes, nickName);
            // 4. add time
            AppendInt32(sentBytes, serverTime);
            // 5. add passCode
            AppendString(sentBytes, passCode);
            // E. intert hader
            IntertHead(sentBytes);

            if (socketST.Connected)
            {
                socketST.Shutdown(SocketShutdown.Both);
                socketST.Close();
            }
            socketST = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            socketST.Connect(new IPEndPoint(Dns.GetHostEntry(serverHostST).AddressList[0], portST));
            socketST.Send(sentBytes.ToArray());
            ReceiveST(socketST);

            previousModuleST = module;
            previousActionST = action;

            stLoginDone.WaitOne();
            return stLoginSuccess;
        }//StLogin

        /// <summary>
        /// 世界聊天
        /// [1. data.messageType, 2. data.message, 3. data.eipNum, 4. data.eipIndex]
        /// public static const chat_with_players:Object = {
        /// module:6, action:0, 
        /// request:[1. Utils.UByteUtil, 2. Utils.StringUtil, 3. Utils.StringUtil, 4. Utils.StringUtil], 
        /// response:[1. Utils.IntUtil, 2. Utils.UByteUtil]};
        /// </summary>
        /// <param name="message"></param>
        public void ChatWithPlayers(string message)
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

        }//ChatWithPlayers

        /// <summary>
        /// 领取俸禄
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
        /// 领取仙令
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
        /// 领取灵石
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

        private static short ToInt16(IEnumerable<byte> bytes, int i = 0)
        {
            var bs = bytes.ToList().GetRange(i, 2);
            if (BitConverter.IsLittleEndian)
                bs.Reverse();
            return BitConverter.ToInt16(bs.ToArray(), 0);
        }//ToInt16

        private static int ToInt32(IEnumerable<byte> bytes, int i = 0)
        {
            var bs = bytes.ToList().GetRange(i, 4);
            if (BitConverter.IsLittleEndian)
                bs.Reverse();
            return BitConverter.ToInt32(bs.ToArray(), 0);
        }//ToInt32

        private static long ToInt64(IEnumerable<byte> bytes, int i = 0)
        {
            var bs = bytes.ToList().GetRange(i, 8);
            if (BitConverter.IsLittleEndian)
                bs.Reverse();
            return BitConverter.ToInt64(bs.ToArray(), 0);
        }//ToInt64
        #endregion


    }//class
}//namespace