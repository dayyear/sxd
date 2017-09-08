using System;
using System.IO;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace anla
{
    public static class Logger
    {

        public static void Log(string message, TextBox textBox = null)
        {
            using (var mtx = new Mutex(false, "Log"))
            {
                try
                {
                    mtx.WaitOne();

                    if (!Directory.Exists("Log"))
                        Directory.CreateDirectory("Log");

                    var now = DateTime.Now;
                    using (var sw = new StreamWriter(string.Format("Log/{0}.log", now.ToString("yyyy-MM-dd")), true, Encoding.UTF8))
                    {
                        var s = string.IsNullOrEmpty(message) ? string.Empty : string.Format("{0} {1}", now.ToString("HH:mm:ss"), message);
                        sw.WriteLine(s);
                        if (textBox != null)
                            textBox.AppendText(s + Environment.NewLine);
                    }//sw
                }
                finally { mtx.ReleaseMutex(); }
            }//Mutex
        }//Log

    }//class
}//namespace