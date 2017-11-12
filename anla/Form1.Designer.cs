namespace anla
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.buttonLogin = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.buttonConfig = new System.Windows.Forms.Button();
            this.linkLabelOpenLog = new System.Windows.Forms.LinkLabel();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.SuspendLayout();
            // 
            // buttonLogin
            // 
            this.buttonLogin.Location = new System.Drawing.Point(329, 12);
            this.buttonLogin.Name = "buttonLogin";
            this.buttonLogin.Size = new System.Drawing.Size(139, 51);
            this.buttonLogin.TabIndex = 8;
            this.buttonLogin.Text = "登 录";
            this.buttonLogin.UseVisualStyleBackColor = true;
            this.buttonLogin.Click += new System.EventHandler(this.buttonLogin_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(685, 12);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(139, 51);
            this.button2.TabIndex = 9;
            this.button2.Text = "背 包";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(863, 12);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(139, 51);
            this.button3.TabIndex = 10;
            this.button3.Text = "仓 库";
            this.button3.UseVisualStyleBackColor = true;
            // 
            // buttonConfig
            // 
            this.buttonConfig.Location = new System.Drawing.Point(507, 12);
            this.buttonConfig.Name = "buttonConfig";
            this.buttonConfig.Size = new System.Drawing.Size(139, 51);
            this.buttonConfig.TabIndex = 11;
            this.buttonConfig.Text = "设 置";
            this.buttonConfig.UseVisualStyleBackColor = true;
            // 
            // linkLabelOpenLog
            // 
            this.linkLabelOpenLog.AutoSize = true;
            this.linkLabelOpenLog.Location = new System.Drawing.Point(848, 696);
            this.linkLabelOpenLog.Name = "linkLabelOpenLog";
            this.linkLabelOpenLog.Size = new System.Drawing.Size(154, 24);
            this.linkLabelOpenLog.TabIndex = 12;
            this.linkLabelOpenLog.TabStop = true;
            this.linkLabelOpenLog.Text = "打开日志文件";
            this.linkLabelOpenLog.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabelOpenLog_LinkClicked);
            // 
            // comboBox1
            // 
            this.comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(12, 12);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(311, 31);
            this.comboBox1.TabIndex = 13;
            // 
            // richTextBox1
            // 
            this.richTextBox1.BackColor = System.Drawing.SystemColors.Window;
            this.richTextBox1.Font = new System.Drawing.Font("宋体", 12F);
            this.richTextBox1.Location = new System.Drawing.Point(12, 69);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.ReadOnly = true;
            this.richTextBox1.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.ForcedVertical;
            this.richTextBox1.Size = new System.Drawing.Size(990, 624);
            this.richTextBox1.TabIndex = 14;
            this.richTextBox1.Text = resources.GetString("richTextBox1.Text");
            // 
            // Form1
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(1014, 729);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.linkLabelOpenLog);
            this.Controls.Add(this.buttonConfig);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.buttonLogin);
            this.Font = new System.Drawing.Font("宋体", 14F);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "安啦";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonLogin;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button buttonConfig;
        private System.Windows.Forms.LinkLabel linkLabelOpenLog;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.RichTextBox richTextBox1;
    }
}

