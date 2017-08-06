using System;
using System.Globalization;
using System.Text;
using System.Net;
using System.IO;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;


public class SxdWeb
{
    public static string LOGIN_Pattern = @"jQuery\d*_\d*\(([\s\S]*?)\)";
    private CookieContainer cookieContainer = new CookieContainer();

    private string ip;
    private string port;
    private Random rnd;

    /// <summary>
    /// 构造函数
    /// </summary>
    /// <param name="ip"></param>
    /// <param name="port"></param>
    public SxdWeb(string ip, string port)
    {
        this.ip = ip;
        this.port = port;
        rnd = new Random();
    }

    public void LoginService(string username, string password)
    {
        var uri = string.Format(@"https://ssl.xd.com/users/loginService?callback=jQuery1102{0}_{1}&data%5BUser%5D%5Busername%5D={4}&data%5BUser%5D%5Bpassword%5D={5}&data%5BUser%5D%5Bremember_me%5D=true&data%5BUser%5D%5Bsite%5D=xd&app=sxd&captcha=&captcha_identifier=&need_detail=true&history_amount=0&rqst_sgntr={2}&_={3}",
            rnd.NextDouble().ToString(CultureInfo.CurrentCulture).Replace(".", ""), Stamp(), rnd.NextDouble(), Stamp(), username, password);
        Get(uri);

        /*var jObject = JObject.Parse(Regex.Match(responseString, @"jQuery\d*_\d*\(([\s\S]*)\)").Groups[1].Value);
        foreach (var x in jObject)
            Console.WriteLine("{0}: {1}", x.Key, x.Value);*/

        uri = @"http://www.xd.com/games/play?app=sxd&server=s1";
        Get(uri);
        //Get(uri);

        var cookieCollection = cookieContainer.GetCookies(new Uri("http://s1.sxd.xd.com/"));
        var code = cookieCollection["user"].Value;
        var time = cookieCollection["_time"].Value;
        var hash = cookieCollection["_hash"].Value;
        var time1 = cookieCollection["login_time_sxd_xxxxxxxx"].Value;
        var hash1 = cookieCollection["login_hash_sxd_xxxxxxxx"].Value;

        File.WriteAllText("user.ini", "[35574178.s1]\r\n");
        File.AppendAllText("user.ini", "url=http://s1.sxd.xd.com/\r\n");
        File.AppendAllText("user.ini", string.Format("code={0}\r\n", code));
        File.AppendAllText("user.ini", string.Format("time={0}\r\n", time));
        File.AppendAllText("user.ini", string.Format("hash={0}\r\n", hash));
        File.AppendAllText("user.ini", string.Format("time1={0}\r\n", time1));
        File.AppendAllText("user.ini", string.Format("hash1={0}\r\n", hash1));
        File.AppendAllText("user.ini", string.Format("name={0}\r\n", "伍岚芷.s1"));

    }//LoginService

    /// <summary>
    /// 初始化
    /// </summary>
    /// <returns></returns>
    public void Init(string username, string password)
    {
        /*
         * https://ssl.xd.com/users/loginService?callback=jQuery110207597075090743601_1463388925054&data%5BUser%5D%5Busername%5D=dayyear&data%5BUser%5D%5Bpassword%5D=orange&data%5BUser%5D%5Bremember_me%5D=true&data%5BUser%5D%5Bsite%5D=xd&app=sxd&captcha=&captcha_identifier=&need_detail=true&history_amount=0&rqst_sgntr=0.4521544014569372&_=1463388925056
         */
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
    }

    /// <summary>
    /// 登录
    /// </summary>
    /// <param name="username"></param>
    /// <param name="password"></param>
    /// <returns></returns>
    /*public string LoginService(string username, string password)
    {
        string uri = string.Format("https://ssl.xd.com/users/loginService?callback=jQuery17106867409127298743_{2}&data%5BUser%5D%5Busername%5D={0}&data%5BUser%5D%5Bpassword%5D={1}&data%5BUser%5D%5Bremember_me%5D=false&data%5BUser%5D%5Bsite%5D=xd&app=sxd&captcha=null&captcha_identifier=&need_detail=true&history_amount=0&rqst_sgntr=0.8621847827453166&_={3}",
            username, password, Stamp(), Convert.ToInt64((DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0)).TotalMilliseconds));

        return Get(uri);
    }*/

    private long Stamp()
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
