using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace WindowsFormsApplication1
{
    public partial class SC2MapAnnotator : Form
    {
        struct Vec2f
        {
            public override string ToString()
            {
                return x.ToString() + " " + y.ToString();
            }
            public float x, y;
        };

        class BaseInfo
        {
            public Vec2f BaseLocation;
            public Vec2f BuildLocation;
            public Vec2f ExtractorLocation0;
            public Vec2f ExtractorLocation1;
            public Vec2f RampLocation;
            public Vec2f AssaultLocation;
            public bool StartLocation;
            public bool Island;
            public bool Debris;
        };

        Graphics graphics;
        List<BaseInfo> baseList;
        Image minimapImage;
        string baseFilename;

        public SC2MapAnnotator()
        {
            InitializeComponent();
            graphics = Minimap.CreateGraphics();
        }

        private void DrawCircle(Vec2f pos, Color color, int Radius)
        {
            Pen pen = new Pen(Color.FromArgb(255, 0, 0, 0), 4);
            SolidBrush brush = new SolidBrush(color);
            int CenterX = (int)(pos.x * Minimap.Width);
            int CenterY = (int)(pos.y * Minimap.Height);
            Rectangle rect = new Rectangle(CenterX - Radius, CenterY - Radius, 2 * Radius, 2 * Radius);
            graphics.DrawEllipse(pen, rect);
            graphics.FillEllipse(brush, rect);
        }

        private void RepaintMinimap()
        {
            Rectangle destinationRect = new Rectangle(0, 0, Minimap.Width, Minimap.Height);
            graphics.DrawImage(minimapImage, destinationRect);
            if (baseListBox.SelectedIndex == 0)
            {
                foreach (BaseInfo curBase in baseList)
                {
                    DrawCircle(curBase.BaseLocation, Color.FromArgb(255, 255, 255, 255), 8);
                }
            }
            else
            {
                try
                {
                    BaseInfo curBase = baseList[baseListBox.SelectedIndex - 1];
                    DrawCircle(curBase.BaseLocation, Color.FromArgb(255, 225, 225, 225), 8);

                    DrawCircle(curBase.BuildLocation, Color.FromArgb(255, 225, 10, 10), 5);
                    DrawCircle(curBase.ExtractorLocation0, Color.FromArgb(255, 10, 128, 10), 5);
                    DrawCircle(curBase.ExtractorLocation1, Color.FromArgb(255, 0, 255, 0), 5);
                    DrawCircle(curBase.RampLocation, Color.FromArgb(255, 10, 10, 225), 5);
                    DrawCircle(curBase.AssaultLocation, Color.FromArgb(255, 225, 225, 10), 5);
                }
                catch
                {

                }
            }
        }

        private void UpdateAll(bool UpdateComboBox)
        {
            if (UpdateComboBox)
            {
                int selectedIndex = baseListBox.SelectedIndex;
                if (selectedIndex == -1)
                {
                    selectedIndex = 0;
                }
                baseListBox.Items.Clear();
                baseListBox.Items.Add("All bases");
                int index = 0;
                foreach (BaseInfo curBase in baseList)
                {
                    baseListBox.Items.Add("Base " + index.ToString());
                    index++;
                }
                baseListBox.SelectedIndex = selectedIndex;
            }
            try
            {
                BaseInfo curBase = baseList[baseListBox.SelectedIndex - 1];
                startLocationCheck.Checked = curBase.StartLocation;
                debrisCheck.Checked = curBase.Debris;
                islandCheck.Checked = curBase.Island;
            }
            catch
            {

            }
            RepaintMinimap();
        }

        private void loadButton_Click(object sender, EventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();

            dialog.Filter = "png files (*.png)|*.png|All files (*.*)|*.*";
            dialog.FilterIndex = 2;
            dialog.RestoreDirectory = true;

            if (dialog.ShowDialog() == DialogResult.OK)
            {
                baseFilename = dialog.FileName;
                String[] allLines = null;
                try
                {
                    String loadFilename = baseFilename.Replace(".png", ".txt");
                    allLines = File.ReadAllLines(loadFilename);    
                }
                catch { }
                if (allLines == null)
                {
                    baseList = new List<BaseInfo>();
                }
                else
                {
                    String[] line0Words = allLines[0].Split(' ');
                    int baseCount = Convert.ToInt32(line0Words[1]);
                    baseList = new List<BaseInfo>();
                    for(int baseIndex = 0; baseIndex < baseCount; baseIndex++)
                    {
                        Vec2f Default;
                        Default.x = 0.5f;
                        Default.y = 0.5f;
                        BaseInfo newBase = new BaseInfo();
                        newBase.BaseLocation = Default;
                        newBase.AssaultLocation = Default;
                        newBase.BuildLocation = Default;
                        newBase.ExtractorLocation0 = Default;
                        newBase.ExtractorLocation1 = Default;
                        newBase.RampLocation = Default;
                        newBase.Debris = false;
                        newBase.Island = false;
                        newBase.StartLocation = false;
                        baseList.Add(newBase);
                    }
                    for (int lineIndex = 1; lineIndex < allLines.Length; lineIndex++)
                    {
                        String curLine = allLines[lineIndex];
                        String[] curWords = curLine.Split(' ');
                        if (curWords.Length == 4 || curWords.Length == 5)
                        {
                            int baseIndex = Convert.ToInt32(curWords[1]);
                            BaseInfo curBase = baseList[baseIndex];
                            String property = curWords[2];
                            if (curWords.Length == 4)
                            {
                                bool value = Convert.ToBoolean(curWords[3]);
                                if (property == "Debris") curBase.Debris = value;
                                else if (property == "StartLocation") curBase.StartLocation = value;
                                else if (property == "Island") curBase.Island = value;
                                else MessageBox.Show("Unexpected field property", "SC2 Map Annotator", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            }
                            if (curWords.Length == 5)
                            {
                                Vec2f value;
                                value.x = Convert.ToSingle(curWords[3]);
                                value.y = Convert.ToSingle(curWords[4]);
                                if (property == "AssaultLocation") curBase.AssaultLocation = value;
                                else if (property == "BaseLocation") curBase.BaseLocation = value;
                                else if (property == "BuildLocation") curBase.BuildLocation = value;
                                else if (property == "ExtractorLocation0") curBase.ExtractorLocation0 = value;
                                else if (property == "ExtractorLocation1") curBase.ExtractorLocation1 = value;
                                else if (property == "RampLocation") curBase.RampLocation = value;
                                else MessageBox.Show("Unexpected field property", "SC2 Map Annotator", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            }
                        }
                    }
                    
                }
                minimapImage = Image.FromFile(dialog.FileName);
                UpdateAll(true);
            }
        }

        private void saveButton_Click(object sender, EventArgs e)
        {
            try
            {
                StreamWriter SW;
                String saveFilename = baseFilename.Replace(".png", ".txt");
                SW = File.CreateText(saveFilename);
                SW.WriteLine("BaseCount " + baseList.Count.ToString());
                int baseIndex = 0;
                foreach (BaseInfo curBase in baseList)
                {
                    SW.WriteLine("Base " + baseIndex + " BaseLocation " + curBase.BaseLocation);
                    SW.WriteLine("Base " + baseIndex + " AssaultLocation " + curBase.AssaultLocation);
                    SW.WriteLine("Base " + baseIndex + " BuildLocation " + curBase.BuildLocation);
                    SW.WriteLine("Base " + baseIndex + " ExtractorLocation0 " + curBase.ExtractorLocation0);
                    SW.WriteLine("Base " + baseIndex + " ExtractorLocation1 " + curBase.ExtractorLocation1);
                    SW.WriteLine("Base " + baseIndex + " RampLocation " + curBase.RampLocation);
                    SW.WriteLine("Base " + baseIndex + " Debris " + curBase.Debris);
                    SW.WriteLine("Base " + baseIndex + " StartLocation " + curBase.StartLocation);
                    SW.WriteLine("Base " + baseIndex + " Island " + curBase.Island);
                    baseIndex++;
                }
                SW.Close();
            }
            catch
            {
                MessageBox.Show("Unexpected failure saving map", "SC2 Map Annotator", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void Minimap_Click(object sender, EventArgs e)
        {
            MouseEventArgs arg = (MouseEventArgs)e;
            Vec2f Pos;
            Pos.x = (float)arg.X / (float)Minimap.Width;
            Pos.y = (float)arg.Y / (float)Minimap.Height;
            if (baseListBox.SelectedIndex == 0)
            {
                if (arg.Button == MouseButtons.Right)
                {
                    Vec2f Default;
                    Default.x = 0.5f;
                    Default.y = 0.5f;
                    BaseInfo newBase = new BaseInfo();
                    newBase.BaseLocation = Pos;
                    newBase.AssaultLocation = Default;
                    newBase.BuildLocation = Default;
                    newBase.ExtractorLocation0 = Default;
                    newBase.ExtractorLocation1 = Default;
                    newBase.RampLocation = Default;
                    newBase.Debris = false;
                    newBase.Island = false;
                    newBase.StartLocation = false;
                    baseList.Add(newBase);
                }
            }
            else
            {
                try
                {
                    BaseInfo curBase = baseList[baseListBox.SelectedIndex - 1];
                    if (baseLocationRadio.Checked) curBase.BaseLocation = Pos;
                    if (assaultLocationRadio.Checked) curBase.AssaultLocation = Pos;
                    if (buildLocationRadio.Checked) curBase.BuildLocation = Pos;
                    if (extractorLocation0Radio.Checked) curBase.ExtractorLocation0 = Pos;
                    if (extractorLocation1Radio.Checked) curBase.ExtractorLocation1 = Pos;
                    if (rampLocationRadio.Checked) curBase.RampLocation = Pos;
                }
                catch
                {

                }
            }
            UpdateAll(true);
        }

        private void baseListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateAll(false);
        }

        private void startLocationCheck_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                BaseInfo curBase = baseList[baseListBox.SelectedIndex - 1];
                curBase.StartLocation = startLocationCheck.Checked;
            }
            catch { }
        }

        private void debrisCheck_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                BaseInfo curBase = baseList[baseListBox.SelectedIndex - 1];
                curBase.Debris = debrisCheck.Checked;
            }
            catch { }
        }

        private void islandCheck_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                BaseInfo curBase = baseList[baseListBox.SelectedIndex - 1];
                curBase.Island = islandCheck.Checked;
            }
            catch { }
        }

        private void deleteBaseButton_Click(object sender, EventArgs e)
        {
            try
            {
                baseList.RemoveAt(baseListBox.SelectedIndex - 1);
                UpdateAll(true);
            }
            catch { }
        }
    }
}
