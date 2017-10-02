using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Xml.Linq;

namespace 神仙道
{
    static class Sxd
    {
        public static void GenerateUserIni()
        {

            var web = new SxdWeb();
            var i = 0;
            var user1 = File.ReadAllText(ConfigurationManager.AppSettings["userPath"], Encoding.GetEncoding("GBK"));
            var pattern1 = string.Format(File.ReadAllText("pattern.txt"), "(.*)", "username=(.*)\r\npassword=(.*)\r\n");
            var matches = Regex.Matches(user1, pattern1);
            foreach (Match match in matches)
            {
                Logger.Log(string.Format("{0}. {1}", i++, match.Groups[8].Value), showTime: false);
                var id = match.Groups[1].Value;
                var url = match.Groups[2].Value;
                var name = match.Groups[8].Value;
                var username = match.Groups[9].Value;
                var password = match.Groups[10].Value;
                var server = url.Substring(7, url.IndexOf('.') - 7);
                var tuple = web.LoginService(username, password, server);
                var code = tuple.Item1;
                var time = tuple.Item2;
                var hash = tuple.Item3;
                var time1 = tuple.Item4;
                var hash1 = tuple.Item5;
                Logger.Log(string.Format("code: {0}, time: {1}, hash: {2}, time1: {3}, hash1: {4}", code, time, hash, time1, hash1));

                var pattern2 = string.Format(File.ReadAllText("pattern.txt"), id, string.Empty);
                var replacement = string.Format(File.ReadAllText("replacement.txt"), id, url, code, time, hash, time1, hash1, name);

                var user2 = File.ReadAllText(ConfigurationManager.AppSettings["userPath"], Encoding.GetEncoding("GBK"));
                File.WriteAllText(ConfigurationManager.AppSettings["userPath"], Regex.Replace(user2, pattern2, replacement), Encoding.GetEncoding("GBK"));
            }

        }//GenerateUserIni

        public static void Test()
        {
            var userPath = ConfigurationManager.AppSettings["userPath"];




            var id = "35586616.s1";
            var match = Regex.Match(File.ReadAllText(userPath, Encoding.GetEncoding("GBK")), string.Format(File.ReadAllText("pattern.txt"), id));
            if (!match.Success)
            {
                Logger.Log(string.Format("找不到用户[{0}]的信息", id));
                return;
            }

            var server = match.Groups[1].Value;
            var code = match.Groups[2].Value;
            var time = match.Groups[3].Value;
            var hash = match.Groups[4].Value;
            var time1 = match.Groups[5].Value;
            var hash1 = match.Groups[6].Value;


            var client = new SxdClientOld();
            const int gap = 1000;

            Thread.Sleep(gap);
            Logger.Log(string.Empty);
            Logger.Log("登录...");
            Logger.Log(string.Format("Login(server={0}, code={1}, time{2}, hash={3}, time1={4}, hash1={5})", server, code, time, hash, time1, hash1), console: false);
            client.Login(server, code, time, hash, time1, hash1);

            Thread.Sleep(gap);
            Logger.Log(string.Empty);
            Logger.Log("获取用户信息...");
            Logger.Log("GetPlayerInfo...", console: false);
            client.GetPlayerInfo();

            Thread.Sleep(gap);
            Logger.Log(string.Empty);
            Logger.Log("领取俸禄...");
            Logger.Log("GetPlayerCampSalary...", console: false);
            client.GetPlayerCampSalary();

            Thread.Sleep(gap);
            Logger.Log(string.Empty);
            Logger.Log("领取仙令...");
            Logger.Log("PlayerGetXianLingGift...", console: false);
            client.PlayerGetXianLingGift();

            Thread.Sleep(gap);
            Logger.Log(string.Empty);
            Logger.Log("领取灵石...");
            Logger.Log("GetDayStone...", console: false);
            client.GetDayStone();

            Thread.Sleep(gap);
            Logger.Log(string.Empty);
            Logger.Log("万事如意...");
            Logger.Log("ChatWithPlayers...", console: false);
            client.ChatWithPlayers("万事如意");

            Console.ReadKey();

        }//Test

        public static void TestWhileInThread()
        {
            var client = new SxdClient();
            var clientST = new SxdClientST();
            try
            {
                // 1. 玩家选择
                var i = 0;
                var user = File.ReadAllText(ConfigurationManager.AppSettings["userPath"], Encoding.GetEncoding("GBK"));
                var pattern = string.Format(File.ReadAllText("pattern.txt"), "(.*)", string.Empty);
                var matches = Regex.Matches(user, pattern);
                foreach (Match match in matches)
                    Logger.Log(string.Format("{0}. {1}", i++, match.Groups[8].Value), showTime: false);
                Logger.Log("请选择: ", showTime: false, writeLine: false);

                var readLine = Console.ReadLine();
                Logger.Log(readLine, console: false, showTime: false);
                i = int.Parse(readLine);
                if (i >= matches.Count)
                    throw new IndexOutOfRangeException();

                // 2. 读取相应的玩家参数url, code, time, hash, time1, hash1
                var url = matches[i].Groups[2].Value;
                var code = matches[i].Groups[3].Value;
                var time = matches[i].Groups[4].Value;
                var hash = matches[i].Groups[5].Value;
                var time1 = matches[i].Groups[6].Value;
                var hash1 = matches[i].Groups[7].Value;

                // 3. 开始工作
                client.Login(url, code, time, hash, time1, hash1);
                client.GetPlayerInfo();
                client.PlayerInfoContrast();


                client.EnterTown();
                client.GetPlayerFunction();

                client.PeachInfo();
                client.BatchGetPeach();


                client.ChatWithPlayers("BeelzebubTrials_360223_悠哉小魔王_360223_1_13");

                // 登录仙界
                client.GetStatus();
                client.GetLoginInfo();
                clientST.Login(client);
                //clientST.OpenTakeBible();
                clientST.GetTakeBibleInfo();

                //client.Login(url, code, time, hash, time1, hash1);

                // E. 线程锁死
                Thread.CurrentThread.Join();
            }//try
            catch (Exception ex)
            {
                Logger.Log(string.Format("发现错误：{0}", ex.ToString()), ConsoleColor.Red);
            }
        }//TestWhileInThread
    }//class
}//namespace
