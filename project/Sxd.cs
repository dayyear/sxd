using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Xml.Linq;
using Newtonsoft.Json.Linq;

namespace 神仙道
{
    static class Sxd
    {
        private static void CollectProtocols()
        {
            var protocols = new XElement("protocols");

            foreach (var file in Directory.GetFiles(@"I:\神仙道\基础数据准备\R162\Main\Action\com\protocols", "Mod_*_Base.as"))
            {
                var content = File.ReadAllText(file);
                var matches = Regex.Matches(content, @"public static const (.*?):Object = {module:(\d*?), action:(\d*?), request:(.*?), response:(.*?)};");
                var module = new XElement("module",
                    new XAttribute("id", matches[0].Groups[2].Value),
                    new XElement("class", Regex.Match(content, "public class (.*?) extends Object").Groups[1].Value));
                protocols.Add(module);
                foreach (Match match in matches)
                {
                    var _method = match.Groups[1].Value;
                    var _module = match.Groups[2].Value;
                    var _action = match.Groups[3].Value;
                    var _request = match.Groups[4].Value;
                    var _response = match.Groups[5].Value;
                    if (_module != matches[0].Groups[2].Value)
                        throw new Exception(string.Format("module值不一致，文件：{0}", file));
                    module.Add(new XElement("action",
                        new XAttribute("id", _action),
                        new XElement("method", _method),
                        new XElement("request", _request),
                        new XElement("response", _response)));
                }//action
            }//module

            protocols.Save("protocols/protocolsR162.xml");
        }//CollectProtocols

