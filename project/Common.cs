﻿using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;

namespace 神仙道
{
    public static class Common
    {
        /// <summary>
        /// 字节列表转化为可输出的十六进制字符串
        /// </summary>
        public static string BytesToString(IEnumerable<byte> package)
        {
            var sb = new StringBuilder();
            foreach (var b in package)
                sb.AppendFormat("{0} ", b.ToString("X2"));
            sb.Remove(sb.Length - 1, 1);
            return "[" + sb + "]";
        }//BytesToString

        /// <summary>
        /// Http Get with cookie
        /// </summary>
        /// <param name="url"></param>
        /// <param name="cookie"></param>
        /// <returns></returns>
        public static string Get(string url, string cookie)
        {
            string responseString;
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.Headers.Add("Cookie", cookie);
            request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31";

            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            using (var sr = new StreamReader(stream, Encoding.UTF8))
                responseString = sr.ReadToEnd();
            return responseString;
        }//Get

    }
}