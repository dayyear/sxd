using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;

namespace 神仙道
{
    public class SxdWeb
    {
        private readonly CookieContainer cookieContainer = new CookieContainer();

        public void LoginService(string username, string password, string cookieFile)
        {
            var rnd = new Random();
            var captcha_identifier = string.Empty;
            var captcha = string.Empty;

            while (true)
            {
                var stamp = Convert.ToInt64((DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0)).TotalMilliseconds);
                var uri = string.Format(@"https://ssl.xd.com/users/loginService?callback=jQuery1102{0}_{1}&data%5BUser%5D%5Busername%5D={3}&data%5BUser%5D%5Bpassword%5D={4}&data%5BUser%5D%5Bremember_me%5D=true&data%5BUser%5D%5Bsite%5D=xd&app=sxd&captcha={6}&captcha_identifier={5}&need_detail=true&history_amount=0&rqst_sgntr={2}&_={1}",
                    rnd.NextDouble().ToString(CultureInfo.CurrentCulture).Replace(".", ""),
                    stamp, rnd.NextDouble(), username, password, captcha_identifier, captcha);
                var responseString = Get(uri);

                if (!responseString.Contains("needCaptcha"))
                {
                    Common.WriteCookiesToDisk(cookieFile, cookieContainer);
                    return;
                }

                captcha_identifier = rnd.NextDouble().ToString(CultureInfo.CurrentCulture);
                var bytes = GetBytes(string.Format("http://www.xd.com/security/captcha/{0}", captcha_identifier));
                var file = captcha_identifier + ".jpg";
                File.WriteAllBytes(file, bytes);
                System.Diagnostics.Process.Start(file);
                Logger.Log("输入验证码: ", showTime: false, writeLine: false);
                captcha = Console.ReadLine();
                Logger.Log(captcha, console: false, showTime: false);
            }//while(true) 
        }//LoginService

        /// <summary>
        /// Http Get
        /// </summary>
        private string Get(string uri)
        {
            string responseString;

            var request = (HttpWebRequest)WebRequest.Create(uri);
            request.CookieContainer = cookieContainer;
            request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31";

            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            using (var sr = new StreamReader(stream, Encoding.GetEncoding(response.CharacterSet)))
                responseString = sr.ReadToEnd();

            return responseString;
        }//Get

        private byte[] GetBytes(string uri)
        {
            var bytes = new List<byte>();

            var request = (HttpWebRequest)WebRequest.Create(uri);
            request.CookieContainer = cookieContainer;
            request.UserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31";

            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            {
                var buffer = new byte[512];
                int read;
                while ((read = stream.Read(buffer, 0, buffer.Length)) > 0)
                    bytes.AddRange(buffer.ToList().GetRange(0, read));
            }

            return bytes.ToArray();
        }//GetBytes


    }//class
}//namespace
