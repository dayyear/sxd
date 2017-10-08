using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;

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


        public static void Analyze()
        {
            var client = new SxdClientTown();
            var isReceive = false;
            foreach (var item in File.ReadAllText("Log/领取俸禄.txt").Split(new[] { "\r\n\r\n" }, StringSplitOptions.RemoveEmptyEntries))
            {
                var bytes = from Match match in Regex.Matches(item, "([0-9A-F]{2}) ") select Convert.ToByte(match.Groups[1].Value, 16);
                client.Analyze(bytes.ToArray(), isReceive);
                isReceive ^= true;
            }
        }//Analyze

        public static void TestWhileInThread()
        {
            var clientTown = new SxdClientTown();
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
                clientTown.Login(url, code, time, hash, time1, hash1);
                /*var isReceive = false;
                foreach (var item in File.ReadAllText("Log/领取礼包.txt").Split(new[] { "\r\n\r\n" }, StringSplitOptions.RemoveEmptyEntries))
                {
                    var bytes = from Match match in Regex.Matches(item, "([0-9A-F]{2}) ") select Convert.ToByte(match.Groups[1].Value, 16);
                    if (!isReceive)
                    {
                        client.Send(bytes.ToArray());
                        Thread.Sleep(5000);
                    }
                    isReceive ^= true;
                }*/


                clientTown.GetPlayerInfo();
                clientTown.PlayerInfoContrast();


                clientTown.EnterTown();
                clientTown.GetPlayerFunction();

                // 领取俸禄、仙令、灵石
                clientTown.GetPlayerCampSalary();
                clientTown.PlayerGetXianLingGift();
                clientTown.GetDayStone();

                // 领取随机礼包
                var endFunctionGift = new Dictionary<short, string> { { 1, "吉星高照" }, { 4, "龙鱼仙令" }, { 7, "灵脉" }, { 13, "拜关公" }, { 16, "龙鱼境界点" } };
                foreach (var item in clientTown.GameFunctionEndGift()[0])
                {
                    var _id = (short)item[0];
                    var _ingot = (int)item[8];
                    Logger.Log(string.Format("领取{0}礼包", endFunctionGift[_id]));
                    if (_ingot == 0)
                        clientTown.RandomAward(_id);
                    clientTown.GetGameFunctionEndGift(_id);
                }

                // 领取礼包
                foreach (var item in clientTown.GetPlayerGiftAllInfo()[0])
                {
                    var _id = (int)item[0];
                    var _message = (string)item[2];
                    Logger.Log(_message);
                    clientTown.PlayerGetSuperGift(_id);
                }
                clientTown.GetEndGiftInfo();

                // 摘仙桃
                clientTown.PeachInfo();
                clientTown.BatchGetPeach();


                clientTown.ChatWithPlayers("BeelzebubTrials_360223_悠哉小魔王_360223_1_13");

                // 登录仙界
                clientTown.GetStatus();
                clientTown.GetLoginInfo();
                clientST.Login(clientTown);


                clientST.GetRecentRobPlayer();
                clientST.OpenTakeBible();
                var takeBibleInfo = clientST.GetTakeBibleInfo();
                switch (takeBibleInfo)
                {
                    case TakeBibleStatus.ReadyToRefresh:
                        clientST.Refresh();
                        clientST.StartTakeBible();
                        clientST.GetTakeBibleInfo();
                        break;
                    case TakeBibleStatus.ReadyToStart:
                        clientST.StartTakeBible();
                        clientST.GetTakeBibleInfo();
                        break;
                }

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
