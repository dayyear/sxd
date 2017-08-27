using System;
using System.Globalization;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Xml.Linq;

namespace 神仙道
{
    static class Sxd
    {
        public static void GenerateUserIni()
        {
            const string path = "../../../user.ini";

            var users = XElement.Load("user.xml");
            var pattern = File.ReadAllText("pattern.txt");
            var evaluator = File.ReadAllText("evaluator.txt");
            foreach (var userX in users.Elements("user"))
            {
                Console.WriteLine(userX.Element("username").Value);
                try
                {
                    var web = new SxdWeb();

                    var username = userX.Element("username").Value;
                    var password = userX.Element("password").Value;
                    var user = web.LoginService(username, password);

                    var id = userX.Element("id").Value;
                    var url = userX.Element("url").Value;
                    var name = userX.Element("name").Value;

                    var userIni = File.ReadAllText(path, Encoding.GetEncoding("GBK"));
                    File.WriteAllText(path, Regex.Replace(userIni, string.Format(pattern, id), string.Format(evaluator, id, url, user.Code, user.Time, user.Hash, user.Time1, user.Hash1, name)), Encoding.GetEncoding("GBK"));

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }//foreach
        }//GenerateUserIni

        public static void Test()
        {
            const string path = "../../../user.ini";

            /*var web = new SxdWeb();
            var user = new User() { Code = "VNxB3Qz0inT5lCv", Time = "1502458609", Hash = "f1a21194d53c887051729410339a8224", Time1 = "1502458608", Hash1 = "60957170b946352f88ce94381152b08c" };
            var response = web.Login(user);
            Console.WriteLine(response);
            */

            var client = new SxdClient();
            client.Login("http://s1.sxd.xd.com/", "M0ZthlvBbiF3Ajp", "1503840228", "61a3dc63fd14935f536ccceaa0404f4e", "1503840228", "badda7160f96e7b9134acffba0d83b16");

            client.GetPlayerCampSalary();

            client.GetDayStone();

            client.ChatWithPlayers("万事如意");

            Console.ReadKey();

        }//Test

        
    }//class
}//namespace
