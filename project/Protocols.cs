﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using Newtonsoft.Json.Linq;

namespace 神仙道
{
    public static class Protocols
    {

        public static IEnumerable<byte> Encode(JArray data, JArray pattern)
        {
            var bytes = new List<byte>();

            var i = 0;
            foreach (var item in pattern)
            {
                switch (item.Type)
                {
                    case JTokenType.String:
                        switch ((string)item)
                        {
                            case "Utils.UByteUtil":
                                bytes.Add((byte)data[i++]);
                                break;
                            case "Utils.ByteUtil":
                                bytes.Add((byte)data[i++]);
                                break;
                            case "Utils.ShortUtil":
                                bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder((short)data[i++])));
                                break;
                            case "Utils.IntUtil":
                                bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder((int)data[i++])));
                                break;
                            case "Utils.LongUtil":
                                bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder((long)data[i++])));
                                break;
                            case "Utils.StringUtil":
                                var s = Encoding.UTF8.GetBytes((string)data[i++]);
                                bytes.AddRange(BitConverter.GetBytes(IPAddress.HostToNetworkOrder((short)s.Length)));
                                bytes.AddRange(s);
                                break;
                            default:
                                Logger.Log("Unknown item string: " + (string)item, ConsoleColor.Red);
                                break;
                        }//switch ((string)item)
                        break;
                    default:
                        Logger.Log("Unknown item type: " + item.Type, ConsoleColor.Red);
                        break;
                }//switch (item.Type)
            }//foreach (var item in pattern)

            return bytes;
        }//Encode

        public static JArray Decode(byte[] bytes, JArray pattern)
        {
            return Decode(new MemoryStream(bytes, false), pattern);
        }//Decode

        public static JArray Decode(Stream stream, JArray pattern)
        {
            var data = new JArray();

            // 采用BufferedStream时，递归失效
            //var br = new BinaryReader(new BufferedStream(stream));
            var br = new BinaryReader(stream);

            foreach (var item in pattern)
            {
                switch (item.Type)
                {
                    case JTokenType.String:
                        switch ((string)item)
                        {
                            case "Utils.UByteUtil":
                                data.Add(br.ReadByte());
                                break;
                            case "Utils.ByteUtil":
                                data.Add(br.ReadByte());
                                break;
                            case "Utils.ShortUtil":
                                data.Add(IPAddress.NetworkToHostOrder(br.ReadInt16()));
                                break;
                            case "Utils.IntUtil":
                                data.Add(IPAddress.NetworkToHostOrder(br.ReadInt32()));
                                break;
                            case "Utils.LongUtil":
                                data.Add(IPAddress.NetworkToHostOrder(br.ReadInt64()));
                                break;
                            case "Utils.StringUtil":
                                var length = IPAddress.NetworkToHostOrder(br.ReadInt16());
                                data.Add(Encoding.UTF8.GetString(br.ReadBytes(length)));
                                break;
                            default:
                                Logger.Log("Unknown item string: " + (string)item, ConsoleColor.Red);
                                break;
                        }//switch ((string)item)
                        break;
                    case JTokenType.Array:
                        var jArray = new JArray();
                        var count = IPAddress.NetworkToHostOrder(br.ReadInt16());
                        for (var i = 0; i < count; i++)
                            jArray.Add(Decode(br.BaseStream, (JArray)item));
                        //data.Add(Decode(br.BaseStream, (JArray)item));
                        data.Add(jArray);
                        break;
                    default:
                        Logger.Log("Unknown item type: " + item.Type, ConsoleColor.Red);
                        break;
                }//switch (item.Type)
            }//foreach (var item in pattern)

            return data;
        }//Decode

        /// <summary>
        /// 通过module和action，在protocols目录下查找相应的源文件，返回method, request, response
        /// </summary>
        public static Tuple<string, string, JArray, JArray> GetPattern(short module, short action)
        {
            var matches = (from _file in Directory.GetFiles("protocols/", "*Base.as")
                           let _m = Regex.Match(File.ReadAllText(_file), string.Format(@"class (\S*) [\s\S]*?public static const (.*?):Object = {{module:{0}, action:{1}, request:(\[.*?\]), response:(\[.*?\])}}", module, action))
                           where _m.Success
                           select _m).ToList();
            if (!matches.Any())
                throw new Exception(string.Format("Not find protocol with module: {0}, action: {1}", module, action));
            if (matches.Count() > 1)
                throw new Exception(string.Format("Find multiple protocols with module: {0}, action: {1}", module, action));
            var match = matches.First();
            var className = match.Groups[1].Value;
            var method = match.Groups[2].Value;
            var request = JArray.Parse(Regex.Replace(match.Groups[3].Value, "Utils.*?Util", "\"$0\""));
            var response = JArray.Parse(Regex.Replace(match.Groups[4].Value, "Utils.*?Util", "\"$0\""));
            return Tuple.Create(className, method, request, response);
        }//GetPattern

        public static string GetTownName(int townMapId)
        {
            var match = Regex.Match(File.ReadAllText("protocols/DramaXMLLang.as"), string.Format("town{0}:String = \"(.*?)\";", townMapId));
            if (!match.Success)
                throw new Exception(string.Format("Not find town with id: {0}", townMapId));
            return match.Groups[1].Value;
        }//GetTownName

        public static string GetFunctionName(int functionId)
        {
            var match = Regex.Match(File.ReadAllText("protocols/FunctionTypeData_R162.as"), string.Format(@"{0}:\[""(.*?)"",""(.*?)"",""(.*?)""\]", functionId));
            if (!match.Success)
                throw new Exception(string.Format("Not find function with id: {0}", functionId));
            return match.Groups[3].Value;
        }//GetFunctionName

        // 获取随机礼包名称
        private static readonly Dictionary<short, string> endFunctionGift =
            new Dictionary<short, string> { { 1, "吉星高照" }, { 4, "龙鱼仙令" }, { 7, "灵脉" }, { 13, "拜关公" }, { 16, "龙鱼境界点" } };
        /// <summary>
        /// Line 7 in GiftTypeData.as:
        ///     public static const endFunctionGift:Array = [[1, "JiXingZhongJie", "吉星高照", 0, 0, 0, 54, 1], [4, "LongYuZhongJie", "龙鱼仙令", 0, 0, 0, 70, 2], [7, "LingMaiZhongJie", "灵脉", 0, 0, 0, 85, 4], [13, "GuanGongZhongJie", "拜关公", 0, 0, 0, 55, 5], [16, "Longyu1ZhongJie", "龙鱼境界点", 0, 0, 0, 70, 3]];
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static string GetEndFunctionGiftName(short id)
        {
            return endFunctionGift[id];
        }//GetEndFunctionGiftName
    }//class
}//namespace