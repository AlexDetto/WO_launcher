procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(Form1));
        self.textBox1 := new System.Windows.Forms.TextBox();
        self.label1 := new System.Windows.Forms.Label();
        self.button1 := new System.Windows.Forms.Button();
        self.button2 := new System.Windows.Forms.Button();
        self.button3 := new System.Windows.Forms.Button();
        self.label2 := new System.Windows.Forms.Label();
        self.textBox2 := new System.Windows.Forms.TextBox();
        self.checkBox1 := new System.Windows.Forms.CheckBox();
        self.button4 := new System.Windows.Forms.Button();
        self.comboBox1 := new System.Windows.Forms.ComboBox();
        self.label3 := new System.Windows.Forms.Label();
        self.checkBox2 := new System.Windows.Forms.CheckBox();
        self.textBox3 := new System.Windows.Forms.TextBox();
        self.label4 := new System.Windows.Forms.Label();
        self.button5 := new System.Windows.Forms.Button();
        self.button7 := new System.Windows.Forms.Button();
        self.toolTip1 := new System.Windows.Forms.ToolTip(self.components);
        self.button6 := new System.Windows.Forms.Button();
        self.label5 := new System.Windows.Forms.Label();
        self.label6 := new System.Windows.Forms.Label();
        self.button8 := new System.Windows.Forms.Button();
        self.button9 := new System.Windows.Forms.Button();
        self.label7 := new System.Windows.Forms.Label();
        self.SuspendLayout();
        // 
        // textBox1
        // 
        self.textBox1.Location := new System.Drawing.Point(115, 62);
        self.textBox1.Name := 'textBox1';
        self.textBox1.Size := new System.Drawing.Size(330, 20);
        self.textBox1.TabIndex := 0;
        // 
        // label1
        // 
        self.label1.Font := new System.Drawing.Font('Microsoft Sans Serif', 10.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label1.Location := new System.Drawing.Point(229, 36);
        self.label1.Name := 'label1';
        self.label1.Size := new System.Drawing.Size(100, 23);
        self.label1.TabIndex := 1;
        self.label1.Text := 'Nickname';
        self.label1.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // button1
        // 
        self.button1.Location := new System.Drawing.Point(229, 196);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(100, 23);
        self.button1.TabIndex := 2;
        self.button1.Text := 'Играть';
        self.button1.UseVisualStyleBackColor := true;
        self.button1.Click += button1_Click;
        // 
        // button2
        // 
        self.button2.Location := new System.Drawing.Point(491, 196);
        self.button2.Name := 'button2';
        self.button2.Size := new System.Drawing.Size(75, 23);
        self.button2.TabIndex := 3;
        self.button2.Text := 'Закрыть';
        self.button2.UseVisualStyleBackColor := true;
        self.button2.Click += button2_Click;
        // 
        // button3
        // 
        self.button3.Location := new System.Drawing.Point(13, 196);
        self.button3.Name := 'button3';
        self.button3.Size := new System.Drawing.Size(75, 23);
        self.button3.TabIndex := 4;
        self.button3.Text := 'Инфо';
        self.button3.UseVisualStyleBackColor := true;
        self.button3.Click += button3_Click;
        // 
        // label2
        // 
        self.label2.Font := new System.Drawing.Font('Microsoft Sans Serif', 10.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label2.Location := new System.Drawing.Point(115, 85);
        self.label2.Name := 'label2';
        self.label2.Size := new System.Drawing.Size(214, 23);
        self.label2.TabIndex := 5;
        self.label2.Text := 'IP-address';
        self.label2.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        self.label2.Click += label2_Click;
        // 
        // textBox2
        // 
        self.textBox2.Location := new System.Drawing.Point(115, 111);
        self.textBox2.Name := 'textBox2';
        self.textBox2.Size := new System.Drawing.Size(214, 20);
        self.textBox2.TabIndex := 6;
        // 
        // checkBox1
        // 
        self.checkBox1.Location := new System.Drawing.Point(115, 136);
        self.checkBox1.Name := 'checkBox1';
        self.checkBox1.Size := new System.Drawing.Size(127, 24);
        self.checkBox1.TabIndex := 7;
        self.checkBox1.Text := 'Запустить сервер';
        self.checkBox1.UseVisualStyleBackColor := true;
        self.checkBox1.CheckedChanged += checkBox1_CheckedChanged;
        // 
        // button4
        // 
        self.button4.BackColor := System.Drawing.SystemColors.Control;
        self.button4.FlatAppearance.BorderColor := System.Drawing.SystemColors.Control;
        self.button4.FlatAppearance.BorderSize := 0;
        self.button4.FlatAppearance.MouseDownBackColor := System.Drawing.SystemColors.Control;
        self.button4.FlatAppearance.MouseOverBackColor := System.Drawing.SystemColors.ControlDark;
        self.button4.FlatStyle := System.Windows.Forms.FlatStyle.Flat;
        self.button4.Location := new System.Drawing.Point(229, 136);
        self.button4.Name := 'button4';
        self.button4.Size := new System.Drawing.Size(17, 23);
        self.button4.TabIndex := 8;
        self.button4.Text := '?';
        self.toolTip1.SetToolTip(self.button4, 'More information');
        self.button4.UseVisualStyleBackColor := false;
        self.button4.Click += button4_Click;
        // 
        // comboBox1
        // 
        self.comboBox1.FormattingEnabled := true;
        self.comboBox1.Items.AddRange(new System.Object[2]('DirectX 11', 'DirectX 12'));
        self.comboBox1.Location := new System.Drawing.Point(12, 12);
        self.comboBox1.Name := 'comboBox1';
        self.comboBox1.Size := new System.Drawing.Size(76, 21);
        self.comboBox1.TabIndex := 9;
        self.toolTip1.SetToolTip(self.comboBox1, 'Select DirectX version');
        // 
        // label3
        // 
        self.label3.Location := new System.Drawing.Point(184, 5);
        self.label3.Name := 'label3';
        self.label3.Size := new System.Drawing.Size(58, 23);
        self.label3.TabIndex := 10;
        self.label3.Visible := false;
        // 
        // checkBox2
        // 
        self.checkBox2.Location := new System.Drawing.Point(336, 135);
        self.checkBox2.Name := 'checkBox2';
        self.checkBox2.Size := new System.Drawing.Size(137, 24);
        self.checkBox2.TabIndex := 11;
        self.checkBox2.Text := 'Нестандартный порт';
        self.checkBox2.UseVisualStyleBackColor := true;
        self.checkBox2.CheckedChanged += checkBox2_CheckedChanged;
        // 
        // textBox3
        // 
        self.textBox3.Enabled := false;
        self.textBox3.Location := new System.Drawing.Point(336, 111);
        self.textBox3.Name := 'textBox3';
        self.textBox3.Size := new System.Drawing.Size(109, 20);
        self.textBox3.TabIndex := 12;
        // 
        // label4
        // 
        self.label4.Font := new System.Drawing.Font('Microsoft Sans Serif', 10.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label4.Location := new System.Drawing.Point(336, 85);
        self.label4.Name := 'label4';
        self.label4.Size := new System.Drawing.Size(109, 23);
        self.label4.TabIndex := 13;
        self.label4.Text := 'Port';
        self.label4.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // button5
        // 
        self.button5.BackColor := System.Drawing.SystemColors.Control;
        self.button5.FlatAppearance.BorderColor := System.Drawing.SystemColors.Control;
        self.button5.FlatAppearance.BorderSize := 0;
        self.button5.FlatAppearance.MouseDownBackColor := System.Drawing.SystemColors.Control;
        self.button5.FlatAppearance.MouseOverBackColor := System.Drawing.SystemColors.ControlDark;
        self.button5.FlatStyle := System.Windows.Forms.FlatStyle.Flat;
        self.button5.Location := new System.Drawing.Point(465, 135);
        self.button5.Name := 'button5';
        self.button5.Size := new System.Drawing.Size(17, 23);
        self.button5.TabIndex := 14;
        self.button5.Text := '?';
        self.toolTip1.SetToolTip(self.button5, 'More information');
        self.button5.UseVisualStyleBackColor := false;
        self.button5.Click += button5_Click;
        // 
        // button7
        // 
        self.button7.BackgroundImage := (System.Drawing.Image(resources.GetObject('button7.BackgroundImage')));
        self.button7.BackgroundImageLayout := System.Windows.Forms.ImageLayout.Stretch;
        self.button7.FlatStyle := System.Windows.Forms.FlatStyle.Flat;
        self.button7.ForeColor := System.Drawing.SystemColors.Control;
        self.button7.Location := new System.Drawing.Point(36, 85);
        self.button7.Name := 'button7';
        self.button7.Size := new System.Drawing.Size(26, 26);
        self.button7.TabIndex := 16;
        self.toolTip1.SetToolTip(self.button7, 'Open game folder');
        self.button7.UseVisualStyleBackColor := true;
        self.button7.Click += button7_Click;
        // 
        // button6
        // 
        self.button6.BackgroundImage := (System.Drawing.Image(resources.GetObject('button6.BackgroundImage')));
        self.button6.BackgroundImageLayout := System.Windows.Forms.ImageLayout.Stretch;
        self.button6.FlatStyle := System.Windows.Forms.FlatStyle.Flat;
        self.button6.ForeColor := System.Drawing.SystemColors.Control;
        self.button6.Location := new System.Drawing.Point(36, 119);
        self.button6.Name := 'button6';
        self.button6.Size := new System.Drawing.Size(26, 26);
        self.button6.TabIndex := 15;
        self.toolTip1.SetToolTip(self.button6, 'Change game folder');
        self.button6.UseVisualStyleBackColor := true;
        self.button6.Click += button6_Click;
        // 
        // label5
        // 
        self.label5.Font := new System.Drawing.Font('Microsoft Sans Serif', 8.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label5.Location := new System.Drawing.Point(13, 59);
        self.label5.Name := 'label5';
        self.label5.Size := new System.Drawing.Size(79, 23);
        self.label5.TabIndex := 17;
        self.label5.Text := 'Game Folder';
        self.label5.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // label6
        // 
        self.label6.Font := new System.Drawing.Font('Microsoft Sans Serif', 8.25, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label6.Location := new System.Drawing.Point(476, 62);
        self.label6.Name := 'label6';
        self.label6.Size := new System.Drawing.Size(101, 23);
        self.label6.TabIndex := 18;
        self.label6.Text := 'Server Folder';
        self.label6.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // button8
        // 
        self.button8.BackgroundImage := (System.Drawing.Image(resources.GetObject('button8.BackgroundImage')));
        self.button8.BackgroundImageLayout := System.Windows.Forms.ImageLayout.Stretch;
        self.button8.FlatStyle := System.Windows.Forms.FlatStyle.Flat;
        self.button8.ForeColor := System.Drawing.SystemColors.Control;
        self.button8.Location := new System.Drawing.Point(512, 88);
        self.button8.Name := 'button8';
        self.button8.Size := new System.Drawing.Size(26, 26);
        self.button8.TabIndex := 20;
        self.toolTip1.SetToolTip(self.button8, 'Open server folder');
        self.button8.UseVisualStyleBackColor := true;
        self.button8.Click += button8_Click;
        // 
        // button9
        // 
        self.button9.BackgroundImage := (System.Drawing.Image(resources.GetObject('button9.BackgroundImage')));
        self.button9.BackgroundImageLayout := System.Windows.Forms.ImageLayout.Stretch;
        self.button9.FlatStyle := System.Windows.Forms.FlatStyle.Flat;
        self.button9.ForeColor := System.Drawing.SystemColors.Control;
        self.button9.Location := new System.Drawing.Point(512, 122);
        self.button9.Name := 'button9';
        self.button9.Size := new System.Drawing.Size(26, 26);
        self.button9.TabIndex := 19;
        self.toolTip1.SetToolTip(self.button9, 'Change server folder');
        self.button9.UseVisualStyleBackColor := true;
        self.button9.Click += button9_Click;
        // 
        // label7
        // 
        self.label7.Location := new System.Drawing.Point(336, 5);
        self.label7.Name := 'label7';
        self.label7.Size := new System.Drawing.Size(58, 23);
        self.label7.TabIndex := 21;
        self.label7.Visible := false;
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(578, 231);
        self.ControlBox := false;
        self.Controls.Add(self.label7);
        self.Controls.Add(self.button8);
        self.Controls.Add(self.button9);
        self.Controls.Add(self.label6);
        self.Controls.Add(self.label5);
        self.Controls.Add(self.button7);
        self.Controls.Add(self.button6);
        self.Controls.Add(self.button5);
        self.Controls.Add(self.label4);
        self.Controls.Add(self.textBox3);
        self.Controls.Add(self.checkBox2);
        self.Controls.Add(self.label3);
        self.Controls.Add(self.comboBox1);
        self.Controls.Add(self.button4);
        self.Controls.Add(self.checkBox1);
        self.Controls.Add(self.textBox2);
        self.Controls.Add(self.label2);
        self.Controls.Add(self.button3);
        self.Controls.Add(self.button2);
        self.Controls.Add(self.button1);
        self.Controls.Add(self.label1);
        self.Controls.Add(self.textBox1);
        self.FormBorderStyle := System.Windows.Forms.FormBorderStyle.FixedSingle;
        self.Icon := (System.Drawing.Icon(resources.GetObject('$this.Icon')));
        self.Name := 'Form1';
        self.StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen;
        self.Text := 'Witcher 3: Online Launcher';
        self.ResumeLayout(false);
        self.PerformLayout();
    end;
