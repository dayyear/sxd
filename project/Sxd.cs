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
    internal static class Sxd
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
                } //action
            } //module

            protocols.Save("protocols/protocolsR162.xml");
        } //CollectProtocols

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
        } //GenerateUserIni

        private static void Analyze()
        {
            var client = new SxdClientTown();
            var isReceive = false;
            foreach (var item in File.ReadAllText("Log/七星封魔AM.txt").Split(new[] { "\r\n\r\n" }, StringSplitOptions.RemoveEmptyEntries))
            {
                var bytes = from Match match in Regex.Matches(item, "([0-9A-F]{2}) ") select Convert.ToByte(match.Groups[1].Value, 16);
                client.Analyze(bytes.ToArray(), isReceive);
                isReceive ^= true;
            }
        } //Analyze

        public static void Run(string arg)
        {
            var clientTown = new SxdClientTown();
            var clientST = new SxdClientST();
            while (true)
            {
                try
                {
                    // 玩家选择
                    var i = 0;
                    var user = File.ReadAllText(ConfigurationManager.AppSettings["userPath"], Encoding.GetEncoding("GBK"));
                    var pattern = string.Format(File.ReadAllText("pattern.txt"), "(.*)", string.Empty);
                    var matches = Regex.Matches(user, pattern);
                    foreach (Match match in matches)
                        Logger.Log(string.Format("{0}. {1}", i++, match.Groups[8].Value), showTime: false);
                    Logger.Log("请选择: ", showTime: false, writeLine: false);


                    var readLine = arg ?? Console.ReadLine();
                    Logger.Log(readLine, showTime: false);
                    switch (readLine.ToUpper())
                    {
                        case "USER":
                            GenerateUserIni();
                            continue;
                        case "PROTOCOL":
                            CollectProtocols();
                            continue;
                        case "ANALYZE":
                            Analyze();
                            continue;
                    }
                    i = int.Parse(readLine);
                    if (i >= matches.Count)
                        throw new IndexOutOfRangeException();

                    // 读取相应的玩家参数url, code, time, hash, time1, hash1
                    var url = matches[i].Groups[2].Value;
                    var code = matches[i].Groups[3].Value;
                    var time = matches[i].Groups[4].Value;
                    var hash = matches[i].Groups[5].Value;
                    var time1 = matches[i].Groups[6].Value;
                    var hash1 = matches[i].Groups[7].Value;

                    // 登录
                    var playerId = clientTown.Login(url, code, time, hash, time1, hash1);
                    Logger.Log(string.Format("登录成功, 玩家ID[{0}]", playerId), ConsoleColor.Green);

                    // 获取玩家基本信息
                    var response = clientTown.GetPlayerInfo();
                    var nickName = (string)response[0];
                    var townMapId = (int)response[9];
                    Logger.Log(string.Format("[{0}]，[等级{1}]，[元宝{2}]，[铜钱{3}]，[生命{4}]，[体力{5}]，[经验值{6}]，[所在城镇{7}]", response[0], response[1], response[2], response[3], response[4], response[6], response[7], Protocols.GetTownName((int)response[9])));

                    // 获取玩家对比信息
                    response = clientTown.PlayerInfoContrast(playerId);
                    var factionName = (string)response[0][0][2];
                    Logger.Log(string.Format("[排名{0}]，[帮派{1}]，[战力{2}]，[声望{3}]，[阅历{4}]，[成就{5}]，[先攻{6}]，[境界{7}]，[鲜花{8}]，[仙令{9}]", response[0][0][1], response[0][0][2], response[0][0][3], response[0][0][4], response[0][0][5], response[0][0][6], response[0][0][7], response[0][0][8], response[0][0][9], response[0][0][10]));

                    // 进入城镇
                    response = clientTown.EnterTown(townMapId);
                    Logger.Log(string.Format("[{3}]进入[{0}]，[坐标X{1}]，[坐标Y{2}]", Protocols.GetTownName(townMapId), response[6], response[7], response[5]));

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
                            Logger.Log(string.Format("成功领取俸禄[铜钱{0}]", response[1]));
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
                            Logger.Log(string.Format("成功领取[仙令{0}]", response[1]));
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
                                    Logger.Log(string.Format("成功领取[灵石{0}]", response[1]));
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
                        Logger.Log(string.Format("领取阵营战礼包，[声望{0}]，[铜钱{1}]", response[1], response[2]));
                    }

                    // 领取自定义挑战礼包
                    if (functionIds.Contains(106)) // 106:["CustomizeChallenge","380","自定义挑战"],
                    {
                        response = clientTown.GetEndLiBao();
                        // SUCCESS:int = 10;
                        if ((byte)response[0] == 10)
                            Logger.Log(string.Format("领取自定义挑战礼包，[铜钱{0}]，[道缘{1}]，[声望{2}]", response[1], response[2], response[3]));
                    } //if (functionIds.Contains(106)) // 106:["CustomizeChallenge","380","自定义挑战"],

                    // 领取极限挑战宝箱
                    if (functionIds.Contains(112)) // 112:["UnlimitChallenge","440","极限挑战"],
                    {
                        response = clientTown.GetEndAward();
                        // SUCCESS:int = 6;
                        if ((byte)response[0] == 6)
                            Logger.Log("领取极限挑战宝箱");
                    } //if (functionIds.Contains(112)) // 112:["UnlimitChallenge","440","极限挑战"],

                    if (functionIds.Contains(56)) // 56:["GetPeach","340","摘仙桃"],
                    {
                        response = clientTown.PeachInfo();
                        var _fruitLv = 70 + (byte)response[0] * 5;
                        var _peachNum = (byte)response[1];
                        Logger.Log(string.Format("还剩{0}个{1}级仙桃", _peachNum, _fruitLv));
                        if (_peachNum > 0)
                        {
                            response = clientTown.BatchGetPeach();
                            if ((byte)response[0] == 0)
                                Logger.Log(string.Format("一键摘桃成功，摘取[经验值{0}]", response[1]));
                            else
                                Logger.Log("一键摘桃失败", ConsoleColor.Red);
                        }
                    }// if (functionIds.Contains(56)) // 56:["GetPeach","340","摘仙桃"],

                    if (functionIds.Contains(15)) // 15:["Farm","150","药园"],
                    {
                        response = clientTown.GetFarmlandinfoList();
                        var _fields = (JArray)response[0];
                        //foreach (var _field in _fields)
                        //    Logger.Log(string.Format("farmland_level：{0}，is_plant：{1}，farmland_time：{2}", _field[9], _field[10], _field[8]));
                        // 可种植土地（is_plant=1 and farmland_time=0）
                        var _fieldsReady = _fields.Where(_field => (byte)_field[10] == 1 && (int)_field[8] == 0).ToList();
                        if (!_fieldsReady.Any())
                        {
                            Logger.Log("没有可种植的土地");
                            break;
                        }
                        // 土地最大等级
                        var _fieldMaxLevel = _fieldsReady.Max(_field => (int)_field[9]);
                        // 最优土地
                        var _fieldOptimization = _fieldsReady.First(_field => (int)_field[9] == _fieldMaxLevel);

                        // 种植伙伴
                        response = clientTown.GetPlayerRoleinfoList();
                        var _partners = (JArray)response[0];
                        //foreach (var _partner in _partners)
                        //    Logger.Log(string.Format("{0}，{1}，等级{2}", _partner[0], _partner[2], _partner[3]));
                        // 伙伴最大等级
                        var _partnerMaxLevel = _partners.Max(_partner => (int)_partner[3]);
                        // 最优伙伴
                        var _partnerOptimization = _partners.First(_partner => (int)_partner[3] == _partnerMaxLevel);

                        if (functionIds.Contains(43)) // 43:["CoinTree","250","发财树"],
                        {
                            while (true)
                            {
                                // 仙露
                                response = clientTown.BuyCoinTreeCountInfo();
                                if ((int)response[0] <= 0)
                                {
                                    Logger.Log("仙露已用完");
                                    break;
                                }

                                // 3:发财树; 1:普通
                                // SUCCESS:int = 8;
                                response = clientTown.PlantHerbs((int)_fieldOptimization[0], (int)_partnerOptimization[0], 3, 1);
                                if ((byte)response[0] == 8)
                                {
                                    response = clientTown.Harvest((int)_fieldOptimization[0]);
                                    if ((byte)response[0] == 8)
                                        Logger.Log(string.Format("给[{0}]种植[{1}]，收获[铜钱{2}]，", response[1], response[2], response[5]));
                                    else
                                    {
                                        Logger.Log("收获发财树失败", ConsoleColor.Red);
                                        break;
                                    }
                                }
                                else
                                {
                                    Logger.Log("种植发财树失败", ConsoleColor.Red);
                                    break;
                                }
                            } //while (true)
                        } //if (functionIds.Contains(43)) // 43:["CoinTree","250","发财树"],
                    } //if (functionIds.Contains(15)) //15:["Farm","150","药园"],

                    // 聊天
                    response = clientTown.ChatWithPlayers("新年快乐！");
                    foreach (var item in response[0])
                        Logger.Log(string.Format("{0}({2})说: {1}", item[1], item[5], item[0]));

                    // 仙界
                    if (functionIds.Contains(91)) // 91:["SuperTown","205","仙界"],
                    {
                        // 获取仙界状态
                        response = clientTown.GetStatus();
                        Logger.Log(string.Format("【仙界】入口状态：{0}", (int)response[0] == 0 ? "开启" : response[0]));

                        // 获取仙界登录信息
                        response = clientTown.GetLoginInfo();
                        var serverHostST = (string)response[0];
                        var portST = (int)response[1];
                        var serverNameST = (string)response[2];
                        var serverTimeST = (int)response[3];
                        var passCodeST = (string)response[4];
                        Logger.Log(string.Format("【仙界】服务器地址：{0}:{1}，仙界服务器名称：{2}，仙界服务器时间：{3}，passCode：{4}", serverHostST, portST, serverNameST, TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1)).AddSeconds(serverTimeST).ToString("yyyy-MM-dd HH:mm:ss"), passCodeST));

                        // 仙界登录
                        var playerIdST = clientST.Login(serverHostST, portST, serverNameST, playerId, nickName, serverTimeST, passCodeST);
                        Logger.Log(string.Format("【仙界】登录成功, 仙界玩家[ID{0}]", playerIdST), ConsoleColor.Green);

                        if (functionIds.Contains(90)) // 90:["ServerTakeBible","247","跨服取经"],
                        {
                            // 仇人
                            response = clientST.GetRecentRobPlayer();
                            var _enemyIds = response[0].Select(x => (int)x[0]).ToList();
                            //Logger.Log(string.Format("获取仇人：{0}", string.Join(",", _enemyIds)));

                            // 打开护送取经总界面
                            response = clientST.OpenTakeBible();
                            var _players = (JArray)response[0];
                            Logger.Log(string.Format("【跨服取经】打开护送取经界面，获取[{0}]个取经玩家，其中有[{1}]个仇人", _players.Count, string.Join(",", _players
                                .Where(x => _enemyIds.Contains((int)x[0]))
                                .Count() //.Select(x => string.Format("{0}({1})", Protocols.GetProtectionName((byte)x[1]), x[0]))
                                )));
                            Logger.Log(string.Format("【跨服取经】今日还可拦截[{0}]次，可取经[{1}]次，帮助好友护送[{2}]次", response[2], response[4], response[3]));

                            // 打开护送取经面板，刷新使者，开始护送
                            while (true)
                            {
                                response = clientST.GetTakeBibleInfo();
                                var _takeBibleTimes = (byte)response[2];
                                var _totalTakeBibleTimes = (byte)response[3];
                                var _takeBibleStatus = (byte)response[5];
                                var _canProtection = (byte)response[6];
                                Logger.Log(string.Format("【跨服取经】今日可取经共[{0}]次，已经取经[{1}]次，当前取经使者：[{2},{3}]", _totalTakeBibleTimes, _takeBibleTimes, Protocols.GetProtectionName(_canProtection), _takeBibleStatus == 0 ? "未开始" : "已开始"));

                                if (_takeBibleTimes >= _totalTakeBibleTimes)
                                    break;
                                if (_canProtection == 0)
                                {
                                    Logger.Log("【跨服取经】刷新使者");
                                    clientST.Refresh();
                                    continue;
                                }
                                if (_takeBibleStatus == 0)
                                {
                                    Logger.Log("【跨服取经】开始取经");
                                    clientST.StartTakeBible();
                                    continue;
                                }
                                break;
                            } //while(true)
                        } //if (functionIds.Contains(90)) // 90:["ServerTakeBible","247","跨服取经"],

                        if (functionIds.Contains(131)) // 131:["MarryHome","242","家园"],
                        {
                            response = clientST.BatchGetFurnitureEffect();
                            if (response[0].Any())
                                Logger.Log("【家园】每日领取家园奖励");
                        } //if (functionIds.Contains(131)) // 131:["MarryHome","242","家园"],

                        if (functionIds.Contains(132)) // 132:["StArena","300","仙界竞技场"],
                        {

                        } //if (functionIds.Contains(132)) // 132:["StArena","300","仙界竞技场"],

                        if (functionIds.Contains(93)) // 93:["st_super_sport","206","仙界竞技场"]，实际上是神魔竞技
                        {

                        } //if (functionIds.Contains(93)) // 93:["st_super_sport","206","仙界竞技场"],，实际上是神魔竞技

                    } //if (functionIds.Contains(91)) // 91:["SuperTown","205","仙界"],

                    if (functionIds.Contains(68)) // 68:["BeelzebubTrials","85","魔王试炼"],
                    {
                        // 领取道行奖励
                        response = clientTown.GetMoralAward();
                        // SUCCESS:int = 5;
                        if ((byte)response[0] == 5)
                            Logger.Log("【魔王试炼】领取道行奖励成功");
                    } //if (functionIds.Contains(68)) // 68:["BeelzebubTrials","85","魔王试炼"],

                    if (functionIds.Contains(60)) // 60:["PetAnimal","325","叶公好龙"],
                    {
                        while (true)
                        {
                            response = clientTown.PetAnimalInfo();
                            var _lv = (byte)response[1];
                            var _star = (byte)response[2];
                            var _feedNum = (int)response[4];
                            if (_lv >= 10 && _star >= 10)
                            {
                                Logger.Log("【叶公好龙】当前龙王已升级至最高等级");
                                break;
                            }
                            if (_feedNum <= 0)
                                break;

                            response = clientTown.FeedPetAnimal();
                            // SUCCESS:int = 0;
                            if ((byte)response[0] == 0)
                                Logger.Log(string.Format("【叶公好龙】普通培养，{1}获得[经验值{0}]", response[4], (byte)response[7] == 1 ? "暴击" : string.Empty));
                            else
                                Logger.Log("【叶公好龙】普通培养错误", ConsoleColor.Red);
                        }
                    } //if (functionIds.Contains(60)) // 60:["PetAnimal","325","叶公好龙"],

                    if (functionIds.Contains(34)) // 34:["TravelEvent","240","仙旅奇缘"],
                    {
                        while (true)
                        {
                            response = clientTown.GetEventAndAnswer();
                            var _eventId = (int)response[0];
                            if (_eventId == 0)
                                break;
                            var _cur_answer_times = (int)response[4];
                            var _tol_answer_times = (int)response[5];
                            if (_cur_answer_times == _tol_answer_times)
                            {
                                response = clientTown.LotteryDraw();
                                if ((byte)response[0] == 2)
                                {
                                    Logger.Log("【仙旅奇缘】成功领取[仙旅秘宝]宝箱");
                                    response = clientTown.GetEventAndAnswer();
                                }
                                else
                                    Logger.Log("【仙旅奇缘】领取[仙旅秘宝]宝箱异常", ConsoleColor.Red);
                            }
                            var _eventText = (string)response[1];
                            var _answers = (JArray)response[2];
                            var _answerFirst = _answers[0];
                            Logger.Log(string.Format("【仙旅奇缘】{0}", _eventText.Trim()));
                            Logger.Log(string.Format("【仙旅奇缘】{0}. {1}", _answerFirst[1], ((string)_answerFirst[2]).Trim()));
                            Logger.Log(string.Format("【仙旅奇缘】{0}", (string)clientTown.AnswerTravelEvent(_eventId, (int)_answerFirst[0])[0]));
                        }

                    } //if (functionIds.Contains(34)) // 34:["TravelEvent","240","仙旅奇缘"],

                    if (functionIds.Contains(86)) // 86:["HuntDemon","375","猎妖"],
                    {
                        response = clientTown.OpenHuntDemon();
                        var _free_times = (byte)response[0];
                        var _coin_times = (byte)response[1];
                        var _ingot_times = (byte)response[2];
                        Logger.Log(string.Format("【猎妖】今日可免费猎妖[{0}]次，铜钱猎妖[{1}]次，元宝猎妖[{2}]次", _free_times, _coin_times, _ingot_times));

                        while (_free_times > 0 || _coin_times > 0)
                        {
                            if (_free_times > 0)
                            {
                                response = clientTown.HuntDemon(0);
                                // SUCCESS:int = 5;
                                if ((byte)response[0] == 5)
                                    Logger.Log("【猎妖】免费猎妖");
                            }
                            else if (_coin_times > 0)
                            {
                                response = clientTown.HuntDemon(1);
                                // SUCCESS:int = 5;
                                if ((byte)response[0] == 5)
                                    Logger.Log("【猎妖】铜钱猎妖");
                            }
                            _free_times = (byte)response[3];
                            _coin_times = (byte)response[4];
                        }
                    } //if (functionIds.Contains(86)) // 86:["HuntDemon","375","猎妖"],

                    if (functionIds.Contains(126)) // 126:["Awake","460","觉醒"],
                    {
                        response = clientTown.PlayerForbiddenBookInfo();
                        var _items = (JArray)response[0];
                        foreach (var item in _items)
                        {
                            var _forbidden_type = (byte)item[0];
                            var _explore_type = (byte)item[1];
                            var _cost_coin = (int)item[2];
                            var _cost_ingot = (int)item[3];
                            if (_explore_type == 19 && _cost_coin == 0 && _cost_ingot == 0)
                            {
                                var _forbidden_dictionary = new Dictionary<byte, string> { { 16, "人间" }, { 17, "轩辕" }, { 18, "上古" } };
                                response = clientTown.ExploreForbiddenBook(_forbidden_type);
                                // SUCCESS:int = 5;
                                if ((byte)response[0] == 5)
                                    Logger.Log(string.Format("【觉醒】探索[{0}]禁地之书", _forbidden_dictionary[_forbidden_type]));
                                else
                                    Logger.Log(string.Format("【觉醒】探索禁地之书错误，result: {0}", response[0]), ConsoleColor.Red);
                            }
                        }
                    } //if (functionIds.Contains(126)) // 126:["Awake","460","觉醒"],

                    if (functionIds.Contains(54)) // 54:["RollCake","282","吉星高照"],
                    {
                        while (true)
                        {
                            response = clientTown.RollCakeGetState();
                            var _state = (byte)response[0];
                            var _type = (byte)response[1];
                            response = clientTown.RollCakeGetCount();
                            var _count = (short)response[0];
                            var _freeRobeNum = (byte)response[1];
                            if (_type == 0)
                            {
                                // NO_RECORD
                                if (_count == 0)
                                    break;
                                response = clientTown.RollCakeRoll();
                                Logger.Log(string.Format("【吉星高照】掷骰子，[{0}]", Protocols.GetRollCakeName((byte)response[1])));
                            }
                            else if (_type == 11 || _freeRobeNum == 0)
                            {
                                response = clientTown.RollCakeGetAward();
                                Logger.Log("【吉星高照】收获");
                            }
                            else
                            {
                                // HAVE_RECORD
                                response = clientTown.RollCakeReRoll();
                                Logger.Log(string.Format("【吉星高照】逆天改运，[{0}]", Protocols.GetRollCakeName((byte)response[1])));
                            }
                        }//while


                    } //if (functionIds.Contains(54)) // 54:["RollCake","282","吉星高照"],

                    if (functionIds.Contains(13) && !string.IsNullOrWhiteSpace(factionName)) // 13:["Faction","165","帮派"],
                    {
                        // 帮派祭神
                        while (true)
                        {
                            response = clientTown.FactionGodInfo();
                            var _incense_count = (int)response[3];
                            var _total_count = (int)response[4];

                            if (_incense_count >= _total_count)
                                break;

                            response = clientTown.Incense();
                            // SUCCESS:int = 32;
                            if ((byte)response[0] == 32)
                                Logger.Log("【帮派】给帮派神像上[白檀香]");
                            else
                                Logger.Log("【帮派】上香错误", ConsoleColor.Red);
                        }//while

                        // 七星封魔
                        response = clientTown.SealSatanMemberList();
                        response = clientTown.JoinSealSatan();
                        // JOIN_SUCCESS:int = 54;
                        if ((byte)response[0] == 54)
                            Logger.Log("【帮派】加入七星封魔");

                        // 帮派吉星高照
                        while (true)
                        {
                            response = clientTown.FactionRollCakeInfo();
                            var _remainTimes = (byte)response[2];

                            if (_remainTimes <= 0)
                                break;

                            response = clientTown.RollCake();
                            // SUCCESS:int = 32;
                            if ((byte)response[0] == 32)
                                Logger.Log(string.Format("【帮派】吉星高照，获得[积分{0}]，今日[积分{1}]", response[2], response[3]));
                            else
                                Logger.Log("【帮派】吉星高照错误", ConsoleColor.Red);
                        }//while
                    } //if (functionIds.Contains(13)) // 13:["Faction","165","帮派"],

                    if (functionIds.Contains(51)) // 51:["HeroMissionPractice","238","英雄扫荡"],
                    {
                        foreach (var _townId in Protocols.GetTownIds().Where(x => x <= 55).OrderByDescending(x => x))
                        {
                            response = clientTown.GetHeroMissionList(_townId);
                            var _missions = (JArray)response[0];
                            //Logger.Log(string.Format("{0}({1})", Protocols.GetTownName(_townId), _townId));
                            //foreach (var _mission in _missions)
                            //    Logger.Log(string.Format("id：{0}，isCanChallenge：{1}，rank：{2}，isFinished：{3}", _mission[0], _mission[1], _mission[2], _mission[3]));

                            var _missionsReady = _missions.Where(x => (byte)x[1] == 1 && (byte)x[3] == 1).ToList();
                            if (!_missionsReady.Any())
                                continue;
                            response = clientTown.StartPractice(_townId, 1, 0);
                            response = clientTown.Quickly();
                            switch ((byte)response[0])
                            {
                                case 10:
                                    // FINISH:int = 10;
                                    Logger.Log(string.Format("【英雄扫荡】扫荡英雄副本[{0}]完成", Protocols.GetTownName(_townId)));
                                    break;
                                case 6:
                                    // BAG_FULL:int = 6;
                                    Logger.Log(string.Format("【英雄扫荡】扫荡英雄副本[{0}]未完成，背包已满", Protocols.GetTownName(_townId)), ConsoleColor.Red);
                                    break;
                                case 7:
                                    // NOT_ENOUGH_POWER:int = 7;
                                    Logger.Log(string.Format("【英雄扫荡】扫荡英雄副本[{0}]未完成，体力已用光", Protocols.GetTownName(_townId)));
                                    break;
                                case 8:
                                    // NO_MISSION:int = 8;
                                    Logger.Log(string.Format("【英雄扫荡】扫荡英雄副本[{0}]未完成，没有副本任务", Protocols.GetTownName(_townId)), ConsoleColor.Red);
                                    break;
                                default:
                                    Logger.Log("【英雄扫荡】Unknown Mod_HeroMission_Base.notify: " + response[0], ConsoleColor.Red);
                                    break;
                            }
                            if ((byte)response[0] != 10)
                                break;
                        }
                    } //if (functionIds.Contains(51)) // 51:["HeroMissionPractice","238","英雄扫荡"],

                    if (functionIds.Contains(41)) // 41:["SuperSport","130","竞技场"],
                    {
                        while (true)
                        {
                            response = clientTown.OpenSuperSport();
                            var _remain = (short)response[4];
                            Logger.Log(string.Format("【竞技场】剩余[{0}]次竞技挑战", _remain));
                            if (_remain <= 0)
                                break;
                            var _cdTimer = (int)response[11];
                            var _challengePersonList = (JArray)response[12];
                            var _challengePersonFirst = _challengePersonList[0];
                            //foreach (var item in _challengePersonList) Logger.Log(string.Format("{0}[排名{1}]，", item[4], item[0]));

                            if (_cdTimer > 0)
                            {
                                Logger.Log(string.Format("【竞技场】等待[{0}]秒", _cdTimer), writeLine: false);
                                for (var t = 0; t < _cdTimer; t++)
                                {
                                    Logger.Log(".", writeLine: false, showTime: false, file: false);
                                    Thread.Sleep(1000);
                                }
                                Logger.Log(string.Empty, showTime: false);
                            }

                            // 开始挑战
                            response = clientTown.StartChallenge((int)_challengePersonFirst[0]);
                            // SUCCESS:int = 0;
                            if ((byte)response[0] == 0)
                                Logger.Log(string.Format("【竞技场】挑战[{0}][排名{1}]{2}", _challengePersonFirst[4], _challengePersonFirst[0], (int)response[2] == 0 ? "成功" : "失败"));
                            else
                            {
                                Logger.Log(string.Format("【竞技场】挑战异常，result：{0}", response[0]), ConsoleColor.Red);
                                break;
                            }
                        } //while(true)
                    } //if (functionIds.Contains(41)) // 41:["SuperSport","130","竞技场"],

                    if (functionIds.Contains(64)) // 64:["DailyBox","90","活跃度"],
                    {
                        response = clientTown.AssistantInfo();
                        for (var _sn = 1; _sn < response.Count; _sn++)
                        {
                            if ((int)response[_sn] != 0)
                                continue;
                            if ((byte)clientTown.AssistantGetAward(_sn)[0] == 0)
                                Logger.Log(string.Format("【活跃度】领取第[{0}]个今日活跃奖励", _sn));
                            else
                                break;
                        } //sn
                    } //if (functionIds.Contains(64)) // 64:["DailyBox","90","活跃度"],

                    if (functionIds.Contains(134)) // 134:["Fishing","243","钓鱼"],
                    {
                        response = clientTown.GetPlayerFishhook();
                        Logger.Log(string.Format("【钓鱼】剩余[{0}]个鱼钩", response[0]));
                        for (var _sn = 0; _sn < (int)response[0]; _sn++)
                        {
                            // SUCCESS:int = 0;
                            if ((byte)clientTown.DoFishing()[0] == 0)
                                Logger.Log("【钓鱼】钓鱼成功");
                            else
                                Logger.Log("【钓鱼】钓鱼错误", ConsoleColor.Red);
                        }
                    } //if (functionIds.Contains(134)) // 134:["Fishing","243","钓鱼"],

                    break;
                } //try
                catch (Exception ex)
                {
                    Logger.Log(string.Format("发现错误：{0}", ex.ToString()), ConsoleColor.Red);
                    break;
                }
            } //while(true)
        } //Run

    } //class
} //namespace
