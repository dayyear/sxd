using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Reflection;
using System.Threading;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace 神仙道
{
    public class SxdClient
    {
        protected string ServerName;
        // Socket
        protected Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        //private Thread receiveThread;

        // 状态
        private short previousModule;
        private short previousAction;
        protected bool isConnected;
        protected const int timeout = 60000;
        protected readonly ManualResetEvent done = new ManualResetEvent(false);
        protected readonly ManualResetEvent receiveDone = new ManualResetEvent(false);

        // 用于Receive Callback
        protected readonly byte[] bufferRcvd = new byte[256];
        private readonly List<byte> bytesRcvd = new List<byte>();

        private readonly Dictionary<string, string> classDotMethodDictionary = new Dictionary<string, string>();

        protected int _playerId;
        protected JArray response;


        protected SxdClient()
        {
            // Town
            classDotMethodDictionary.Add("Mod_Town_Base.enter_town", "EnterTownCallback");
            classDotMethodDictionary.Add("Mod_Chat_Base.bro_to_players", "BroToPlayersCallback");
            classDotMethodDictionary.Add("Mod_HeroMission_Base.notify", "NotifyCallback");

            classDotMethodDictionary.Add("Mod_Player_Base.login", "Callback");
            classDotMethodDictionary.Add("Mod_Player_Base.get_player_info", "Callback");
            classDotMethodDictionary.Add("Mod_Player_Base.player_info_contrast", "Callback");
            classDotMethodDictionary.Add("Mod_StcLogin_Base.get_status", "Callback");
            classDotMethodDictionary.Add("Mod_StcLogin_Base.get_login_info", "Callback");
            classDotMethodDictionary.Add("Mod_Player_Base.get_player_function", "Callback");
            classDotMethodDictionary.Add("Mod_Player_Base.get_game_assistant_info", "Callback");
            classDotMethodDictionary.Add("Mod_GetPeach_Base.peach_info", "Callback");
            classDotMethodDictionary.Add("Mod_GetPeach_Base.batch_get_peach", "Callback");
            classDotMethodDictionary.Add("Mod_Player_Base.get_player_camp_salary", "Callback");
            classDotMethodDictionary.Add("Mod_Farm_Base.is_player_get_xian_ling_gift", "Callback");
            classDotMethodDictionary.Add("Mod_Farm_Base.player_get_xian_ling_gift", "Callback");
            classDotMethodDictionary.Add("Mod_SealSoul_Base.day_stone_count", "Callback");
            classDotMethodDictionary.Add("Mod_SealSoul_Base.get_day_stone", "Callback");
            classDotMethodDictionary.Add("Mod_FunctionEnd_Base.game_function_end_gift", "Callback");
            classDotMethodDictionary.Add("Mod_FunctionEnd_Base.random_award", "Callback");
            classDotMethodDictionary.Add("Mod_FunctionEnd_Base.get_game_function_end_gift", "Callback");
            classDotMethodDictionary.Add("Mod_Item_Base.get_player_gift_all_info", "Callback");
            classDotMethodDictionary.Add("Mod_Item_Base.player_get_super_gift", "Callback");
            classDotMethodDictionary.Add("Mod_HeroesWar_Base.get_end_gift_info", "Callback");
            classDotMethodDictionary.Add("Mod_HeroesWar_Base.get_end_gift", "Callback");
            classDotMethodDictionary.Add("Mod_StChallenge_Base.get_end_li_bao", "Callback");
            classDotMethodDictionary.Add("Mod_UnlimitChallenge_Base.get_end_award", "Callback");
            classDotMethodDictionary.Add("Mod_Farm_Base.get_farmlandinfo_list", "Callback");
            classDotMethodDictionary.Add("Mod_Farm_Base.buy_coin_tree_count_info", "Callback");
            classDotMethodDictionary.Add("Mod_Farm_Base.get_player_roleinfo_list", "Callback");
            classDotMethodDictionary.Add("Mod_Farm_Base.plant_herbs", "Callback");
            classDotMethodDictionary.Add("Mod_Farm_Base.harvest", "Callback");
            classDotMethodDictionary.Add("Mod_HeroMission_Base.get_hero_mission_list", "Callback");
            classDotMethodDictionary.Add("Mod_HeroMission_Base.start_practice", "Callback");
            classDotMethodDictionary.Add("Mod_SuperSport_Base.open_super_sport", "Callback");
            classDotMethodDictionary.Add("Mod_SuperSport_Base.start_challenge", "Callback");
            classDotMethodDictionary.Add("Mod_Assistant_Base.info", "Callback");
            classDotMethodDictionary.Add("Mod_Assistant_Base.get_award", "Callback");
            classDotMethodDictionary.Add("Mod_Fish_Base.get_player_fishhook", "Callback");
            classDotMethodDictionary.Add("Mod_Fish_Base.do_fishing", "Callback");
            classDotMethodDictionary.Add("Mod_TravelEvent_Base.get_event_and_answer", "Callback");
            classDotMethodDictionary.Add("Mod_TravelEvent_Base.lottery_draw", "Callback");
            classDotMethodDictionary.Add("Mod_TravelEvent_Base.answer_travel_event", "Callback");
            classDotMethodDictionary.Add("Mod_BeelzebubTrials_Base.get_moral_award", "Callback");
            classDotMethodDictionary.Add("Mod_PetAnimal_Base.pet_animal_info", "Callback");
            classDotMethodDictionary.Add("Mod_PetAnimal_Base.feed_pet_animal", "Callback");
            classDotMethodDictionary.Add("Mod_PetAnimal_Base.up_pet_animal", "Callback");
            classDotMethodDictionary.Add("Mod_HuntDemon_Base.open_hunt_demon", "Callback");
            classDotMethodDictionary.Add("Mod_HuntDemon_Base.hunt_demon", "Callback");
            classDotMethodDictionary.Add("Mod_Awake_Base.player_forbidden_book_info", "Callback");
            classDotMethodDictionary.Add("Mod_Awake_Base.explore_forbidden_book", "Callback");
            classDotMethodDictionary.Add("Mod_MarryHome_Base.batch_get_furniture_effect", "Callback");
            classDotMethodDictionary.Add("Mod_Faction_Base.faction_god_info", "Callback");
            classDotMethodDictionary.Add("Mod_Faction_Base.incense", "Callback");
            classDotMethodDictionary.Add("Mod_Faction_Base.seal_satan_member_list", "Callback");
            classDotMethodDictionary.Add("Mod_Faction_Base.join_seal_satan", "Callback");
            classDotMethodDictionary.Add("Mod_Faction_Base.faction_roll_cake_info", "Callback");
            classDotMethodDictionary.Add("Mod_Faction_Base.roll_cake", "Callback");
            classDotMethodDictionary.Add("Mod_RollCake_Base.get_state", "Callback");
            classDotMethodDictionary.Add("Mod_RollCake_Base.get_count", "Callback");
            classDotMethodDictionary.Add("Mod_RollCake_Base.roll", "Callback");
            classDotMethodDictionary.Add("Mod_RollCake_Base.reroll", "Callback");
            classDotMethodDictionary.Add("Mod_RollCake_Base.get_award", "Callback");
            classDotMethodDictionary.Add("Mod_LuckyWheel_Base.open_lucky_wheel", "Callback");
            classDotMethodDictionary.Add("Mod_LuckyWheel_Base.start_lucky_wheel", "Callback");
            classDotMethodDictionary.Add("Mod_SpaceFind_Base.open_space_find", "Callback");
            classDotMethodDictionary.Add("Mod_SpaceFind_Base.do_space_find", "Callback");
            classDotMethodDictionary.Add("Mod_SpaceFind_Base.get_space_find", "Callback");
            classDotMethodDictionary.Add("Mod_Laba_Base.laba_info", "Callback");
            classDotMethodDictionary.Add("Mod_Laba_Base.draw", "Callback");
            classDotMethodDictionary.Add("Mod_Friend_Base.get_friend_list", "Callback");
            classDotMethodDictionary.Add("Mod_SendFlower_Base.player_send_flower_info", "Callback");
            classDotMethodDictionary.Add("Mod_SendFlower_Base.send_player_flower", "Callback");
            classDotMethodDictionary.Add("Mod_Fate_Base.get_fate_npc", "Callback");
            classDotMethodDictionary.Add("Mod_Fate_Base.appoint_fate_npc", "Callback");
            classDotMethodDictionary.Add("Mod_Fate_Base.get_temp_fate", "Callback");
            classDotMethodDictionary.Add("Mod_Fate_Base.pickup_fate", "Callback");
            classDotMethodDictionary.Add("Mod_Fate_Base.sale_temp_fate", "Callback");
            classDotMethodDictionary.Add("Mod_Fate_Base.merge_all_in_bag", "Callback");
            classDotMethodDictionary.Add("Mod_SundayFruit_Base.active_status", "Callback");
            classDotMethodDictionary.Add("Mod_SundayFruit_Base.sunday_fruit_info", "Callback");
            classDotMethodDictionary.Add("Mod_SundayFruit_Base.draw", "Callback");
            classDotMethodDictionary.Add("Mod_FindImmortal_Base.is_five_blessings_open", "Callback");
            classDotMethodDictionary.Add("Mod_FindImmortal_Base.open_five_blessings", "Callback");
            classDotMethodDictionary.Add("Mod_FindImmortal_Base.start_bless", "Callback");
            classDotMethodDictionary.Add("Mod_FindImmortal_Base.end_bless", "Callback");
            classDotMethodDictionary.Add("Mod_Nimbus_Base.nimbus_info", "Callback");
            classDotMethodDictionary.Add("Mod_Nimbus_Base.gather_nimbus", "Callback");
            classDotMethodDictionary.Add("Mod_StArena_Base.exploit_shop_item_list", "Callback");
            classDotMethodDictionary.Add("Mod_StArena_Base.buy_exploit_shop_item", "Callback");
            classDotMethodDictionary.Add("Mod_RobMoney_Base.get_rob_money_info", "Callback");
            classDotMethodDictionary.Add("Mod_RobMoney_Base.search", "Callback");
            classDotMethodDictionary.Add("Mod_RobMoney_Base.rob", "Callback");
            classDotMethodDictionary.Add("Mod_NineRegions_Base.open_panel", "Callback");
            classDotMethodDictionary.Add("Mod_NineRegions_Base.get_calabash_count", "Callback");
            classDotMethodDictionary.Add("Mod_NineRegions_Base.get_calabash_info", "Callback");
            classDotMethodDictionary.Add("Mod_NineRegions_Base.call", "Callback");
            classDotMethodDictionary.Add("Mod_NineRegions_Base.gathering", "Callback");
            classDotMethodDictionary.Add("Mod_NineRegions_Base.collect", "Callback");
            classDotMethodDictionary.Add("Mod_Faction_Base.join_feast", "Callback");
            //ST
            classDotMethodDictionary.Add("Mod_StLogin_Base.login", "Callback");
            classDotMethodDictionary.Add("Mod_StTown_Base.enter_town", "Callback");
            classDotMethodDictionary.Add("Mod_StTakeBible_Base.open_take_bible", "Callback");
            classDotMethodDictionary.Add("Mod_StTakeBible_Base.get_take_bible_info", "Callback");
            classDotMethodDictionary.Add("Mod_StTakeBible_Base.get_recent_rob_player", "Callback");
            classDotMethodDictionary.Add("Mod_StTakeBible_Base.refresh", "Callback");
            classDotMethodDictionary.Add("Mod_StTakeBible_Base.start_take_bible", "Callback");
            classDotMethodDictionary.Add("Mod_StSuperSport_Base.get_st_super_sport_status", "Callback");
            classDotMethodDictionary.Add("Mod_StSuperSport_Base.get_player_st_super_sport", "Callback");
            classDotMethodDictionary.Add("Mod_StSuperSport_Base.challenge_list", "Callback");
            classDotMethodDictionary.Add("Mod_StSuperSport_Base.get_rank_award", "Callback");
            classDotMethodDictionary.Add("Mod_StSuperSport_Base.challenge", "Callback");
            classDotMethodDictionary.Add("Mod_StSuperSport_Base.player_score_award_info", "Callback");
            classDotMethodDictionary.Add("Mod_StSuperSport_Base.player_get_score_award", "Callback");
            classDotMethodDictionary.Add("Mod_StSuperSport_Base.can_get_score_award", "Callback");
            classDotMethodDictionary.Add("Mod_StArena_Base.get_race_step", "Callback");
            classDotMethodDictionary.Add("Mod_StArena_Base.open_st_arena", "Callback");
            classDotMethodDictionary.Add("Mod_StArena_Base.challenge", "Callback");
            classDotMethodDictionary.Add("Mod_StArena_Base.refresh_player_list", "Callback");
            classDotMethodDictionary.Add("Mod_StSuperSport_Base.get_race_step", "Callback");
            classDotMethodDictionary.Add("Mod_StSuperSport_Base.get_race_list", "Callback");
            classDotMethodDictionary.Add("Mod_StSuperSport_Base.bet", "Callback");
        }

        private void ProcessPackage(byte[] package, bool isReceive = true, bool isLogAllProtocols = false)
        {
            using (var ms = new MemoryStream(package, false))
            using (var br = new BinaryReader(ms))
            {
                var module = IPAddress.NetworkToHostOrder(br.ReadInt16());
                if (module == 0x789C)
                {
                    Logger.Log("  uncompress...", console: false);
                    ProcessPackage(Ionic.Zlib.ZlibStream.UncompressBuffer(package.ToArray()), isReceive, isLogAllProtocols);
                    return;
                }
                var action = IPAddress.NetworkToHostOrder(br.ReadInt16());
                var tuple = Protocols.GetPattern(module, action);
                var data = isReceive ? Protocols.Decode(br.BaseStream, tuple.Item4) : Protocols.Decode(br.BaseStream, tuple.Item3);
                var classNameDotMethod = tuple.Item1 + "." + tuple.Item2;

                if (isReceive)
                {
                    if (classDotMethodDictionary.ContainsKey(classNameDotMethod))
                        GetType().GetMethod(classDotMethodDictionary[classNameDotMethod], BindingFlags.NonPublic | BindingFlags.Instance).Invoke(this, new object[] { data });
                    else if (!isLogAllProtocols)
                        return;
                    //Logger.Log(string.Format("package: {0}", Common.BytesToString(package)), ConsoleColor.Yellow, console: false);
                    Logger.Log(string.Format("Receive method: {0}({1},{2})", classNameDotMethod, module, action), ConsoleColor.Cyan, console: false);
                    Logger.Log(string.Format("Receive data: {0}", data.ToString(Formatting.None)), ConsoleColor.Cyan, console: false);
                }
                else
                {
                    //Logger.Log(string.Format("package: {0}", Common.BytesToString(package)), ConsoleColor.White, console: false);
                    Logger.Log(string.Format("Send method: {0}({1},{2})", classNameDotMethod, module, action), ConsoleColor.Magenta, console: false);
                    Logger.Log(string.Format("Send data: {0}", data.ToString(Formatting.None)), ConsoleColor.Magenta, console: false);
                }
            }//br, ms
        }//ProcessPackage

        protected void Send(JArray data, short module, short action)
        {
            // -----------------------------------------------------------------------------
            // 1. 构造命令字节
            // -----------------------------------------------------------------------------
            var bytes = new List<byte>();

            // 1.1 添加module和action
            bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder(module)));
            bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder(action)));

            // 1.2 添加实体
            bytes.AddRange(Protocols.Encode(data, Protocols.GetPattern(module, action).Item3));

            // 1.3 在尾部添加上次的module和action
            if ((module != 0 || action != 0) && (module != 94 || action != 0))
            {
                bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder(previousModule)));
                bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder(previousAction)));
            }

            // 1.4 在首部插入命令字节数
            ProcessPackage(bytes.ToArray(), false);
            bytes.InsertRange(0, BitConverter.GetBytes(IPAddress.HostToNetworkOrder(bytes.Count)));

            // -----------------------------------------------------------------------------
            // 2. 发送数据
            // -----------------------------------------------------------------------------
            socket.Send(bytes.ToArray());

            // -----------------------------------------------------------------------------
            // 3. 留存module和action
            // -----------------------------------------------------------------------------
            previousModule = module;
            previousAction = action;
        }//Send

        /// <summary>
        /// 接收数据（异步I/O）
        /// </summary>
        protected void ReceiveCallback(IAsyncResult ar)
        {
            try
            {
                var bytesRead = socket.EndReceive(ar);
                if (bytesRead == 0)
                {
                    Logger.Log(string.Format("已断开{0}", ServerName), ConsoleColor.Red);
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
                Logger.Log(string.Format("发现错误：{0}，错误代码：{1}", se, se.ErrorCode), ConsoleColor.Red);
                receiveDone.Set();
            }
            catch (Exception ex)
            {
                Logger.Log(string.Format("发现错误：{0}", ex), ConsoleColor.Red);
                receiveDone.Set();
            }
        }//ReceiveCallback

        public void Send(byte[] bytes)
        {
            var byteList = bytes.ToList();
            while (byteList.Count > 4)
            {
                var length = IPAddress.NetworkToHostOrder(BitConverter.ToInt32(byteList.ToArray(), 0));
                if (byteList.Count < 4 + length)
                    throw new Exception("数据不完整");
                var package = byteList.GetRange(4, length);
                byteList.RemoveRange(0, 4 + length);
                ProcessPackage(package.ToArray(), false);
            }
            if (byteList.Count != 0)
                throw new Exception("数据有冗余");
            socket.Send(bytes);
        }//Send

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

        public void Analyze(IEnumerable<byte> bytes, bool isReceive)
        {
            var byteList = bytes.ToList();
            while (byteList.Count > 4)
            {
                var length = IPAddress.NetworkToHostOrder(BitConverter.ToInt32(byteList.ToArray(), 0));
                if (byteList.Count < 4 + length)
                    throw new Exception("数据不完整");
                var package = byteList.GetRange(4, length);
                byteList.RemoveRange(0, 4 + length);
                ProcessPackage(package.ToArray(), isReceive, true);
            }
            if (byteList.Count != 0)
                throw new Exception("数据有冗余");
        }//Analyze

    }//class
}//namespace