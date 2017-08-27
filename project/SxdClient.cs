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

namespace 神仙道
{
    public class SxdClient
    {
        private Int16 module = 0;
        private Int16 action = 0;
        private Int16 moduleLast = 0;
        private Int16 actionLast = 0;

        private TcpClient tcpClient;
        private NetworkStream networkStream;

        /// <summary>
        /// 登录
        /// [1. playerName, 2. hashCode, 3. time, 4. URI.sourceUrl, 5. URI.regdate, 
        ///  6. strIdCard, 7. URI.openTime, 8. URI.isNewSt, 9. URI.stageName, 10. URI.client]
        /// public static const login:Object = {
        /// module:0, action:0, 
        /// request:[1. Utils.StringUtil, 2. Utils.StringUtil, 3. Utils.StringUtil, 4. Utils.StringUtil, 5. Utils.IntUtil, 
        ///          6. Utils.StringUtil, 7. Utils.IntUtil, 8. Utils.ByteUtil, 9. Utils.StringUtil, 10. Utils.StringUtil], 
        /// response:[Utils.UByteUtil, Utils.IntUtil, Utils.UByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.IntUtil, Utils.ByteUtil, Utils.UByteUtil, Utils.IntUtil]};
        /// </summary>
        /// <param name="url"></param>
        /// <param name="code"></param>
        /// <param name="time"></param>
        /// <param name="hash"></param>
        /// <param name="time1"></param>
        /// <param name="hash1"></param>
        public void Login(string url, string code, string time, string hash, string time1, string hash1)
        {
            string responseString;

            var request = (HttpWebRequest)WebRequest.Create(url);
            request.Headers.Add("Cookie", string.Format("user={0};_time={1};_hash={2};login_time_sxd_xxxxxxxx={3};login_hash_sxd_xxxxxxxx={4}", code, time, hash, time1, hash1));
            //request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31";

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
            Console.WriteLine("player_name = {0}", player_name);
            Console.WriteLine("hash_code = {0}", hash_code);
            Console.WriteLine("time = {0}", time2);
            Console.WriteLine("ip = {0}", ip);
            Console.WriteLine("port = {0}", port);
            Console.WriteLine("source = {0}", source);
            Console.WriteLine("regdate = {0}", regdate);
            Console.WriteLine("id_card = {0}", id_card);
            Console.WriteLine("open_time = {0}", open_time);
            Console.WriteLine("is_newst = {0}", is_newst);
            Console.WriteLine("stage = {0}", HttpUtility.UrlDecode(stage));
            Console.WriteLine("client = {0}", HttpUtility.UrlDecode(client));


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

            tcpClient = new TcpClient(ip, int.Parse(port));
            networkStream = tcpClient.GetStream();

            networkStream.Write(sentBytes.ToArray(), 0, sentBytes.Count);
            moduleLast = module;
            actionLast = action;

        }//Login

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
            AppendInt16(sentBytes, moduleLast);
            AppendInt16(sentBytes, actionLast);

            // E. intert hader
            IntertHead(sentBytes);

            networkStream.Write(sentBytes.ToArray(), 0, sentBytes.Count);
            moduleLast = module;
            actionLast = action;

            /*while (true)
            {
                //Thread.Sleep(1000);
                var receBytes = new byte[1024];
                var C = stream.Read(receBytes, 0, receBytes.Length);
                Console.WriteLine("receive {0} bytes", C);
                Console.WriteLine(Encoding.UTF8.GetString(receBytes));
            }*/
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
            AppendInt16(sentBytes, moduleLast);
            AppendInt16(sentBytes, actionLast);

            // E. intert hader
            IntertHead(sentBytes);

            networkStream.Write(sentBytes.ToArray(), 0, sentBytes.Count);
            moduleLast = module;
            actionLast = action;
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
            AppendInt16(sentBytes, moduleLast);
            AppendInt16(sentBytes, actionLast);

            // E. intert hader
            IntertHead(sentBytes);

            networkStream.Write(sentBytes.ToArray(), 0, sentBytes.Count);
            moduleLast = module;
            actionLast = action;
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

    }//class
}//namespace