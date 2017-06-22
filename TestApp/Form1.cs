using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TestApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

      

        private void button1_Click_1(object sender, EventArgs e)
        {
            var migrationsWrapper = new MigrationsWrapper(
                @"Server=.\SQLEXPRESS;Database=test1;Integrated Security=True;Connection Timeout=30;"
                , (s) =>
                {
                    richTextBox1.Text = ((richTextBox1.Text ?? "") + s);
                });
            migrationsWrapper.MigrateToLatestVersion();
        }
    }
}
