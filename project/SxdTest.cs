using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Xml.Linq;

namespace 神仙道
{
    static class SxdTest
    {
        public static void Run()
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

                    var userIni = File.ReadAllText(path);
                    File.WriteAllText(path, Regex.Replace(userIni, string.Format(pattern, id), string.Format(evaluator, id, url, user.Code, user.Time, user.Hash, user.Time1, user.Hash1, name)));

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }//foreach
        }//Run
    }//class
}//namespace
