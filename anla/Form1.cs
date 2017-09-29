using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Net.Sockets;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Windows.Forms;

namespace anla
{
    public partial class Form1 : Form
    {

        private readonly SxdClient client = new SxdClient();
        private Thread thread;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            CheckForIllegalCrossThreadCalls = false;

            client.UpdateUIDelegate += UpdataUIStatus;

            var dictionary = new Dictionary<string, string>();
            foreach (Match match in Regex.Matches(File.ReadAllText(ConfigurationManager.AppSettings["userPath"], Encoding.GetEncoding("GBK")), string.Format(File.ReadAllText("pattern.txt"), "(.*)")))
                dictionary.Add(match.Groups[1].Value, match.Groups[8].Value);
            comboBox1.DataSource = new BindingSource(dictionary, null);
            comboBox1.DisplayMember = "Value";
            comboBox1.ValueMember = "Key";

            richTextBox1.SelectionHangingIndent = 90;
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            thread = new Thread(doWork);
            thread.Start(comboBox1.SelectedValue);
            //doWork();
        }

        private void UpdataUIStatus(UpdateType type, object data)
        {
            switch (type)
            {
                case UpdateType.LogOnlyToFile:
                    Logger.Log((string)data);
                    break;
                case UpdateType.LogBoth:
                    Logger.Log((string)data, richTextBox1);
                    break;
            }//switch (type)
        }//UpdataUIStatus


        /// <summary>
        /// 打开日志文件
        /// </summary>
        private void linkLabelOpenLog_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            try { Process.Start(string.Format("{0}/Log/{1}.log", Environment.CurrentDirectory, DateTime.Now.ToString("yyyy-MM-dd"))); }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }//linkLabelOpenLog_LinkClicked








        private void doWork(object parameter)
        {
            try
            {

                var id = (string)parameter;
                //const string id = "35571761.s2";
                var match = Regex.Match(File.ReadAllText(ConfigurationManager.AppSettings["userPath"], Encoding.GetEncoding("GBK")), string.Format(File.ReadAllText("pattern.txt"), id));
                if (!match.Success)
                    throw new NullReferenceException(string.Format("找不到用户[{0}]的信息", id));

                var url = match.Groups[1].Value;
                var code = match.Groups[2].Value;
                var time = match.Groups[3].Value;
                var hash = match.Groups[4].Value;
                var time1 = match.Groups[5].Value;
                var hash1 = match.Groups[6].Value;


                Logger.Log(string.Empty, richTextBox1);
                Logger.Log("---- [登录] ----", richTextBox1);
                Logger.Log(string.Format("---- [Login(url={0}, code={1}, time{2}, hash={3}, time1={4}, hash1={5})] ----", url, code, time, hash, time1, hash1));
                if (client.Login(url, code, time, hash, time1, hash1))
                    return;

                Logger.Log("---- [获取玩家信息] ----", richTextBox1);
                Logger.Log("---- [GetPlayerInfo] ----");
                if (!client.GetPlayerInfo())
                    return;

                Logger.Log("---- [登录仙界] ----", richTextBox1);
                Logger.Log("---- [GetLoginInfo] ----");
                if (!client.GetLoginInfo())
                    return;
                Logger.Log("---- [StLogin] ----");
                client.StLogin();

                Logger.Log("---- [领取俸禄] ----", richTextBox1);
                Logger.Log("---- [GetPlayerCampSalary] ----");
                client.GetPlayerCampSalary();

                Logger.Log("---- [领取仙令] ----", richTextBox1);
                Logger.Log("---- [PlayerGetXianLingGift] ----");
                client.PlayerGetXianLingGift();

                Logger.Log("---- [领取灵石] ----", richTextBox1);
                Logger.Log("---- [GetDayStone] ----");
                client.GetDayStone();

                Logger.Log("---- [万事如意] ----", richTextBox1);
                Logger.Log("---- [ChatWithPlayers] ----");
                client.ChatWithPlayers("万事如意");
            }
            catch (Exception ex)
            {
                Logger.Log(ex.Message, richTextBox1);
            }
        }//bgWorker1_DoWork


    }//class


    // State object for receiving data from remote device.  
    class StateObject
    {
        // Client socket.  
        public Socket workSocket;
        // Size of receive buffer.  
        public const int BufferSize = 4096;
        // Receive buffer.  
        public readonly byte[] buffer = new byte[BufferSize];
        // Received data string.  
        //public StringBuilder sb = new StringBuilder();
        public readonly List<byte> byteList = new List<byte>();
    }

    public enum UpdateType { LogBoth, LogOnlyToFile, Nickname, Level, Ingot, Coins, Health, Power, Experience };

}//namespace
