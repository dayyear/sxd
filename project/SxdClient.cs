using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace 神仙道
{
    public class SxdClient
    {

        // 发送协议：totalLength(4), module(2), action(2), data(totalLength-8), previousModule(2), previousAction(2)
        // 接收协议：totalLength(4), module(2), action(2), data(totalLength-4)
        private Int16 module;
        private Int16 action;
        private Int16 previousModule;
        private Int16 previousAction;

        //private TcpClient tcpClient;
        //private NetworkStream networkStream;

        private static readonly Encoding UTF8 = Encoding.UTF8;

        private readonly Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

        /// <summary>
        /// 登录准备
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <param name="server"></param>
        /// <returns></returns>
        public static Tuple<string, string, string, string, string> LoginPrepare(string username, string password, string server)
        {
            var rnd = new Random();
            var cookieContainer = new CookieContainer();

            // 1. Get https://ssl.xd.com/users/loginService
            var uri = string.Format(@"https://ssl.xd.com/users/loginService?callback=jQuery1102{0}_{1}&data%5BUser%5D%5Busername%5D={4}&data%5BUser%5D%5Bpassword%5D={5}&data%5BUser%5D%5Bremember_me%5D=true&data%5BUser%5D%5Bsite%5D=xd&app=sxd&captcha=&captcha_identifier=&need_detail=true&history_amount=0&rqst_sgntr={2}&_={3}",
                rnd.NextDouble().ToString(CultureInfo.CurrentCulture).Replace(".", ""), Stamp(), rnd.NextDouble(), Stamp(), username, password);
            var request = (HttpWebRequest)WebRequest.Create(uri);
            request.CookieContainer = cookieContainer;
            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            using (var sr = new StreamReader(stream, Encoding.UTF8))
                sr.ReadToEnd();

            // 2. Get http://www.xd.com/games/play
            uri = string.Format(@"http://www.xd.com/games/play?app=sxd&server={0}", server);
            request = (HttpWebRequest)WebRequest.Create(uri);
            request.CookieContainer = cookieContainer;
            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            using (var sr = new StreamReader(stream, Encoding.UTF8))
                sr.ReadToEnd();

            // 3. Get cookies
            /*
            Set-Cookie: sxd_user=7-oEEpAwXxUwjFk; expires=Thu, 31-Aug-2017 12:54:04 GMT; path=/
            Set-Cookie: user=IBlEBp9Uz3kEoRm; expires=Thu, 31-Aug-2017 12:54:04 GMT; path=/
            Set-Cookie: source=deleted; expires=Thu, 01-Jan-1970 00:00:01 GMT; path=/
            Set-Cookie: regdate=1463362496; path=/
            Set-Cookie: non_kid=1; path=/
            Set-Cookie: idcard=110101198001010037; path=/
            Set-Cookie: client_type=web; path=/
            Set-Cookie: login_time_sxd_xxxxxxxx=1504097644; path=/
            Set-Cookie: login_hash_sxd_xxxxxxxx=027fa44e0cc234fdee1ac22c5f9d43e3; path=/
            Set-Cookie: _time=1504097644; expires=Thu, 31-Aug-2017 12:54:04 GMT; path=/
            Set-Cookie: _hash=60f1b28cb1deca5d33b099feb5956597; expires=Thu, 31-Aug-2017 12:54:04 GMT; path=/
            */
            var cookieCollection = cookieContainer.GetCookies(new Uri(string.Format("http://{0}.sxd.xd.com/", server)));
            var code = cookieCollection["user"].Value;
            var time = cookieCollection["_time"].Value;
            var hash = cookieCollection["_hash"].Value;
            var time1 = cookieCollection["login_time_sxd_xxxxxxxx"].Value;
            var hash1 = cookieCollection["login_hash_sxd_xxxxxxxx"].Value;

            return new Tuple<string, string, string, string, string>(code, time, hash, time1, hash1);

        }//LoginService

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
        /// <param name="server">e.g. s1</param>
        /// <param name="code">e.g. jqIvApbvTv9qKdY</param>
        /// <param name="time">e.g. 1504099144</param>
        /// <param name="hash">e.g. d9092c1fb0f5313022ada7fcf15a3d2c</param>
        /// <param name="time1">e.g. 1504099144</param>
        /// <param name="hash1">e.g. 44ee5d7670384dc58eeeb7cf7d913e7c</param>
        public void Login(string server, string code, string time, string hash, string time1, string hash1)
        {
            string responseString;

            var request = (HttpWebRequest)WebRequest.Create(string.Format("http://{0}.sxd.xd.com/", server));
            request.Headers.Add("Cookie", string.Format("user={0};_time={1};_hash={2};login_time_sxd_xxxxxxxx={3};login_hash_sxd_xxxxxxxx={4}", code, time, hash, time1, hash1));
            request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31";

            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            using (var sr = new StreamReader(stream, Encoding.UTF8))
                responseString = sr.ReadToEnd();
            //Console.WriteLine(responseString);

            var m = Regex.Match(responseString, @"""&player_name=(.*)""[\s\S]*""&hash_code=(.*)""[\s\S]*""&time=(.*)""[\s\S]*""&ip=(.*)""[\s\S]*""&port=(.*)""[\s\S]*""&source=(.*)""[\s\S]*""&regdate=(.*)""[\s\S]*""&id_card=(.*)""[\s\S]*""&open_time=(.*)""[\s\S]*""&is_newst=(.*)""[\s\S]*""&stage=(.*)""[\s\S]*""&client=(.*)""");
            if (!m.Success)
                throw new Exception("登录失败");
            var player_name = m.Groups[1].Value;
            var hash_code = m.Groups[2].Value;
            var time2 = m.Groups[3].Value;
            var ip = m.Groups[4].Value;
            var port = m.Groups[5].Value;
            var source = m.Groups[6].Value;
            var regdate = m.Groups[7].Value;
            var id_card = m.Groups[8].Value;
            var open_time = m.Groups[9].Value;
            var is_newst = m.Groups[10].Value;
            var stage = m.Groups[11].Value;
            var client = m.Groups[12].Value;

            var sentBytes = new List<byte>();

            // 0. add module and action
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

            //tcpClient = new TcpClient(ip, int.Parse(port));
            //networkStream = tcpClient.GetStream();
            socket.Connect(new IPEndPoint(Dns.GetHostEntry(ip).AddressList[0], int.Parse(port)));
            Receive(socket);

            //networkStream.Write(sentBytes.ToArray(), 0, sentBytes.Count);
            socket.Send(sentBytes.ToArray());

            previousModule = module;
            previousAction = action;

            /*while (true)
            {
                //Thread.Sleep(1000);
                var receBytes = new byte[1024];
                var C = stream.Read(receBytes, 0, receBytes.Length);
                Console.WriteLine("receive {0} bytes", C);
                Console.WriteLine(Encoding.UTF8.GetString(receBytes));
            }*/
        }//Login

        private static void Receive(Socket _socket)
        {
            var state = new StateObject { workSocket = _socket };
            _socket.BeginReceive(state.buffer, 0, StateObject.BufferSize, SocketFlags.None, ReceiveCallback, state);
        }//Receive

        private static void ReceiveCallback(IAsyncResult ar)
        {
            var state = (StateObject)ar.AsyncState;
            var _socket = state.workSocket;

            /* EndReceive 方法将一直阻止到有数据可用为止。 
             * 如果您使用的是无连接协议，则 EndReceive 将读取传入网络缓冲区中第一个排队的可用数据报。 
             * 如果您使用的是面向连接的协议，则 EndReceive 方法将读取所有可用的数据，直到达到 BeginReceive 方法的 size 参数所指定的字节数为止。*/
            var bytesRead = _socket.EndReceive(ar);

            if (bytesRead <= 0)
            {
                Logger.Log("远程主机使用 Shutdown 方法关闭了 Socket 连接");
                return;
            }

            state.byteList.AddRange(state.buffer.ToList().GetRange(0, bytesRead));
            while (state.byteList.Count > 4)
            {
                var length = ToInt32(state.byteList);
                if (state.byteList.Count < length + 4)
                {
                    Logger.Log("不完整的数据包");
                    return;
                }

                ProcessPackage(state.byteList.GetRange(4, length).ToArray());
                state.byteList.RemoveRange(0, length + 4);
            }

            _socket.BeginReceive(state.buffer, 0, StateObject.BufferSize, SocketFlags.None, ReceiveCallback, state);
        }//ReceiveCallback

        private static void ProcessPackage(byte[] package)
        {
            var module = ToInt16(package);
            var action = ToInt16(package, 2);

            if (module == 0x789C)
            {
                Logger.Log("uncompress...", console: false);
                ProcessPackage(Ionic.Zlib.ZlibStream.UncompressBuffer(package));
            }
            else
            {
                switch ((module << 4) + action)
                {
                    //login
                    case (0 << 4) + 0:
                        Logger.Log(package[4] == 0 ? "登录成功" : "登录失败");
                        LogPackage(package, module, action);
                        break;
                    //get_player_info
                    case (0 << 4) + 2:
                        {
                            var index = 4;
                            var count = ToInt16(package, index);
                            Logger.Log(string.Format("昵称: {0}", UTF8.GetString(package, index + 2, count)));
                            index += 2 + count;
                            Logger.Log(string.Format("等级: {0}", ToInt32(package, index)));
                            index += 4;
                            Logger.Log(string.Format("元宝: {0}", ToInt32(package, index)));
                            index += 4;
                            Logger.Log(string.Format("铜钱: {0}", ToInt64(package, index)));
                            index += 8;
                            Logger.Log(string.Format("生命: {0}", ToInt32(package, index)));
                            index += 8;
                            Logger.Log(string.Format("体力: {0}", ToInt32(package, index)));
                            LogPackage(package, module, action);
                            break;
                        }
                    //get_player_camp_salary
                    case (0 << 4) + 20:
                        Logger.Log(package[4] == 0x57 ? string.Format("成功领取俸禄: {0}", ToInt32(package, 5)) : "领取俸禄失败");
                        LogPackage(package, module, action);
                        break;
                    //player_get_xian_ling_gift
                    case (13 << 4) + 20:
                        Logger.Log(package[4] == 0x8 ? string.Format("成功领取仙令: {0}", package[5]) : "领取仙令失败");
                        LogPackage(package, module, action);
                        break;
                    //get_day_stone
                    case (34 << 4) + 18:
                        Logger.Log(package[4] == 0x1 ? string.Format("成功领取灵石: {0}", ToInt32(package, 5)) : "领取灵石失败");
                        LogPackage(package, module, action);
                        break;
                    //bro_to_players
                    case (6 << 4) + 1:
                        {
                            var index1 = 10;
                            var count1 = ToInt16(package, index1);
                            var index2 = index1 + 2 + count1 + 3;
                            var count2 = ToInt16(package, index2);
                            Logger.Log(string.Format("{0}说: {1}", UTF8.GetString(package, index1 + 2, count1), UTF8.GetString(package, index2 + 2, count2)));
                            LogPackage(package, module, action);
                            break;
                        }
                    case (0 << 4) + 3://Logger.Log("update_player_data", console: false);
                        break;
                    case (0 << 4) + 40://Logger.Log("practice_notify", console: false);
                        break;
                    case (5 << 4) + 7://Logger.Log("exp_change_notify", console: false);
                        break;
                    case (20 << 4) + 74://Logger.Log("player_st_take_bible", console: false);
                        break;
                    case (20 << 4) + 13://Logger.Log("notify_get_good_fate", console: false);
                        break;
                    case (20 << 4) + 96://Logger.Log("firework_notify", console: false);
                        break;
                    case (28 << 4) + 11://Logger.Log("notify_global", console: false);
                        break;
                    case (52 << 4) + 2://Logger.Log("complete_number", console: false);
                        break;
                    case (150 << 4) + 8://Logger.Log("notify_all_server_star_count", console: false);
                        break;
                    case (218 << 4) + 1://Logger.Log("notify", console: false);
                        break;
                }

            }
        }//ProcessPackage

        private static void LogPackage(byte[] package, short module, short action)
        {
            var sb = new StringBuilder();
            foreach (var b in package)
                sb.AppendFormat("{0} ", b.ToString("X2"));
            Logger.Log(string.Format("module: {0}, action: {1}", module, action), console: false);
            Logger.Log(string.Format("[{0}]", sb), console: false);
        }//LogPackage

        public void GetPlayerInfo()
        {
            var sentBytes = new List<byte>();

            // 0. add module and action
            module = 0;
            action = 2;
            AppendInt16(sentBytes, module);
            AppendInt16(sentBytes, action);

            // L. last module and action
            AppendInt16(sentBytes, previousModule);
            AppendInt16(sentBytes, previousAction);

            // E. intert hader
            IntertHead(sentBytes);

            //networkStream.Write(sentBytes.ToArray(), 0, sentBytes.Count);
            socket.Send(sentBytes.ToArray());
            previousModule = module;
            previousAction = action;
        }//getDayStone

        /// <summary>
        /// 聊天
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
            module = 6;
            action = 0;
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

            //networkStream.Write(sentBytes.ToArray(), 0, sentBytes.Count);
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
            module = 0;
            action = 20;
            AppendInt16(sentBytes, module);
            AppendInt16(sentBytes, action);

            // L. last module and action
            AppendInt16(sentBytes, previousModule);
            AppendInt16(sentBytes, previousAction);

            // E. intert hader
            IntertHead(sentBytes);

            //networkStream.Write(sentBytes.ToArray(), 0, sentBytes.Count);
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
            module = 13;
            action = 20;
            AppendInt16(sentBytes, module);
            AppendInt16(sentBytes, action);

            // L. last module and action
            AppendInt16(sentBytes, previousModule);
            AppendInt16(sentBytes, previousAction);

            // E. intert hader
            IntertHead(sentBytes);

            //networkStream.Write(sentBytes.ToArray(), 0, sentBytes.Count);
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
            module = 34;
            action = 18;
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

            //networkStream.Write(sentBytes.ToArray(), 0, sentBytes.Count);
            socket.Send(sentBytes.ToArray());
            previousModule = module;
            previousAction = action;
        }//getDayStone

        private static void IntertHead(List<byte> byteList)
        {
            var length = byteList.Count;
            byteList.InsertRange(0, new List<byte> { (byte)(length >> 24), (byte)((length & 0xFF0000) >> 16), (byte)((length & 0xFF00) >> 8), (byte)(length & 0xFF) });
        }//IntertHead

        private static void AppendString(List<byte> byteList, string s)
        {
            // 1. get string bytes
            var bytes = Encoding.UTF8.GetBytes(s);

            // 2. append string length(Int16)
            byteList.AddRange(new List<byte> { (byte)((bytes.Length & 0xFF00) >> 8), (byte)(bytes.Length & 0xFF) });

            // 3. append string bytes
            byteList.AddRange(bytes);
        }//AppendString

        private static void AppendInt16(List<byte> byteList, Int16 i)
        {
            byteList.AddRange(new List<byte> { (byte)((i & 0xFF00) >> 8), (byte)(i & 0xFF) });
        }//AppendInt16

        private static void AppendInt32(List<byte> byteList, Int32 i)
        {
            byteList.AddRange(new List<byte> { (byte)(i >> 24), (byte)((i & 0xFF0000) >> 16), (byte)((i & 0xFF00) >> 8), (byte)(i & 0xFF) });
        }//AppendInt32

        private static void AppendByte(List<byte> byteList, byte b)
        {
            byteList.Add(b);
        }//AppendByte

        private static long Stamp()
        {
            return Convert.ToInt64((DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0)).TotalMilliseconds);
        }//Stamp

        private static Int16 ToInt16(IEnumerable<byte> bytes, int i = 0)
        {
            var bs = bytes.ToList().GetRange(i, 2);
            if (BitConverter.IsLittleEndian)
                bs.Reverse();
            return BitConverter.ToInt16(bs.ToArray(), 0);
        }//ToInt16

        private static Int32 ToInt32(IEnumerable<byte> bytes, int i = 0)
        {
            var bs = bytes.ToList().GetRange(i, 4);
            if (BitConverter.IsLittleEndian)
                bs.Reverse();
            return BitConverter.ToInt32(bs.ToArray(), 0);
        }//ToInt32

        private static Int64 ToInt64(IEnumerable<byte> bytes, int i = 0)
        {
            var bs = bytes.ToList().GetRange(i, 8);
            if (BitConverter.IsLittleEndian)
                bs.Reverse();
            return BitConverter.ToInt64(bs.ToArray(), 0);
        }//ToInt32
    }//class

    // State object for receiving data from remote device.  
    public class StateObject
    {
        // Client socket.  
        public Socket workSocket;
        // Size of receive buffer.  
        public const int BufferSize = 4096;
        // Receive buffer.  
        public readonly byte[] buffer = new byte[BufferSize];
        // Received data string.  
        //public StringBuilder sb = new StringBuilder();
        public readonly List<byte> byteList = new List<byte>();
    }
}//namespace