


using System;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace 神仙道
{
    class Program
    {
        static void Main(string[] args)
        {
            /*Console.BackgroundColor = ConsoleColor.White;
            Console.ForegroundColor = ConsoleColor.Black;
            Console.Clear();*/

            /*var jArray = Protocols.Decode(
                new byte[] { 0x00, 0x00, 0x05, 0x6C, 0xC7, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08, 0x00, 0x00, 0x10, 0x85 },
                JArray.Parse("[\"Utils.UByteUtil\", \"Utils.IntUtil\", \"Utils.UByteUtil\", \"Utils.IntUtil\", \"Utils.ByteUtil\", \"Utils.IntUtil\", \"Utils.ByteUtil\", \"Utils.UByteUtil\", \"Utils.IntUtil\"]"));
            Console.WriteLine(jArray);*/

            /*var jArray = Protocols.Decode(
                new byte[] { 0x00, 0x01, 0x47, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
                JArray.Parse("[[\"Utils.UByteUtil\", \"Utils.LongUtil\"]]"));
            Console.WriteLine(jArray);*/

            /*var jArray = Protocols.Decode(
                new byte[] { 0x00, 0x03, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x5E, 0x14, 0x00, 0x00, 0x00, 0x00, 0x23, 0x7F, 0x7A, 0xC1, 0x4A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
                JArray.Parse("[[\"Utils.UByteUtil\", \"Utils.LongUtil\"]]"));
            Console.WriteLine(jArray.ToString(Formatting.None));
            return;*/

            Logger.Log("程序开始", ConsoleColor.Green);

            //Sxd.Test();
            //Sxd.Analyze();
            Sxd.TestWhileInThread();
        }

        
    }
}
