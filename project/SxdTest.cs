using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Text.RegularExpressions;
using Newtonsoft.Json;

namespace 神仙道
{
    class SxdTest
    {
        public static void Run()
        {
            string responseString;

            SxdWeb web = new SxdWeb("115.182.66.19", "80");
            
            // 初始化
            var username = "dayyear2";
            var password = "orange";
            web.LoginService(username, password);
            //web.Init(username, password);

            // 登录
            /*responseString = web.LoginService("dayyear_wg1", "orange");
            var loginResponse = JsonConvert.DeserializeObject<dynamic>(Regex.Match(responseString, SxdWeb.LOGIN_Pattern).Groups[1].Value);
            //Console.WriteLine(loginResponse);

            if (loginResponse.error != null)
            {
                Console.WriteLine(loginResponse.error);
                return;
            }
            Console.WriteLine("登录成功");*/

            
        }
    }
}
