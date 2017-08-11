using System;
using System.Globalization;
using System.IO;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using Newtonsoft.Json.Linq;

namespace 神仙道
{
    public class SxdWeb
    {
        private readonly CookieContainer cookieContainer = new CookieContainer();

        private readonly Random rnd = new Random();
        private readonly Uri uriCookie = new Uri("http://s1.sxd.xd.com/"); 

        public User LoginService(string username, string password)
        {
            var uri = string.Format(@"https://ssl.xd.com/users/loginService?callback=jQuery1102{0}_{1}&data%5BUser%5D%5Busername%5D={4}&data%5BUser%5D%5Bpassword%5D={5}&data%5BUser%5D%5Bremember_me%5D=true&data%5BUser%5D%5Bsite%5D=xd&app=sxd&captcha=&captcha_identifier=&need_detail=true&history_amount=0&rqst_sgntr={2}&_={3}",
                rnd.NextDouble().ToString(CultureInfo.CurrentCulture).Replace(".", ""), Stamp(), rnd.NextDouble(), Stamp(), username, password);
            Get(uri);
            //File.WriteAllText("loginService.htm", Get(uri));

            uri = @"http://www.xd.com/games/play?app=sxd&server=s1";
            Get(uri);
            //File.WriteAllText("play.htm", Get(uri));

            var cookieCollection = cookieContainer.GetCookies(uriCookie);
            return new User()
            {
                Code = cookieCollection["user"].Value,
                Time = cookieCollection["_time"].Value,
                Hash = cookieCollection["_hash"].Value,
                Time1 = cookieCollection["login_time_sxd_xxxxxxxx"].Value,
                Hash1 = cookieCollection["login_hash_sxd_xxxxxxxx"].Value
            };

        }//LoginService

        public void SetCookie(User user)
        {
            var path = "/";
            var domain = "s1.sxd.xd.com";
            cookieContainer.Add(new Cookie("user", user.Code, path, domain));
            cookieContainer.Add(new Cookie("_time", user.Time, path, domain));
            cookieContainer.Add(new Cookie("_hash", user.Hash, path, domain));
            cookieContainer.Add(new Cookie("login_time_sxd_xxxxxxxx", user.Time1, path, domain));
            cookieContainer.Add(new Cookie("login_hash_sxd_xxxxxxxx", user.Hash1, path, domain));
        }

        public string Login(User user)
        {
            SetCookie(user);
            return Get("http://s1.sxd.xd.com");
        }
        /// <summary>
        /// 初始化
        /// </summary>
        /// <returns></returns>
        /*public void Init(string username, string password)
        {
            var uri = string.Format(@"https://ssl.xd.com/users/loginService?callback=jQuery1102{0}_{1}&data%5BUser%5D%5Busername%5D={4}&data%5BUser%5D%5Bpassword%5D={5}&data%5BUser%5D%5Bremember_me%5D=true&data%5BUser%5D%5Bsite%5D=xd&app=sxd&captcha=&captcha_identifier=&need_detail=true&history_amount=0&rqst_sgntr={2}&_={3}",
                rnd.NextDouble().ToString(CultureInfo.CurrentCulture).Replace(".", ""), Stamp(), rnd.NextDouble(), Stamp(), username, password);
            var responseString = Get(uri);
            File.AppendAllText("loginService.htm", responseString);

            var jObject = JObject.Parse(Regex.Match(responseString, @"jQuery\d*_\d*\(([\s\S]*)\)").Groups[1].Value);
            foreach (var x in jObject)
                Console.WriteLine("{0}: {1}", x.Key, x.Value);

            uri = string.Format(@"http://www.xd.com/games/getPlayData?callback=jsonp{0}&_={1}&sid=s1&app=sxd&client=pc&enter_game=true&rqst_sgntr={2}", Stamp(), Stamp(), rnd.NextDouble());
            responseString = Get(uri);
            File.AppendAllText("getPlayData.htm", responseString);

            jObject = JObject.Parse(Regex.Match(responseString, @"jsonp\d*\(([\s\S]*)\)").Groups[1].Value);
            jObject = JObject.Parse(jObject["data"].ToString());

            foreach (var x in jObject)
                Console.WriteLine("{0}: {1}", x.Key, x.Value);

            uri = jObject["url"].ToString();
            responseString = Get(uri);
            File.AppendAllText("url.htm", responseString);

            using (var sw = new StreamWriter("root.htm"))
                sw.Write(responseString);
            //Console.WriteLine(responseString);
        }*/


        private static long Stamp()
        {
            return Convert.ToInt64((DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0)).TotalMilliseconds);
        }//Stamp

        /// <summary>
        /// Http Get
        /// </summary>
        /// <param name="uri"></param>
        /// <returns></returns>
        private string Get(string uri)
        {
            string responseString;

            var request = (HttpWebRequest)WebRequest.Create(uri);
            request.CookieContainer = cookieContainer;

            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            {
                if (stream == null)
                    throw new ArgumentException("[stream] is null");
                if (response.CharacterSet == null)
                    throw new ArgumentException("[response.CharacterSet] is null");
                using (var sr = new StreamReader(stream, Encoding.GetEncoding(response.CharacterSet)))
                    responseString = sr.ReadToEnd();
            }

            return responseString;
        }//Get
    }//class
}//namespace
