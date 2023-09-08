using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAn1
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }
        private const int WM_NCLBUTTONDOWN = 0xA1;
        private const int HT_CAPTION = 0x2;

        [System.Runtime.InteropServices.DllImport("user32.dll")]

        private static extern int SendMessage(IntPtr hWnd, int Msg, int wParam, int lParam);

        [System.Runtime.InteropServices.DllImport("user32.dll")]

        private static extern bool ReleaseCapture();
        private void Form1_Load(object sender, EventArgs e)
        {
            System.Drawing.Drawing2D.GraphicsPath path = new System.Drawing.Drawing2D.GraphicsPath();
            int radius = 30; // Adjust the radius to control the corner roundness

            // Define the rounded rectangle
            path.AddArc(0,0,radius,radius,180,90);
            path.AddArc(this.Width - radius,0,radius,radius,270,90);
            path.AddArc(this.Width - radius, this.Height - radius, radius, radius, 0, 90);
            path.AddArc(0,this.Height - radius,radius,radius,90,90);
            // Set the form's region to the rounded shape
            this.Region = new Region(path);
        }

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                ReleaseCapture();
                SendMessage(Handle, WM_NCLBUTTONDOWN, HT_CAPTION, 0);
            }
        }
        private bool CheckLogin(string username, string password)
        {
            // Thực hiện kiểm tra thông tin đăng nhập ở đây
            // Trong ví dụ này, chúng ta giả định thông tin đúng là "admin" và "password123"
            return (username == "admin" && password == "password123");
        }
        private void btnLogin_Click(object sender, EventArgs e)
        {
            // Kiểm tra thông tin đăng nhập ở đây
            bool loginSuccessful = CheckLogin(txbUser.Text, txbPass.Text);

            if (loginSuccessful)
            {
                // Ẩn form đăng nhập
                this.Hide();

                // Tạo và hiển thị form chính
                MainForm mainForm = new MainForm();
                mainForm.ShowDialog();

                // Khi form chính đã đóng, bạn có thể thoát khỏi ứng dụng hoặc hiển thị lại form đăng nhập
                this.Close();
            }
            else
            {
                // Hiển thị thông báo đăng nhập không thành công
                MessageBox.Show("Đăng nhập không thành công. Vui lòng thử lại.");
            }
        }
    }
}
