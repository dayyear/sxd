using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Runtime.InteropServices;
using System.Runtime.Serialization.Formatters.Binary;
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
        /// Http Get with cookie string
        /// </summary>
        /// <returns></returns>
        public static string Get(string url, string cookieString)
        {
            string responseString;
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.Headers.Add("Cookie", cookieString);
            request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31";
            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            using (var sr = new StreamReader(stream, Encoding.UTF8))
                responseString = sr.ReadToEnd();
            return responseString;
        }//Get

        /// <summary>
        /// Http Get with cookie container
        /// </summary>
        public static string Get(string url, CookieContainer cookieContainer)
        {
            string responseString;
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.CookieContainer = cookieContainer;
            request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31";
            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            using (var sr = new StreamReader(stream, Encoding.UTF8))
                responseString = sr.ReadToEnd();
            return responseString;
        }//Get

        public static long Stamp64()
        {
            return Convert.ToInt64((DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0)).TotalMilliseconds);
        }//Stamp64

        private static int Stamp32()
        {
            return Convert.ToInt32((DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0)).TotalSeconds);
        }//Stamp32

        public static void WriteCookiesToDisk(string file, CookieContainer cookieJar)
        {
            using (var stream = File.Create(file))
            {
                try
                {
                    //Console.Out.Write("Writing cookies to disk... ");
                    var formatter = new BinaryFormatter();
                    formatter.Serialize(stream, cookieJar);
                    //Console.Out.WriteLine("Done.");
                }
                catch (Exception e)
                {
                    Console.WriteLine("Problem writing cookies to disk: " + e.GetType());
                }
            }
        }//WriteCookiesToDisk

        public static CookieContainer ReadCookiesFromDisk(string file)
        {
            try
            {
                using (Stream stream = File.Open(file, FileMode.Open))
                {
                    //Console.Out.Write("Reading cookies from disk... ");
                    var formatter = new BinaryFormatter();
                    //Console.Out.WriteLine("Done.");
                    return (CookieContainer)formatter.Deserialize(stream);
                }
            }
            catch (Exception e)
            {
                //Console.WriteLine("Problem reading cookies from disk: " + e.GetType());
                return new CookieContainer();
            }
        }//ReadCookiesFromDisk

        [DllImport("wininet.dll", CharSet = CharSet.Auto, SetLastError = true)]
        static extern bool InternetGetCookieEx(string pchURL, string pchCookieName, StringBuilder pchCookieData, ref uint pcchCookieData, int dwFlags, IntPtr lpReserved);
        const int INTERNET_COOKIE_HTTPONLY = 0x00002000;
        public static string GetGlobalCookies(string uri)
        {
            uint datasize = 4096;
            var cookieData = new StringBuilder((int)datasize);
            if (InternetGetCookieEx(uri, null, cookieData, ref datasize, INTERNET_COOKIE_HTTPONLY, IntPtr.Zero) && cookieData.Length > 0)
                return cookieData.ToString();
            return null;
        }//GetGlobalCookies

    }
}