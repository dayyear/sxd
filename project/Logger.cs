using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading;
using System.Web;

public static class Logger
{
    private static readonly Dictionary<ConsoleColor, string> map = new Dictionary<ConsoleColor, string>() { 
        { ConsoleColor.Black, "#000000" }, { ConsoleColor.DarkBlue, "#000080" }, 
        { ConsoleColor.DarkGreen, "#008000" }, { ConsoleColor.DarkCyan, "#008080" }, 
        { ConsoleColor.DarkRed, "#800000" }, { ConsoleColor.DarkMagenta, "#800080" }, 
        { ConsoleColor.DarkYellow, "#808000" }, { ConsoleColor.Gray, "#C0C0C0" }, 
        { ConsoleColor.DarkGray, "#808080" }, { ConsoleColor.Blue, "#0000FF" }, 
        { ConsoleColor.Green, "#00FF00" }, { ConsoleColor.Cyan, "#00FFFF" }, 
        { ConsoleColor.Red, "#FF0000" }, { ConsoleColor.Magenta, "#FF00FF" }, 
        { ConsoleColor.Yellow, "#FFFF00" }, { ConsoleColor.White, "#FFFFFF" } };


    public static void Log(string message,
        ConsoleColor foregroundColor = ConsoleColor.White,
        bool console = true, bool file = true,
        bool showTime = true, bool writeLine = true)
    {
        using (var mtx = new Mutex(false, "Log"))
        {
            try
            {
                mtx.WaitOne();

                if (!Directory.Exists("Log"))
                    Directory.CreateDirectory("Log");

                var now = DateTime.Now;
                using (var sw = new StreamWriter(string.Format("Log/{0}.html", now.ToString("yyyy-MM-dd")), true, Encoding.UTF8))
                {
                    if (showTime)
                        message = string.Format("{0} {1}", now.ToString("HH:mm:ss"), message);
                    if (file)
                        sw.WriteLine("<div style='color:{1};background:#000;'>{0}</div>",
                            HttpUtility.HtmlEncode(message), map[foregroundColor]);
                    var currentColor = Console.ForegroundColor;
                    Console.ForegroundColor = foregroundColor;
                    if (console)
                        if (writeLine)
                            Console.WriteLine(message);
                        else
                            Console.Write(message);
                    Console.ForegroundColor = currentColor;
                }//StreamWriter
            }//try
            finally { mtx.ReleaseMutex(); }
        }//mtx
    }//Log
}//class