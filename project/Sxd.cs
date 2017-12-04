using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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

            foreach (var file in Directory.GetFiles(@"I:\神仙道\基础数据准备\R164\Main\Action\com\protocols", "Mod_*_Base.as"))
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

            protocols.Save("protocols/protocolsR164.xml");
        } //CollectProtocols

        private static void GenerateCookies()
        {
            Directory.GetFiles("./", "0*.jpg").ToList().ForEach(File.Delete);
            foreach (var user in JArray.Parse(File.ReadAllText("user.json")))
            {
                if ((string)user["name"] == "度日如年.s152")
                {
                    Logger.Log(string.Format("{0}", user["name"]), showTime: false);
                    var web = new SxdWeb();
                    web.LoginFromIE(string.Format("cookies/{0}.", user["name"]));
                }
                else
                {
                    var username = (string)user["username"];
                    var password = (string)user["password"];
                    Logger.Log(string.Format("{0}", user["name"]), showTime: false);
                    var web = new SxdWeb();
                    web.LoginService(username, password, string.Format("cookies/{0}.", user["name"]));
                }
            }
            Directory.GetFiles("./", "0*.jpg").ToList().ForEach(File.Delete);
        } //GenerateCookies

        private static void Analyze()
        {
            var client = new SxdClientTown();
            var isReceive = false;
            Logger.Log("请输入抓包文件名: ", showTime: false, writeLine: false);
            var readLine = Console.ReadLine();
            Logger.Log(readLine, showTime: false);
            foreach (var item in File.ReadAllText(string.Format("Log/{0}", readLine)).Split(new[] { "\r\n\r\n" }, StringSplitOptions.RemoveEmptyEntries))
            {
                if (item.StartsWith("=================================================="))
                    continue;
                var itemFixed = string.Join("", item.Split(new[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries).ToList().Select(x => x.Substring(10, 49)));
                var bytes = from Match match in Regex.Matches(itemFixed, "([0-9A-F]{2}) ") select Convert.ToByte(match.Groups[1].Value, 16);
                client.Analyze(bytes.ToArray(), isReceive);
                isReceive ^= true;
            }
        } //Analyze

        private static void Play(string playPage)
        {
            var clientTown = new SxdClientTown();
            var clientST = new SxdClientST();

            // 登录
            var playerId = clientTown.Login(playPage);
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
                    Logger.Log("没有可种植的土地", ConsoleColor.Red);
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
                Logger.Log(string.Format("【仙界】入口状态：{0}，代码{1}", (int)response[0] == 0 ? "开启" : "关闭", response[0]));
                if ((int)response[0] == 0)
                {
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

                    // SUCCESS:int = 2;
                    if ((byte)clientST.EnterTown()[0] == 2)
                        Logger.Log("【仙界】进入仙界");
                    else
                        Logger.Log("【仙界】进入仙界错误", ConsoleColor.Red);

                    if (functionIds.Contains(90)) // 90:["ServerTakeBible","247","跨服取经"],
                    {
                        // 仇人
                        //response = clientST.GetRecentRobPlayer();
                        //var _enemyIds = response[0].Select(x => (int)x[0]).ToList();
                        //Logger.Log(string.Format("获取仇人：{0}", string.Join(",", _enemyIds)));

                        // 打开护送取经总界面
                        response = clientST.OpenTakeBible();
                        var _players = (JArray)response[0];
                        Logger.Log(string.Format("【跨服取经】当前[{0}]个取经玩家", _players.Count));
                        Logger.Log(string.Format("【跨服取经】今日还可拦截[{0}]次，可取经[{1}]次，帮助好友护送[{2}]次", response[2], response[4], response[3]));

                        // 打开护送取经面板，刷新使者，开始护送
                        while (true)
                        {
                            response = clientST.GetTakeBibleInfo();
                            var _takeBibleTimes = (byte)response[2];
                            var _totalTakeBibleTimes = (byte)response[3];
                            var _takeBibleStatus = (byte)response[5];
                            var _canProtection = (byte)response[6];
                            Logger.Log(string.Format("【跨服取经】当前取经使者[{0}]，状态[{1}]", Protocols.GetProtectionName(_canProtection), _takeBibleStatus == 0 ? "未开始" : "已开始"));

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

                    #region 家园
                    if (functionIds.Contains(131)) // 131:["MarryHome","242","家园"],
                    {
                        response = clientST.BatchGetFurnitureEffect();
                        if (response[0].Any())
                            Logger.Log("【家园】每日领取家园奖励");
                    } //if (functionIds.Contains(131)) // 131:["MarryHome","242","家园"],
                    #endregion

                    #region 仙界竞技场
                    if (functionIds.Contains(132)) // 132:["StArena","300","仙界竞技场"],
                    {
                        // 比赛阶段
                        response = clientST.GetRaceStep();
                        // SCORE_RACE:int = 0; SCORE_RACE_COMPLETE:int = 1;
                        if ((byte)response[0] == 1)
                        {
                            Logger.Log("【仙界竞技场】今日[争霸赛]");
                        } //争霸赛
                        else
                        {
                            Logger.Log("【仙界竞技场】今日[积分赛]");

                            while (true)
                            {
                                response = clientST.OpenStArena();
                                var _integral = (int)response[0];
                                var _reduceChallengeCount = (short)response[1];
                                var _awardFeats = (int)response[2];
                                Logger.Log(string.Format("【仙界竞技场】我的积分[{0}]，积分奖励[{1}荣誉]，今日还可挑战[{2}]次", _integral, _awardFeats, _reduceChallengeCount));
                                if (_reduceChallengeCount <= 0)
                                    break;

                                // 可挑战对手
                                var _challengeList = ((JArray)response[5]).ToList();
                                _challengeList.Sort((x, y) => ((int)x[1]).CompareTo((int)y[1]));

                                // 开始挑战
                                response = clientST.StArenaChallenge((int)_challengeList[0][0]);
                                var _challengeAddIntegral = (int)response[3];
                                // SUCCESS:int = 13;
                                if ((byte)response[0] == 13)
                                {
                                    if (_challengeAddIntegral > 0)
                                        Logger.Log(string.Format("【仙界竞技场】挑战[{0}级]对手胜利，获得积分[{1}]", _challengeList[0][3], _challengeAddIntegral));
                                    else
                                    {
                                        Logger.Log(string.Format("【仙界竞技场】挑战[{0}级]对手失败", _challengeList[0][3]));

                                        response = clientST.RefreshPlayerList();
                                        // SUCCESS:int = 13;
                                        if ((byte)response[0] == 13)
                                            Logger.Log("【仙界竞技场】成功刷新挑战列表");
                                        // CD_TIME:int = 14;
                                        else if ((byte)response[0] == 14)
                                        {
                                            Logger.Log("【仙界竞技场】刷新挑战列表冷却时间");
                                            break;
                                        }
                                        else
                                        {
                                            Logger.Log(string.Format("【仙界竞技场】刷新挑战列表错误，result:{0}", response[0]), ConsoleColor.Red);
                                            break;
                                        }
                                    }
                                }
                                else
                                {
                                    Logger.Log(string.Format("【仙界竞技场】挑战错误，result:{0}", response[0]), ConsoleColor.Red);
                                    break;
                                }
                            }//while
                        } //积分赛

                        // 荣誉商店买内丹
                        response = clientTown.ExploitShopItemList();
                        // 2表示内丹
                        var _good_id = (byte)2;
                        var _good_count = (short)((JArray)response[0]).ToList().First(x => (byte)x[0] == _good_id)[1];
                        if (_good_count > 0)
                        {
                            response = clientTown.BuyExploitShopItem(_good_id, _good_count);
                            // SUCCESS:int = 13;
                            if ((byte)response[0] == 13)
                                Logger.Log(string.Format("【仙界竞技场】荣誉商店买下[内丹]×{0}", _good_count));
                            else
                                Logger.Log(string.Format("【仙界竞技场】荣誉商店买[内丹]错误，result：{0}", response[0]), ConsoleColor.Red);
                        }
                        else
                            Logger.Log("【仙界竞技场】荣誉商店今日[内丹]已卖完");
                    } //if (functionIds.Contains(132)) // 132:["StArena","300","仙界竞技场"],
                    #endregion

                    #region 神魔竞技
                    if (functionIds.Contains(93)) // 93:["st_super_sport","206","仙界竞技场"]，实际上是神魔竞技
                    {
                        // 状态
                        response = clientST.GetStSuperSportStatus();
                        // WAR_RACE:int = 25;
                        if ((byte)response[0] == 25)
                        {
                            Logger.Log("【神魔竞技】今日[神魔大战]");

                            response = clientST.StSuperSportGetRaceStep();
                            var _bet_player_id = (int)response[10];
                            if (_bet_player_id > 0)
                                Logger.Log("【神魔竞技】已投注");
                            else
                            {
                                var _race_step = (byte)response[0];
                                // ST_SUPER_SPORT_WAR_PREPARE:int = 5;     ST_SUPER_SPORT_WAR_16_COMPLETE:int = 7;
                                // ST_SUPER_SPORT_WAR_8_COMPLETE:int = 9;  ST_SUPER_SPORT_WAR_4_COMPLETE:int = 11;
                                // ST_SUPER_SPORT_WAR_2_COMPLETE:int = 13; ST_SUPER_SPORT_WAR_1_COMPLETE:int = 15;
                                if (_race_step % 2 == 1 && _race_step >= 5 && _race_step <= 15)
                                {
                                    var _player_list = new List<List<JToken>>();
                                    var _top16_list = new List<int>();
                                    var _top8_list = new List<int>();
                                    var _top4_list = new List<int>();
                                    var _top2_list = new List<int>();
                                    var _top1_list = new List<int>();

                                    // 神族
                                    response = clientST.StSuperSportGetRaceList(1);
                                    var _player1_list = response[1].ToList();
                                    foreach (var _player in _player1_list)
                                    {
                                        _player_list.Add(_player.ToList().GetRange(0, 14));
                                        _player_list.Add(_player.ToList().GetRange(14, 14));
                                    }
                                    _top16_list.AddRange(response[3].Select(x => (int)x[0]));
                                    _top8_list.AddRange(response[4].Select(x => (int)x[0]));
                                    _top4_list.AddRange(response[5].Select(x => (int)x[0]));
                                    _top2_list.AddRange(response[6].Select(x => (int)x[0]));
                                    _top1_list.Add((int)response[7]);

                                    // 魔族
                                    response = clientST.StSuperSportGetRaceList(2);
                                    var _player2_list = ((JArray)response[1]).ToList();
                                    foreach (var _player in _player2_list)
                                    {
                                        _player_list.Add(_player.ToList().GetRange(0, 14));
                                        _player_list.Add(_player.ToList().GetRange(14, 14));
                                    }
                                    _top16_list.AddRange(response[3].Select(x => (int)x[0]));
                                    _top8_list.AddRange(response[4].Select(x => (int)x[0]));
                                    _top4_list.AddRange(response[5].Select(x => (int)x[0]));
                                    _top2_list.AddRange(response[6].Select(x => (int)x[0]));
                                    _top1_list.Add((int)response[7]);

                                    List<JToken> _playerOptimization;
                                    switch (_race_step)
                                    {
                                        case 5:
                                            _player_list.Sort((x, y) => ((int)x[3]).CompareTo((int)y[3]));
                                            _playerOptimization = _player_list.Last();
                                            break;
                                        case 7:
                                            _player_list = _player_list.Where(x => _top16_list.Contains((int)x[0])).ToList();
                                            _player_list.Sort((x, y) => ((int)x[3]).CompareTo((int)y[3]));
                                            _playerOptimization = _player_list.Last();
                                            break;
                                        case 9:
                                            _player_list = _player_list.Where(x => _top8_list.Contains((int)x[0])).ToList();
                                            _player_list.Sort((x, y) => ((int)x[3]).CompareTo((int)y[3]));
                                            _playerOptimization = _player_list.Last();
                                            break;
                                        case 11:
                                            _player_list = _player_list.Where(x => _top4_list.Contains((int)x[0])).ToList();
                                            _player_list.Sort((x, y) => ((int)x[3]).CompareTo((int)y[3]));
                                            _playerOptimization = _player_list.Last();
                                            break;
                                        case 13:
                                            _player_list = _player_list.Where(x => _top2_list.Contains((int)x[0])).ToList();
                                            _player_list.Sort((x, y) => ((int)x[3]).CompareTo((int)y[3]));
                                            _playerOptimization = _player_list.Last();
                                            break;
                                        case 15:
                                            _player_list = _player_list.Where(x => _top1_list.Contains((int)x[0])).ToList();
                                            _player_list.Sort((x, y) => ((int)x[3]).CompareTo((int)y[3]));
                                            _playerOptimization = _player_list.Last();
                                            break;
                                        default:
                                            throw new Exception("不可能");
                                    }
                                    var _playId = (int)_playerOptimization[0];
                                    var _playName = (string)_playerOptimization[1];
                                    response = clientST.StSuperSportBet(_playId);
                                    // SUCCESS:int = 28;
                                    if ((byte)response[0] == 28)
                                        Logger.Log(string.Format("【神魔竞技】投注战场最强玩家[{0}]", _playName));
                                    else
                                        Logger.Log("【神魔竞技】投注错误", ConsoleColor.Red);
                                }
                            }



                        }//神魔大战
                        else
                        {
                            Logger.Log("【神魔竞技】今日[积分赛]");

                            while (true)
                            {
                                // 玩家信息
                                response = clientST.GetPlayerStSuperSport();
                                var _st_super_sport_rank = (short)response[0];
                                var _remain_challenge_times = (short)response[2];
                                var _cd_time = (short)response[3];
                                Logger.Log(string.Format("【神魔竞技】排名[{0}]，今日还可挑战[{1}]次", _st_super_sport_rank, _remain_challenge_times));
                                if (_remain_challenge_times <= 0)
                                    break;

                                // 可挑战对手
                                response = clientST.ChallengeList();
                                var _challengeList = ((JArray)response[0]).ToList();
                                // is_challenge, NO:int = 27;  .Where(x=>(byte)x[6]==27)
                                _challengeList.Sort((x, y) => ((int)x[5]).CompareTo((int)y[5]));
                                // 如果是上午，则去掉后3个战力强的
                                if (DateTime.Now.Hour < 12)
                                    _challengeList.RemoveRange(2, 3);
                                _challengeList = _challengeList.Where(x => (byte)x[6] == 27).ToList();
                                if (_challengeList.Count <= 0)
                                    break;

                                if (_cd_time > 0)
                                {
                                    Logger.Log(string.Format("【神魔竞技】等待[{0}]秒", _cd_time), writeLine: false);
                                    for (var t = 0; t < _cd_time; t++)
                                    {
                                        Logger.Log(".", writeLine: false, showTime: false, file: false);
                                        Thread.Sleep(1000);
                                    }
                                    Logger.Log(string.Empty, showTime: false);
                                }

                                // 开始挑战
                                response = clientST.Challenge((byte)_challengeList[0][0]);
                                // SUCCESS:int = 28;
                                if ((byte)response[0] == 28)
                                    Logger.Log(string.Format("【神魔竞技】挑战[{0}]{1}", _challengeList[0][2], (short)response[8] == 0 ? "胜利" : "失败"));
                                else
                                {
                                    Logger.Log(string.Format("【神魔竞技】挑战错误，result:{0}", response[0]), ConsoleColor.Red);
                                    break;
                                }
                            }//while
                        }//积分赛


                        // 领取排名奖励
                        response = clientST.GetPlayerStSuperSport();
                        // _is_get_award, NO:int = 27;
                        if ((byte)response[5] == 27)
                        {
                            var _level = (short)clientTown.GetPlayerInfo()[1];
                            response = clientST.GetRankAward(_level);
                            // SUCCESS:int = 28;
                            if ((byte)response[0] == 28)
                                Logger.Log(string.Format("【神魔竞技】领取排名奖励铜钱[{0}]，声望[{1}]，血脉精华[{2}]", response[1], response[2], response[3]));
                        }// 领取排名奖励

                        // 神魔大礼
                        // public static const StSuperSportScoreAward:Array = [[1, "普通宝箱", 1100, 5, 20, 300000, 500, 2], [2, "普通宝箱", 1300, 8, 50, 500000, 600, 2], [3, "普通宝箱", 1500, 10, 100, 1000000, 800, 2], [4, "普通宝箱", 1800, 20, 200, 1200000, 1000, 2], [5, "普通宝箱", 2000, 30, 300, 1500000, 1200, 2], [6, "青铜宝箱", 2200, 50, 500, 2000000, 1500, 3], [7, "白银宝箱", 2400, 80, 700, 3000000, 1600, 4], [8, "黄金宝箱", 2600, 100, 1000, 5000000, 1800, 5]];
                        response = clientST.CanGetScoreAward();
                        // YES:int = 26;
                        if ((byte)response[0] == 26)
                        {
                            response = clientST.PlayerScoreAwardInfo();
                            var _self_score = (short)response[0];  // 1136
                            var _award_info = (JArray)response[1]; // [[5,27],[4,27],[8,27],[2,27],[1,26],[6,27],[3,27],[7,27]]
                            //var _award_info_sorted = _award_info.ToList();
                            //_award_info_sorted.Sort((x, y) => ((byte)x[0]).CompareTo((byte)y[0]));
                            //var _award_info_can_get = _award_info.Where(x => (byte)x[1] == 27);
                            var StSuperSportScoreAward = JArray.Parse("[[1, \"普通宝箱\", 1100, 5, 20, 300000, 500, 2], [2, \"普通宝箱\", 1300, 8, 50, 500000, 600, 2], [3, \"普通宝箱\", 1500, 10, 100, 1000000, 800, 2], [4, \"普通宝箱\", 1800, 20, 200, 1200000, 1000, 2], [5, \"普通宝箱\", 2000, 30, 300, 1500000, 1200, 2], [6, \"青铜宝箱\", 2200, 50, 500, 2000000, 1500, 3], [7, \"白银宝箱\", 2400, 80, 700, 3000000, 1600, 4], [8, \"黄金宝箱\", 2600, 100, 1000, 5000000, 1800, 5]]");
                            //.Where(x => (short)x[2] <= _self_score);
                            foreach (var item in StSuperSportScoreAward)
                            {
                                // 如遇到积分不够，则跳出
                                if ((short)item[2] > _self_score)
                                    break;

                                var _index = (byte)item[0];
                                var _is_get = (byte)_award_info.First(x => (byte)x[0] == _index)[1];

                                // 如遇到已经领过，则continue
                                //YES:int = 26;
                                if (_is_get == 26)
                                    continue;

                                // SUCCESS:int = 28;
                                if ((byte)clientST.PlayerGetScoreAward(_index)[0] == 28)
                                    Logger.Log(string.Format("【神魔竞技】领取[神魔大礼][{3}]血脉精华[{0}]，声望[{1}]，铜钱[{2}]", item[3], item[6], item[5], item[1]));
                                else
                                    Logger.Log("【神魔竞技】[神魔大礼]领取错误", ConsoleColor.Red);
                            }
                        }// 神魔大礼

                    } //if (functionIds.Contains(93)) // 93:["st_super_sport","206","仙界竞技场"],，实际上是神魔竞技
                    #endregion
                }//if ((int)response[0] == 0)
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
                    else if ((byte)response[0] == 2)
                    {
                        clientTown.UpPetAnimal();
                        Logger.Log("【叶公好龙】进化", ConsoleColor.Green);
                    }
                    else
                    {
                        Logger.Log("【叶公好龙】普通培养错误", ConsoleColor.Red);
                        break;
                    }
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
                        // SUCCESS:int = 0;
                        if ((byte)response[0] == 0)
                            Logger.Log("【吉星高照】收获");
                        else
                            Logger.Log("【吉星高照】收获错误", ConsoleColor.Red);
                    }
                    else
                    {
                        // HAVE_RECORD
                        response = clientTown.RollCakeReRoll();
                        Logger.Log(string.Format("【吉星高照】逆天改运，[{0}]", Protocols.GetRollCakeName((byte)response[1])));
                    }
                }//while
            } //if (functionIds.Contains(54)) // 54:["RollCake","282","吉星高照"],

            if (functionIds.Contains(96)) // 96:["ChaosVoid","404","混沌虚空"],
            {
                response = clientTown.OpenSpaceFind();
                var _count = (short)response[0];
                Logger.Log(string.Format("【混沌虚空】今日可抓捕[{0}]次", _count));
                for (var _i = 0; _i < _count; _i++)
                {
                    clientTown.DoSpaceFind();
                    clientTown.GetSpaceFind();
                }
            } //if (functionIds.Contains(96)) // 96:["ChaosVoid","404","混沌虚空"],

            if (functionIds.Contains(117)) // 117:["FiveElementsLaBa","449","五行天仪"],
            {
                response = clientTown.LabaInfo();
                var _free_count = (byte)response[0];
                var _coin_count = (byte)response[1];
                Logger.Log(string.Format("【五行天仪】今日可免费转动[{0}]次，铜钱转动[{1}]次", _free_count, _coin_count));
                for (var _i = 0; _i < _free_count + _coin_count; _i++)
                    clientTown.LabaDraw();
            } //if (functionIds.Contains(117)) // 117:["FiveElementsLaBa","449","五行天仪"],

            if (functionIds.Contains(11) && functionIds.Contains(45)) // 11:["Friend","155","好友"],45:["SendFlower","235","送花"],
            {
                response = clientTown.GetFriendList();
                foreach (var item in (JArray)response[0])
                {
                    var _id = (int)item[0];
                    var _name = (string)item[1];
                    // is_can_send, YES:int = 3;
                    if ((byte)clientTown.PlayerSendFlowerInfo(_id)[8] == 3)
                        // SUCCESS:int = 0;
                        if ((byte)clientTown.SendPlayerFlower(_id)[0] == 0)
                            Logger.Log(string.Format("【送花】给好友[{0}]赠送一朵鲜花", _name));
                    break;
                }
            } //if (functionIds.Contains(11) && functionIds.Contains(45)) // 11:["Friend","155","好友"],45:["SendFlower","235","送花"],

            if (functionIds.Contains(24)) // 24:["Fate","180","猎命"],
            {
                // 一键合成
                clientTown.MergeAllInBag();

                // 命格空间
                response = clientTown.GetTempFate();
                var _tempFates = (JArray)response[0];

                // 一键卖出
                var _tempFatesBad = _tempFates.Where(x => (short)x[1] <= 9).ToList();
                if (_tempFatesBad.Any())
                {
                    response = clientTown.SaleTempFate(_tempFatesBad.Select(x => (long)x[0]));
                    // SUCCESS:int = 0;
                    if ((byte)response[0] == 0)
                        Logger.Log("【猎命】一键卖出所有厄命");
                    else
                        Logger.Log(string.Format("【猎命】一键卖出所有厄命错误，result：{0}", response[0]), ConsoleColor.Red);
                }

                // 一键拾取
                var _tempFatesGood = _tempFates.Where(x => (short)x[1] > 9).ToList();
                if (_tempFatesGood.Any())
                {
                    response = clientTown.PickupFate(_tempFatesGood.Select(x => (long)x[0]));
                    switch ((byte)response[0])
                    {
                        // SUCCESS:int = 0;
                        case 0:
                            Logger.Log("【猎命】一键拾取所有命格");
                            break;
                        // BAG_FULL:int = 1;
                        case 1:
                            Logger.Log("【猎命】一键拾取所有命格错误，命格背包已满", ConsoleColor.Red);
                            break;
                        default:
                            Logger.Log(string.Format("【猎命】一键拾取所有命格错误，result：{0}", response[0]), ConsoleColor.Red);
                            break;
                    }
                }

                // 一键合成
                clientTown.MergeAllInBag();

                // 免费猎命
                while (true)
                {
                    response = clientTown.GetFateNpc();
                    var _freeAppointTimes = (byte)response[0];
                    Logger.Log(string.Format("【猎命】今日可免费[{0}]次猎命", _freeAppointTimes));

                    if (_freeAppointTimes <= 0)
                        break;

                    // [[3,0,0,0,0],[1,1,0,0,0],[2,1,0,0,0],[5,0,0,0,0],[4,0,0,0,0]]
                    var _fateNpcs = (JArray)response[1];
                    var _fateNpcIdOptimization = _fateNpcs.Where(x => (byte)x[1] == 1).Select(x => (byte)x[0]).Max();
                    response = clientTown.AppointFateNpc(_fateNpcIdOptimization);
                    // SUCCESS:int = 0;
                    if ((byte)response[0] == 0)
                        Logger.Log(string.Format("【猎命】猎命[{0}]成功，获得命格[{1}]，遇见[{2}]", Protocols.GetFateNPCName(_fateNpcIdOptimization), Protocols.GetFateName((short)response[1]), Protocols.GetFateNPCName((byte)response[2])));
                    else
                    {
                        Logger.Log(string.Format("【猎命】猎命失败，result：{0}", response[0]), ConsoleColor.Red);
                        break;
                    }
                }
            } //if (functionIds.Contains(24)) // 24:["Fate","180","猎命"],

            if (functionIds.Contains(70)) // 70:["FindImmortal","286","喜从天降"],
            {
                // 五福临门
                // YES:int = 11;
                if ((byte)clientTown.IsFiveBlessingsOpen()[0] == 11)
                {
                    while (true)
                    {
                        response = clientTown.OpenFiveBlessings();
                        var _bless_number = (short)response[0];
                        var _stage = (byte)response[1];
                        if (_stage != 0)
                            // SUCCESS:int = 0;
                            if ((byte)clientTown.EndBless()[0] == 0)
                                Logger.Log("【五福临门】见好就收");
                            else
                            {
                                Logger.Log("【五福临门】见好就收错误", ConsoleColor.Red);
                                break;
                            }
                        if (_bless_number <= 0)
                            break;
                        // SUCCESS:int = 0;
                        if ((byte)clientTown.StartBless()[0] == 0)
                            Logger.Log("【五福临门】画龙鱼");
                        else
                        {
                            Logger.Log("【五福临门】画龙鱼错误", ConsoleColor.Red);
                            break;
                        }
                    }
                } //if ((byte)clientTown.IsFiveBlessingsOpen()[0] == 11)
            } //if (functionIds.Contains(70)) // 70:["FindImmortal","286","喜从天降"],

            if (functionIds.Contains(85)) // 85:["Nimbus","391","灵脉"],
            {
                response = clientTown.NimbusInfo();
                var _commonTimes = (short)response[1];
                var _ingotTimes = (short)response[2];
                Logger.Log(string.Format("【灵脉】今日还有[木葫芦]×{0}，[金葫芦]×{1}", _commonTimes, _ingotTimes));
                while (_commonTimes > 0)
                {
                    response = clientTown.GatherNimbus();
                    var _result = (byte)response[0];
                    var _getNimbus = (int)response[2];
                    var _isLucky = (byte)response[3];
                    var _crit = (short)response[4];
                    _commonTimes = (short)response[5];
                    // SUCCESS:int = 0;
                    if (_result == 0)
                        Logger.Log(_isLucky == 1 ? string.Format("【灵脉】发现[灵脉]，下次[灵气]×{0}", _crit) : string.Format("【灵脉】采集[灵气]×{0}", _getNimbus));
                    else
                        Logger.Log("【灵脉】采集灵气错误", ConsoleColor.Red);
                }//while (_commonTimes > 0)
            } //if (functionIds.Contains(85)) // 85:["Nimbus","391","灵脉"],

            if (functionIds.Contains(173)) // 173:["RobMoney","530","劫镖"],
            {
                while (true)
                {
                    response = clientTown.GetRobMoneyInfo();
                    var _rob_status = (byte)response[0];
                    var _free_rob_times = (int)response[2];
                    // NOT_SEARCH:int = 0; SEARCHED:int = 1;
                    if (_rob_status == 1)
                    {
                        response = clientTown.RobMoneyRob();
                        // SUCCESS:int = 5;
                        if ((byte)response[0] == 5)
                            Logger.Log(string.Format("【劫镖】获得[铜钱]×{0}", response[1][0][1]));
                        else
                        {
                            Logger.Log("【劫镖】错误", ConsoleColor.Red);
                            break;
                        }
                    }
                    else
                    {
                        if (_free_rob_times <= 0)
                            break;

                        response = clientTown.RobMoneySearch();
                        // SUCCESS:int = 5;
                        if ((byte)response[1] == 5)
                            Logger.Log("【劫镖】勘察成功");
                        else
                        {
                            Logger.Log("【劫镖】勘察错误", ConsoleColor.Red);
                            break;
                        }
                    }
                }

            } //if (functionIds.Contains(173)) // 173:["RobMoney","530","劫镖"],

            // 九空无界-聚灵
            {
                response = clientTown.NineRegionsOpenPanel();
                var _curJie = (short)response[1];

                while (true)
                {
                    response = clientTown.GetCalabashInfo(_curJie);
                    var _state = (byte)response[0];
                    //var _calabash = (byte)response[1];
                    var _value = (int)response[3];
                    var _avaliable_times = (byte)response[4];

                    // NEW_START:int = 22;
                    #region NEW_START
                    if (_state == 22)
                    {
                        if (_avaliable_times <= 0)
                            break;

                        response = clientTown.NineRegionsCall(_curJie);
                        var _callResult = (byte)response[0];
                        var _calabash = (byte)response[1];
                        // SUCCESS:int = 5;
                        if (_callResult == 5)
                            if (_calabash == 24)
                                Logger.Log(string.Format("【九空无界】召唤仙葫，获得[铜仙葫]，[灵气]×{0}", response[3]));
                            else if (_calabash == 25)
                                Logger.Log(string.Format("【九空无界】召唤仙葫，获得[银仙葫]，[灵气]×{0}", response[3]));
                            else if (_calabash == 26)
                                Logger.Log(string.Format("【九空无界】召唤仙葫，获得[金仙葫]，[灵气]×{0}", response[3]));
                            else
                            {
                                Logger.Log(string.Format("【九空无界】未知仙葫品质：{0}", _calabash), ConsoleColor.Red);
                                break;
                            }
                        else
                        {
                            Logger.Log(string.Format("【九空无界】召唤仙葫错误，result：{0}", _callResult), ConsoleColor.Red);
                            break;
                        }
                    }
                    #endregion
                    // CONTINUE:int = 23;
                    #region CONTINUE
                    else if (_state == 23)
                    {
                        if (_value >= 17)
                        {
                            // 收获
                            response = clientTown.NineRegionsCollect(_curJie);
                            var _collectResult = (byte)response[0];
                            var _awardList = (JArray)response[1];
                            // SUCCESS:int = 5;
                            if (_collectResult == 5)
                                Logger.Log(string.Format("【九空无界】收获{0}", string.Join("，", _awardList.Select(x => string.Format("[{0}]×{1}", Protocols.GetItemName((int)x[0]), x[1])))));
                            else
                            {
                                Logger.Log(string.Format("【九空无界】收获出错，result：{0}", _collectResult), ConsoleColor.Red);
                                break;
                            }
                        }
                        else
                        {
                            // 聚气
                            response = clientTown.NineRegionsGathering(_curJie);
                            var _gatherResult = (byte)response[0];
                            if (_gatherResult == 5)
                                Logger.Log(string.Format("【九空无界】聚气，当前[灵气]×{0}", response[2]));
                            else
                            {
                                Logger.Log(string.Format("【九空无界】聚气出错，result：{0}", _gatherResult), ConsoleColor.Red);
                                break;
                            }
                        }
                    }
                    #endregion
                    else
                    {
                        Logger.Log(string.Format("【九空无界】未知状态：{0}", _state), ConsoleColor.Red);
                        break;
                    }
                }//while
            }// 九空无界-聚灵

            // 背包
            {
                response = clientTown.GetPlayerPackItemList();
                var _items = response[2].ToList();
                _items.Sort((x, y) => ((int)x[2]).CompareTo((int)y[2]));
                foreach (var _item in _items)
                {
                    var _id = (int)_item[0];
                    var _name = Protocols.GetItemName((int)_item[1]);
                    var _position = (short)_item[2];
                    var _count = (int)_item[5];
                    //Logger.Log(string.Format("【背包】{2}[{0}]×{1}", _name, _count, _item[2]));

                    if (new[] { "包子", "粽子", "茶叶蛋" }.Contains(_name))
                    {
                        response = clientTown.LargeUseGridItem(_id);
                        // ACTION_SUCCESS:int = 20;
                        if ((byte)response[0] == 20)
                            Logger.Log(string.Format("【背包】批量吃[{0}]×{1}", _name, _count));
                        else
                            Logger.Log(string.Format("【背包】批量吃[{0}]错误", _name), ConsoleColor.Red);
                    }

                    if (_name.EndsWith("宝箱") || _name.EndsWith("礼包"))
                    {
                        for (var _i = 0; _i < _count; _i++)
                        {
                            response = clientTown.PlayerUseGridItem(_position);
                            // ACTION_SUCCESS:int = 20;
                            if ((byte)response[0] == 20)
                                Logger.Log(string.Format("【背包】打开[{0}]", _name));
                            else
                            {
                                Logger.Log(string.Format("【背包】打开[{0}]错误", _name), ConsoleColor.Red);
                                break;
                            }
                        }
                    }

                    if (Regex.IsMatch(_name, @"\A(四品|五品)(武力|绝技|法术)丹制作卷\z"))
                    {
                        response = clientTown.PlayerSellItem(_position);
                        // ACTION_SUCCESS:int = 20;
                        if ((byte)response[0] == 20)
                            Logger.Log(string.Format("【背包】出售[{0}]", _name));
                        else
                            Logger.Log(string.Format("【背包】出售[{0}]错误", _name), ConsoleColor.Red);
                    }
                }
            }// 背包

            if (functionIds.Contains(129)) // 129:["Marry","297","结婚"],
            {
                response = clientTown.GetMarryBox();
                // SUCCESS:int = 13;
                if ((byte)response[0] == 13)
                    Logger.Log("【结婚】领取夫妻宝箱");
            }// if (functionIds.Contains(129)) // 129:["Marry","297","结婚"],

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
                clientTown.SealSatanMemberList();
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

                // 帮派转盘
                response = clientTown.OpenLuckyWheel();
                var _rosefinch_number = (int)response[2];
                Logger.Log(string.Format("【帮派】[青龙令{0}]", _rosefinch_number));
                for (var _i = 0; _i < _rosefinch_number; _i++)
                    clientTown.StartLuckyWheel();

                // 吃仙宴
                response = clientTown.JoinFeast();
                // SUCCESS:int = 32;
                if ((byte)response[0] == 32)
                    Logger.Log(string.Format("【帮派】吃仙宴，获得{0}", string.Join("、", response[1].Select(x => string.Format("[{0}]×{1}", Protocols.GetItemName((int)x[0]), x[1])))));
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
                    // SUCCESS:int = 3;
                    if ((byte)response[0] != 3)
                    {
                        Logger.Log(string.Format("【英雄扫荡】扫荡错误，result：{0}", response[0]));
                        break;
                    }
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
                    Logger.Log(string.Format("【竞技场】今日还可挑战[{0}]次", _remain));
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
                        Logger.Log(string.Format("【竞技场】挑战[{0}][排名{1}]{2}", _challengePersonFirst[4], _challengePersonFirst[0], (int)response[2] == 0 ? "胜利" : "失败"));
                    else
                    {
                        Logger.Log(string.Format("【竞技场】挑战异常，result：{0}", response[0]), ConsoleColor.Red);
                        break;
                    }
                } //while(true)
            } //if (functionIds.Contains(41)) // 41:["SuperSport","130","竞技场"],

            if ((byte)clientTown.SundayFruitActiveStatus()[0] == 0) // 周末水果机，YES:int = 0;
            {
                while (true)
                {
                    response = clientTown.SundayFruitInfo();
                    var _remain_draw_times = (int)response[0];
                    if (_remain_draw_times <= 0)
                        break;
                    // SUCCESS:int = 2;
                    if ((byte)clientTown.SundayFruitDraw()[0] == 2)
                        Logger.Log("【周末水果机】转一次");
                    else
                    {
                        Logger.Log("【周末水果机】错误", ConsoleColor.Red);
                        break;
                    }
                }//while (true)
            } //if ((byte)clientTown.SundayFruitActiveStatus()[0] == 0) // 周末水果机，YES:int = 0;

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
        }//Play

        public static void Run(string arg)
        {
            try
            {
                var i = 0;
                var users = JArray.Parse(File.ReadAllText("user.json"));
                foreach (var user in users)
                    Logger.Log(string.Format("{0}. {1}", i++, user["name"]), showTime: false);
                Logger.Log("请选择: ", showTime: false, writeLine: false);
                var readLine = arg ?? Console.ReadLine();
                Logger.Log(readLine, showTime: false);
                switch (readLine.ToUpper())
                {
                    case "LOGIN":
                        GenerateCookies();
                        break;
                    case "PROTOCOL":
                        CollectProtocols();
                        break;
                    case "ANALYZE":
                        Analyze();
                        break;
                    default:
                        // 验证用户输入
                        if (!int.TryParse(readLine, out i))
                            throw new InvalidCastException();
                        if (i >= users.Count || i < 0)
                            throw new ArgumentOutOfRangeException();
                        var user = users[i];

                        // 获取游戏页面
                        /*string playPage;
                        var login = (string)user["login"];
                        if (login == null)
                        {
                            var cookieContainer = Common.ReadCookiesFromDisk(string.Format("cookies/{0}", user["name"]));
                            playPage = Common.Get((string)user["url"], cookieContainer);
                        }
                        else
                        {
                            var pattern = string.Format(@"\[{0}\]\r\nurl=(.*)\r\ncode=(.*)\r\ntime=(.*)\r\nhash=(.*)\r\ntime1=(.*)\r\nhash1=(.*)\r\nname=(.*)\r\n", user["id"]);
                            var match = Regex.Match(File.ReadAllText(login), pattern);
                            if (!match.Success)
                                throw new Exception(string.Format("[user.ini]中未能找到用户[{0}]", user["id"]));
                            var cookieString = string.Format("user={0};_time={1};_hash={2};login_time_sxd_xxxxxxxx={3};login_hash_sxd_xxxxxxxx={4}", match.Groups[2].Value, match.Groups[3].Value, match.Groups[4].Value, match.Groups[5].Value, match.Groups[6].Value);
                            playPage = Common.Get(match.Groups[1].Value, cookieString);
                        }*/
                        var playPage = Common.Get((string)user["url"], Common.ReadCookiesFromDisk(string.Format("cookies/{0}", user["name"])));

                        // 游戏开始
                        Play(playPage);
                        break;
                }//switch
            } //try
            catch (Exception ex)
            {
                Logger.Log(string.Format("发现错误：{0}", ex), ConsoleColor.Red);
            }
        } //Run

    } //class
} //namespace
