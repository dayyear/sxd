
using System;
using System.Linq;

namespace 神仙道
{
    static class Program
    {
        static void Main(string[] args)
        {
            Logger.Log("程序开始", ConsoleColor.Green);
            Sxd.Run(args.Any() ? args[0] : null);
            Logger.Log("程序结束", ConsoleColor.Green);
            //Console.ReadKey();
        }
    }
}
