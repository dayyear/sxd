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
        protected readonly ManualResetEvent done = new ManualResetEvent(false);
        protected readonly ManualResetEvent receiveDone = new ManualResetEvent(false);

        // 用于Receive Callback
        protected readonly byte[] bufferRcvd = new byte[256];
        private readonly List<byte> bytesRcvd = new List<byte>();

        private readonly Dictionary<string, string> methoDictionary = new Dictionary<string, string>();

        protected int _playerId;
        protected JArray response;


        protected SxdClient()
        {
            // Town
            methoDictionary.Add("Mod_Player_Base.login", "LoginCallback");
            methoDictionary.Add("Mod_Player_Base.get_player_info", "GetPlayerInfoCallback");
            methoDictionary.Add("Mod_Player_Base.player_info_contrast", "PlayerInfoContrastCallback");
            methoDictionary.Add("Mod_Town_Base.enter_town", "EnterTownCallback");
            methoDictionary.Add("Mod_StcLogin_Base.get_status", "GetStatusCallback");
            methoDictionary.Add("Mod_StcLogin_Base.get_login_info", "GetLoginInfoCallback");
            methoDictionary.Add("Mod_Player_Base.get_player_function", "GetPlayerFunctionCallback");
            methoDictionary.Add("Mod_Player_Base.get_game_assistant_info", "GetGameAssistantInfoCallback");
            methoDictionary.Add("Mod_GetPeach_Base.peach_info", "PeachInfoCallback");
            methoDictionary.Add("Mod_GetPeach_Base.batch_get_peach", "BatchGetPeachCallback");
            methoDictionary.Add("Mod_Chat_Base.bro_to_players", "BroToPlayersCallback");
            methoDictionary.Add("Mod_Player_Base.get_player_camp_salary", "GetPlayerCampSalaryCallback");
            methoDictionary.Add("Mod_Farm_Base.is_player_get_xian_ling_gift", "IsPlayerGetXianLingGiftCallback");
            methoDictionary.Add("Mod_Farm_Base.player_get_xian_ling_gift", "PlayerGetXianLingGiftCallback");
            methoDictionary.Add("Mod_SealSoul_Base.day_stone_count", "DayStoneCountCallback");
            methoDictionary.Add("Mod_SealSoul_Base.get_day_stone", "GetDayStoneCallback");
            methoDictionary.Add("Mod_FunctionEnd_Base.game_function_end_gift", "GameFunctionEndGiftCallback");
            methoDictionary.Add("Mod_FunctionEnd_Base.random_award", "RandomAwardCallback");
            methoDictionary.Add("Mod_FunctionEnd_Base.get_game_function_end_gift", "GetGameFunctionEndGiftCallback");
            methoDictionary.Add("Mod_Item_Base.get_player_gift_all_info", "GetPlayerGiftAllInfoCallback");
            methoDictionary.Add("Mod_Item_Base.player_get_super_gift", "PlayerGetSuperGiftCallback");
            methoDictionary.Add("Mod_HeroesWar_Base.get_end_gift_info", "GetEndGiftInfoCallback");
            methoDictionary.Add("Mod_HeroesWar_Base.get_end_gift", "GetEndGiftCallback");
            methoDictionary.Add("Mod_StChallenge_Base.get_end_li_bao", "GetEndLiBaoCallback");
            methoDictionary.Add("Mod_UnlimitChallenge_Base.get_end_award", "GetEndAwardCallback");
            methoDictionary.Add("Mod_Farm_Base.get_farmlandinfo_list", "GetFarmlandinfoListCallback");
            methoDictionary.Add("Mod_Farm_Base.buy_coin_tree_count_info", "BuyCoinTreeCountInfoCallback");
            methoDictionary.Add("Mod_Farm_Base.get_player_roleinfo_list", "GetPlayerRoleinfoListCallback");
            methoDictionary.Add("Mod_Farm_Base.plant_herbs", "PlantHerbsCallback");
            methoDictionary.Add("Mod_Farm_Base.harvest", "HarvestCallback");
            //ST
            methoDictionary.Add("Mod_StLogin_Base.login", "LoginCallback");
            methoDictionary.Add("Mod_StTakeBible_Base.open_take_bible", "OpenTakeBibleCallback");
            methoDictionary.Add("Mod_StTakeBible_Base.get_take_bible_info", "GetTakeBibleInfoCallback");
            methoDictionary.Add("Mod_StTakeBible_Base.get_recent_rob_player", "GetRecentRobPlayerCallback");
            methoDictionary.Add("Mod_StTakeBible_Base.refresh", "RefreshCallback");
            methoDictionary.Add("Mod_StTakeBible_Base.start_take_bible", "StartTakeBibleCallback");
        }

        private void ProcessPackage(byte[] package, bool isReceive = true)
        {
            using (var ms = new MemoryStream(package, false))
            using (var br = new BinaryReader(ms))
            {
                var module = IPAddress.NetworkToHostOrder(br.ReadInt16());
                if (module == 0x789C)
                {
                    Logger.Log("  uncompress...", console: false);
                    ProcessPackage(Ionic.Zlib.ZlibStream.UncompressBuffer(package.ToArray()));
                    return;
                }
                var action = IPAddress.NetworkToHostOrder(br.ReadInt16());
                var tuple = Protocols.GetPattern(module, action);
                var data = isReceive ? Protocols.Decode(br.BaseStream, tuple.Item4) : Protocols.Decode(br.BaseStream, tuple.Item3);
                var className_method = tuple.Item1 + "." + tuple.Item2;

                if (isReceive)
                {
                    if (methoDictionary.ContainsKey(className_method))
                        GetType().GetMethod(methoDictionary[className_method], BindingFlags.NonPublic | BindingFlags.Instance).Invoke(this, new object[] { data });
                    
                    //Logger.Log(string.Format("package: {0}", Common.BytesToString(package)), ConsoleColor.Yellow, console: false);
                    Logger.Log(string.Format("Receive method: {0}({1},{2})", className_method, module, action), ConsoleColor.Yellow, console: false);
                    Logger.Log(string.Format("Receive data: {0}", data.ToString(Formatting.None)), ConsoleColor.Yellow, console: false);
                }
                else
                {
                    //Logger.Log(string.Format("package: {0}", Common.BytesToString(package)), ConsoleColor.White, console: false);
                    Logger.Log(string.Format("Send method: {0}({1},{2})", className_method, module, action), ConsoleColor.White, console: false);
                    Logger.Log(string.Format("Send data: {0}", data.ToString(Formatting.None)), ConsoleColor.White, console: false);
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

        public void Analyze(byte[] bytes, bool isReceive)
        {
            var byteList = bytes.ToList();
            while (byteList.Count > 4)
            {
                var length = IPAddress.NetworkToHostOrder(BitConverter.ToInt32(byteList.ToArray(), 0));
                if (byteList.Count < 4 + length)
                    throw new Exception("数据不完整");
                var package = byteList.GetRange(4, length);
                byteList.RemoveRange(0, 4 + length);
                ProcessPackage(package.ToArray(), isReceive);
            }
            if (byteList.Count != 0)
                throw new Exception("数据有冗余");
        }//Analyze


    }//class
}//namespace