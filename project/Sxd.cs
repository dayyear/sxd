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
            var userPath = ConfigurationManager.AppSettings["userPath"];

            var users = XElement.Load("user.xml");
            var pattern = File.ReadAllText("pattern.txt");
            var replacement = File.ReadAllText("replacement.txt");
            foreach (var userX in users.Elements("user"))
            {
                Console.WriteLine(userX.Element("username").Value);
                try
                {
                    var web = new SxdWeb();

                    var username = userX.Element("username").Value;
                    var password = userX.Element("password").Value;
                    var user = web.LoginService(username, password);

                    var id = userX.Element("id").Value;
                    var url = userX.Element("url").Value;
                    var name = userX.Element("name").Value;

                    var userIni = File.ReadAllText(userPath, Encoding.GetEncoding("GBK"));
                    File.WriteAllText(userPath, Regex.Replace(userIni, string.Format(pattern, id), string.Format(replacement, id, url, user.Code, user.Time, user.Hash, user.Time1, user.Hash1, name)), Encoding.GetEncoding("GBK"));

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }//foreach
        }//GenerateUserIni

        public static void Test()
        {
            var userPath = ConfigurationManager.AppSettings["userPath"];


            /*var user = SxdClient.LoginPrepare("dayyear2", "orange", "s1");
            Console.WriteLine(user);*/


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
            //Console.WriteLine(match.Value);


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
            Logger.Log("程序开始", ConsoleColor.Green);
            while (true)
            {
                try
                {
                    // 1. 玩家选择
                    var i = 0;
                    var user = File.ReadAllText(ConfigurationManager.AppSettings["userPath"], Encoding.GetEncoding("GBK"));
                    var pattern = string.Format(File.ReadAllText("pattern.txt"), "(.*)");
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
                    var client = new SxdClient();
                    client.Login(url, code, time, hash, time1, hash1);
                    client.GetPlayerInfo();
                    client.PlayerInfoContrast();
                    client.EnterTown();
                    client.GetStatus();
                    client.GetLoginInfo();

                    client.GetPlayerFunction();
                    client.ChatWithPlayers("新年快乐");



                    //Thread.Sleep(1000);
                    client.Login(url, code, time, hash, time1, hash1, true);

                    // E. 线程锁死
                    Thread.CurrentThread.Join();
                }//try
                catch (Exception ex)
                {
                    Logger.Log(string.Format("发现错误：{0}", ex.Message), ConsoleColor.Red);
                }
            }//while (true)
        }//TestWhileInThread
    }//class
}//namespace