        private static void GenerateUserIni()
        {
            Directory.GetFiles("./", "0*.jpg").ToList().ForEach(File.Delete);

            var web = new SxdWeb();
            var user1 = File.ReadAllText(ConfigurationManager.AppSettings["userPath"], Encoding.GetEncoding("GBK"));
            var pattern1 = string.Format(File.ReadAllText("pattern.txt"), "(.*)", "username=(.*)\r\npassword=(.*)\r\n");
            var matches = Regex.Matches(user1, pattern1);
            foreach (Match match in matches)
            {
                Logger.Log(string.Format("{0}", match.Groups[8].Value), showTime: false);
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

            Directory.GetFiles("./", "0*.jpg").ToList().ForEach(File.Delete);
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
            while (true)
            {
                try
                {
                    // 1. 玩家选择
                    var i = 0;
                    Logger.Log("G. 生成user.ini文件", showTime: false);
                    Logger.Log("P. 收集游戏协议", showTime: false);
                    var user = File.ReadAllText(ConfigurationManager.AppSettings["userPath"], Encoding.GetEncoding("GBK"));
                    var pattern = string.Format(File.ReadAllText("pattern.txt"), "(.*)", string.Empty);
                    var matches = Regex.Matches(user, pattern);
                    foreach (Match match in matches)
                        Logger.Log(string.Format("{0}. {1}", i++, match.Groups[8].Value), showTime: false);
                    Logger.Log("请选择: ", showTime: false, writeLine: false);

                    var readLine = Console.ReadLine();
                    Logger.Log(readLine, console: false, showTime: false);
                    if (readLine.ToUpper() == "G")
                    {
                        GenerateUserIni();
                        continue;
                    }
                    if (readLine.ToUpper() == "P")
                    {
                        CollectProtocols();
                        continue;
                    }
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

                    // 登录
                    var playerId = clientTown.Login(url, code, time, hash, time1, hash1);
                    Logger.Log(string.Format("登录成功, 玩家ID: {0}", playerId), ConsoleColor.Green);

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

                    // 获取玩家基本信息
                    var response = clientTown.GetPlayerInfo();
                    var nickName = (string)response[0];
                    var townMapId = (int)response[9];
                    Logger.Log(string.Format("昵称：{0}，等级：{1}，元宝：{2}，铜钱：{3}，生命：{4}，体力：{5}，经验值：{6}，所在城镇：{7}", response[0], response[1], response[2], response[3], response[4], response[6], response[7], Protocols.GetTownName((int)response[9])));

                    // 获取玩家对比信息
                    response = clientTown.PlayerInfoContrast(playerId);
                    Logger.Log(string.Format("竞技：{0}，帮派：{1}，战力：{2}，声望：{3}，阅历：{4}，成就：{5}，先攻：{6}，境界：{7}，鲜花：{8}，仙令：{9}", response[0][0][1], response[0][0][2], response[0][0][3], response[0][0][4], response[0][0][5], response[0][0][6], response[0][0][7], response[0][0][8], response[0][0][9], response[0][0][10]));

                    // 进入城镇
                    response = clientTown.EnterTown(townMapId);
                    Logger.Log(string.Format("{3}进入{0}，坐标X：{1}，坐标Y：{2}", Protocols.GetTownName(townMapId), response[6], response[7], response[5]));

                    // 获取玩家功能列表
                    response = clientTown.GetPlayerFunction();
                    var functionIds = response[0].Select(x => (int)x[0]).ToList();
                    //Logger.Log(string.Format("玩家共开通{1}项功能：{0}", string.Join(",", functionIds.Select(x => string.Format("{0}({1})", Protocols.GetFunctionName(x), x))), functionIds.Count()));

                    // 获取游戏助手信息
                    response = clientTown.GetGameAssistantInfo();
                    var isGetCampSalary = (int)response[13];
                    var isCanGetStone = (int)response[30];
                    var stoneState = (int)response[31];
                    //Logger.Log(string.Format("is_can_get_stone：{0}，get_stone_state：{1}", response[30], response[31]));

                    // 领取俸禄
                    switch (isGetCampSalary)
                    {
                        case -1:
                            Logger.Log("未开通领取俸禄功能");
                            break;
                        case 0:
                            response = clientTown.GetPlayerCampSalary();
                            Logger.Log(string.Format("成功领取俸禄{0}个铜钱", response[1]));
                            break;
                        case 1:
                            Logger.Log("今日已领过俸禄");
                            break;
                        default:
                            throw new Exception(string.Format("未知的isGetCampSalary：{0}", isGetCampSalary));
                    }
                    // 领取仙令
                    // 70:["FindImmortal","286","喜从天降"],
                    if (functionIds.Contains(70))
                    {
                        response = clientTown.IsPlayerGetXianLingGift();
                        if ((byte)response[0] > 0)
                        {
                            response = clientTown.PlayerGetXianLingGift();
                            Logger.Log(string.Format("成功领取{0}仙令", response[1]));
                        }
                        else
                            Logger.Log("今日已领过仙令");
                    }
                    else
                        Logger.Log("未开通领取仙令功能");

                    // 领取灵石
                    switch (stoneState)
                    {
                        case 0:
                        case 1:
                            Logger.Log("未开通领取灵石功能");
                            break;
                        case 2:
                            switch (isCanGetStone)
                            {
                                case 0:
                                    response = clientTown.GetDayStone();
                                    Logger.Log(string.Format("成功领取{0}灵石", response[1]));
                                    break;
                                case 1:
                                    Logger.Log("今日已领过灵石");
                                    break;
                                default:
                                    throw new Exception(string.Format("未知的isCanGetStone：{0}", isCanGetStone));
                            }
                            break;
                        default:
                            throw new Exception(string.Format("未知的stoneState：{0}", stoneState));
                    }

                    // 领取随机礼包
                    foreach (var item in clientTown.GameFunctionEndGift()[0])
                    {
                        var _id = (short)item[0];
                        var _ingot = (int)item[8];
                        Logger.Log(string.Format("领取{0}礼包", Protocols.GetEndFunctionGiftName(_id)));
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

                    // 领取阵营战礼包
                    response = clientTown.GetEndGiftInfo();
                    // YES:int = 27;
                    if ((byte)response[0] == 27)
                    {
                        response = clientTown.GetEndGift();
                        Logger.Log(string.Format("领取阵营战礼包，声望：{0}，铜钱：{1}", response[1], response[2]));
                    }


                    // 摘仙桃
                    // 56:["GetPeach","340","摘仙桃"],
                    if (functionIds.Contains(56))
                    {
                        response = clientTown.PeachInfo();
                        var _fruitLv = 70 + (byte)response[0] * 5;
                        var _peachNum = (byte)response[1];
                        Logger.Log(string.Format("还剩{0}个{1}级仙桃", _peachNum, _fruitLv));
                        if (_peachNum > 0)
                        {
                            response = clientTown.BatchGetPeach();
                            if ((byte)response[0] == 0)
                                Logger.Log(string.Format("一键摘桃成功，摘取经验值：{0}", response[1]));
                            else
                                Logger.Log("一键摘桃失败", ConsoleColor.Red);
                        }
                    }
                    else
                        Logger.Log("未开通摘仙桃功能");

                    response = clientTown.ChatWithPlayers("BeelzebubTrials_360223_悠哉小魔王_360223_1_13");
                    foreach (var item in response[0])
                        Logger.Log(string.Format("{0}({2})说: {1}", item[1], item[5], item[0]));

                    // 仙界
                    // 91:["SuperTown","205","仙界"],
                    if (functionIds.Contains(91))
                    {
                        // 获取仙界状态
                        response = clientTown.GetStatus();
                        Logger.Log(string.Format("仙界入口状态：{0}", (int)response[0] == 0 ? "开启" : response[0]));

                        // 获取仙界登录信息
                        response = clientTown.GetLoginInfo();
                        var serverHostST = (string)response[0];
                        var portST = (int)response[1];
                        var serverNameST = (string)response[2];
                        var serverTimeST = (int)response[3];
                        var passCodeST = (string)response[4];
                        Logger.Log(string.Format("仙界服务器地址：{0}:{1}，仙界服务器名称：{2}，仙界服务器时间：{3}，passCode：{4}", serverHostST,
                            portST, serverNameST,
                            TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1))
                                .AddSeconds(serverTimeST)
                                .ToString("yyyy-MM-dd HH:mm:ss"), passCodeST));

                        var playerIdST = clientST.Login(serverHostST, portST, serverNameST, playerId, nickName,
                            serverTimeST, passCodeST);
                        Logger.Log(string.Format("仙界登录成功, 仙界玩家ID: {0}", playerIdST), ConsoleColor.Green);

                        //clientST.GetRecentRobPlayer();


                        response = clientST.OpenTakeBible();
                        var _players = (JArray)response[0];
                        Logger.Log(string.Format("打开护送取经界面，获取取经玩家：{0}", string.Join(",", _players.Select(
                            x => string.Format("{0}({1})", Protocols.GetProtectionName((byte)x[1]), x[0])))));
                        Logger.Log(string.Format("今日还可拦截{0}次，可取经{1}次，帮助好友护送{2}次", response[2], response[4], response[3]));


                        /*if (_takeBibleTimes < _totalTakeBibleTimes)
                        {
                            if (_canProtection == 0)
                                clientST.Refresh();
                            if (_takeBibleStatus == 0)
                            {
                                clientST.StartTakeBible();
                                response = clientST.GetTakeBibleInfo();
                                Logger.Log(string.Format("今日可取经共{0}次，已经取经{1}次，当前取经使者：{2}（{3}）",
                                    response[3], response[2], Protocols.GetProtectionName((byte)response[6]),
                                    (byte)response[5] == 0 ? "未开始" : "已开始"));
                            }
                        }*/
                        while (true)
                        {
                            response = clientST.GetTakeBibleInfo();
                            var _takeBibleTimes = (byte)response[2];
                            var _totalTakeBibleTimes = (byte)response[3];
                            var _takeBibleStatus = (byte)response[5];
                            var _canProtection = (byte)response[6];
                            Logger.Log(string.Format("今日可取经共{0}次，已经取经{1}次，当前取经使者：{2}（{3}）",
                                _totalTakeBibleTimes, _takeBibleTimes, Protocols.GetProtectionName(_canProtection),
                                _takeBibleStatus == 0 ? "未开始" : "已开始"));

                            if (_takeBibleTimes >= _totalTakeBibleTimes)
                                break;
                            if (_canProtection == 0)
                            {
                                Logger.Log("刷新使者");
                                clientST.Refresh();
                                continue;
                            }
                            if (_takeBibleStatus == 0)
                            {
                                Logger.Log("开始取经");
                                clientST.StartTakeBible();
                                continue;
                            }
                            break;
                        }
                        continue;
                        /*if (_takeBibleTimes == _totalTakeBibleTimes)
                        takeBibleStatus = TakeBibleStatus.NoMoreTimes;
                        else if (_canProtection == 0)
                            takeBibleStatus = TakeBibleStatus.ReadyToRefresh;
                        else if (_takeBibleStatus == 0)
                            takeBibleStatus = TakeBibleStatus.ReadyToStart;
                        else
                            takeBibleStatus = TakeBibleStatus.IsRunning;*/

                        /*switch (takeBibleInfo)
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
                        }*/
                    }
                    else
                        Logger.Log("未开通仙界功能");

                    //client.Login(url, code, time, hash, time1, hash1);

                    // E. 线程锁死
                    Thread.CurrentThread.Join();
                } //try
                catch (Exception ex)
                {
                    Logger.Log(string.Format("发现错误：{0}", ex.ToString()), ConsoleColor.Red);
                }
            }//while(true)
        }//TestWhileInThread
    }//class
}//namespace
