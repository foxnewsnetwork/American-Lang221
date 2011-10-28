namespace WindowsFormsApplication1
{
    partial class SC2MapAnnotator
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Minimap = new System.Windows.Forms.PictureBox();
            this.baseLocationRadio = new System.Windows.Forms.RadioButton();
            this.buildLocationRadio = new System.Windows.Forms.RadioButton();
            this.loadButton = new System.Windows.Forms.Button();
            this.saveButton = new System.Windows.Forms.Button();
            this.baseListBox = new System.Windows.Forms.ComboBox();
            this.startLocationCheck = new System.Windows.Forms.CheckBox();
            this.debrisCheck = new System.Windows.Forms.CheckBox();
            this.islandCheck = new System.Windows.Forms.CheckBox();
            this.extractorLocation0Radio = new System.Windows.Forms.RadioButton();
            this.extractorLocation1Radio = new System.Windows.Forms.RadioButton();
            this.rampLocationRadio = new System.Windows.Forms.RadioButton();
            this.assaultLocationRadio = new System.Windows.Forms.RadioButton();
            this.deleteBaseButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.Minimap)).BeginInit();
            this.SuspendLayout();
            // 
            // Minimap
            // 
            this.Minimap.Location = new System.Drawing.Point(12, 12);
            this.Minimap.Name = "Minimap";
            this.Minimap.Size = new System.Drawing.Size(700, 700);
            this.Minimap.TabIndex = 0;
            this.Minimap.TabStop = false;
            this.Minimap.Click += new System.EventHandler(this.Minimap_Click);
            // 
            // baseLocationRadio
            // 
            this.baseLocationRadio.AutoSize = true;
            this.baseLocationRadio.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.baseLocationRadio.Location = new System.Drawing.Point(728, 268);
            this.baseLocationRadio.Name = "baseLocationRadio";
            this.baseLocationRadio.Size = new System.Drawing.Size(149, 30);
            this.baseLocationRadio.TabIndex = 1;
            this.baseLocationRadio.TabStop = true;
            this.baseLocationRadio.Text = "Base Location";
            this.baseLocationRadio.UseVisualStyleBackColor = true;
            // 
            // buildLocationRadio
            // 
            this.buildLocationRadio.AutoSize = true;
            this.buildLocationRadio.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buildLocationRadio.Location = new System.Drawing.Point(728, 304);
            this.buildLocationRadio.Name = "buildLocationRadio";
            this.buildLocationRadio.Size = new System.Drawing.Size(152, 30);
            this.buildLocationRadio.TabIndex = 1;
            this.buildLocationRadio.TabStop = true;
            this.buildLocationRadio.Text = "Build Location";
            this.buildLocationRadio.UseVisualStyleBackColor = true;
            // 
            // loadButton
            // 
            this.loadButton.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.loadButton.Location = new System.Drawing.Point(728, 31);
            this.loadButton.Name = "loadButton";
            this.loadButton.Size = new System.Drawing.Size(107, 41);
            this.loadButton.TabIndex = 2;
            this.loadButton.Text = "Load";
            this.loadButton.UseVisualStyleBackColor = true;
            this.loadButton.Click += new System.EventHandler(this.loadButton_Click);
            // 
            // saveButton
            // 
            this.saveButton.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.saveButton.Location = new System.Drawing.Point(856, 31);
            this.saveButton.Name = "saveButton";
            this.saveButton.Size = new System.Drawing.Size(107, 41);
            this.saveButton.TabIndex = 2;
            this.saveButton.Text = "Save";
            this.saveButton.UseVisualStyleBackColor = true;
            this.saveButton.Click += new System.EventHandler(this.saveButton_Click);
            // 
            // baseListBox
            // 
            this.baseListBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.baseListBox.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.baseListBox.FormattingEnabled = true;
            this.baseListBox.Location = new System.Drawing.Point(728, 88);
            this.baseListBox.Name = "baseListBox";
            this.baseListBox.Size = new System.Drawing.Size(235, 34);
            this.baseListBox.TabIndex = 3;
            this.baseListBox.SelectedIndexChanged += new System.EventHandler(this.baseListBox_SelectedIndexChanged);
            // 
            // startLocationCheck
            // 
            this.startLocationCheck.AutoSize = true;
            this.startLocationCheck.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold);
            this.startLocationCheck.Location = new System.Drawing.Point(728, 139);
            this.startLocationCheck.Name = "startLocationCheck";
            this.startLocationCheck.Size = new System.Drawing.Size(150, 30);
            this.startLocationCheck.TabIndex = 4;
            this.startLocationCheck.Text = "Start Location";
            this.startLocationCheck.UseVisualStyleBackColor = true;
            this.startLocationCheck.CheckedChanged += new System.EventHandler(this.startLocationCheck_CheckedChanged);
            // 
            // debrisCheck
            // 
            this.debrisCheck.AutoSize = true;
            this.debrisCheck.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold);
            this.debrisCheck.Location = new System.Drawing.Point(728, 175);
            this.debrisCheck.Name = "debrisCheck";
            this.debrisCheck.Size = new System.Drawing.Size(86, 30);
            this.debrisCheck.TabIndex = 4;
            this.debrisCheck.Text = "Debris";
            this.debrisCheck.UseVisualStyleBackColor = true;
            this.debrisCheck.CheckedChanged += new System.EventHandler(this.debrisCheck_CheckedChanged);
            // 
            // islandCheck
            // 
            this.islandCheck.AutoSize = true;
            this.islandCheck.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold);
            this.islandCheck.Location = new System.Drawing.Point(728, 211);
            this.islandCheck.Name = "islandCheck";
            this.islandCheck.Size = new System.Drawing.Size(82, 30);
            this.islandCheck.TabIndex = 4;
            this.islandCheck.Text = "Island";
            this.islandCheck.UseVisualStyleBackColor = true;
            this.islandCheck.CheckedChanged += new System.EventHandler(this.islandCheck_CheckedChanged);
            // 
            // extractorLocation0Radio
            // 
            this.extractorLocation0Radio.AutoSize = true;
            this.extractorLocation0Radio.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.extractorLocation0Radio.Location = new System.Drawing.Point(728, 407);
            this.extractorLocation0Radio.Name = "extractorLocation0Radio";
            this.extractorLocation0Radio.Size = new System.Drawing.Size(202, 30);
            this.extractorLocation0Radio.TabIndex = 1;
            this.extractorLocation0Radio.TabStop = true;
            this.extractorLocation0Radio.Text = "Extractor 0 Location";
            this.extractorLocation0Radio.UseVisualStyleBackColor = true;
            // 
            // extractorLocation1Radio
            // 
            this.extractorLocation1Radio.AutoSize = true;
            this.extractorLocation1Radio.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.extractorLocation1Radio.Location = new System.Drawing.Point(728, 443);
            this.extractorLocation1Radio.Name = "extractorLocation1Radio";
            this.extractorLocation1Radio.Size = new System.Drawing.Size(202, 30);
            this.extractorLocation1Radio.TabIndex = 1;
            this.extractorLocation1Radio.TabStop = true;
            this.extractorLocation1Radio.Text = "Extractor 1 Location";
            this.extractorLocation1Radio.UseVisualStyleBackColor = true;
            // 
            // rampLocationRadio
            // 
            this.rampLocationRadio.AutoSize = true;
            this.rampLocationRadio.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rampLocationRadio.Location = new System.Drawing.Point(728, 340);
            this.rampLocationRadio.Name = "rampLocationRadio";
            this.rampLocationRadio.Size = new System.Drawing.Size(158, 30);
            this.rampLocationRadio.TabIndex = 1;
            this.rampLocationRadio.TabStop = true;
            this.rampLocationRadio.Text = "Ramp Location";
            this.rampLocationRadio.UseVisualStyleBackColor = true;
            // 
            // assaultLocationRadio
            // 
            this.assaultLocationRadio.AutoSize = true;
            this.assaultLocationRadio.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.assaultLocationRadio.Location = new System.Drawing.Point(728, 376);
            this.assaultLocationRadio.Name = "assaultLocationRadio";
            this.assaultLocationRadio.Size = new System.Drawing.Size(170, 30);
            this.assaultLocationRadio.TabIndex = 1;
            this.assaultLocationRadio.TabStop = true;
            this.assaultLocationRadio.Text = "Assault Location";
            this.assaultLocationRadio.UseVisualStyleBackColor = true;
            // 
            // deleteBaseButton
            // 
            this.deleteBaseButton.Font = new System.Drawing.Font("Calibri", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deleteBaseButton.Location = new System.Drawing.Point(728, 671);
            this.deleteBaseButton.Name = "deleteBaseButton";
            this.deleteBaseButton.Size = new System.Drawing.Size(235, 41);
            this.deleteBaseButton.TabIndex = 5;
            this.deleteBaseButton.Text = "Delete Base";
            this.deleteBaseButton.UseVisualStyleBackColor = true;
            this.deleteBaseButton.Click += new System.EventHandler(this.deleteBaseButton_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(978, 736);
            this.Controls.Add(this.deleteBaseButton);
            this.Controls.Add(this.islandCheck);
            this.Controls.Add(this.debrisCheck);
            this.Controls.Add(this.startLocationCheck);
            this.Controls.Add(this.baseListBox);
            this.Controls.Add(this.saveButton);
            this.Controls.Add(this.loadButton);
            this.Controls.Add(this.extractorLocation1Radio);
            this.Controls.Add(this.assaultLocationRadio);
            this.Controls.Add(this.rampLocationRadio);
            this.Controls.Add(this.extractorLocation0Radio);
            this.Controls.Add(this.buildLocationRadio);
            this.Controls.Add(this.baseLocationRadio);
            this.Controls.Add(this.Minimap);
            this.Name = "Form1";
            this.Text = "Starcraft 2 Map Annotation Tool";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Minimap)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox Minimap;
        private System.Windows.Forms.RadioButton baseLocationRadio;
        private System.Windows.Forms.RadioButton buildLocationRadio;
        private System.Windows.Forms.Button loadButton;
        private System.Windows.Forms.Button saveButton;
        private System.Windows.Forms.ComboBox baseListBox;
        private System.Windows.Forms.CheckBox startLocationCheck;
        private System.Windows.Forms.CheckBox debrisCheck;
        private System.Windows.Forms.CheckBox islandCheck;
        private System.Windows.Forms.RadioButton extractorLocation0Radio;
        private System.Windows.Forms.RadioButton extractorLocation1Radio;
        private System.Windows.Forms.RadioButton rampLocationRadio;
        private System.Windows.Forms.RadioButton assaultLocationRadio;
        private System.Windows.Forms.Button deleteBaseButton;
    }
}

