using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace advertise_mgmt
{
    public partial class tv_channel_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sigin_redirect_action(object sender, EventArgs e)
        {
            Response.Redirect("tv_channel_signin.aspx");
        }
        protected void go_back_action(object sender, EventArgs e)
        {
            Response.Redirect("login_options.aspx");
        }
        protected SqlConnection getCon()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ams_connection"].ConnectionString;
            con.Open();
            return con;
        }
        protected bool is_existing_tv_channel(SqlConnection con, string Email, string Password)
        {
            string command = "SELECT Email From Tv_Channel WHERE Email=@Email and Password=@Password";
            Console.WriteLine("command : " + command);

            using (SqlCommand cmd = new SqlCommand(command, con))
            {
                cmd.Parameters.AddWithValue("@Email", Email);
                cmd.Parameters.AddWithValue("@Password", Password);
                DataTable dt = new DataTable();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt.Load(rdr);
                int rows = dt.Rows.Count;
                return rows > 0;
            }


        }
        protected int get_tv_channel_id(SqlConnection con, string Email, string Password)
        {
            string command = "SELECT Id From Tv_Channel WHERE Email=@Email and Password=@Password";
            Console.WriteLine("command : " + command);

            using (SqlCommand cmd = new SqlCommand(command, con))
            {
                cmd.Parameters.AddWithValue("@Email", Email);
                cmd.Parameters.AddWithValue("@Password", Password);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        return rdr.GetInt32(0);
                    }
                }
                return -1;
            }


        }
        protected void submit_btn_click(object sender, EventArgs e)
        {
            string Email = Email_Id_Input.Text;
            string Password = Password_Input.Text;
            SqlConnection con = getCon();
            try
            {
                using (con)
                {
                    if (is_existing_tv_channel(con, Email, Password))
                    {
                        int Tv_Channel_Id = get_tv_channel_id(con, Email, Password);
                        Response.Write(Tv_Channel_Id);
                        HttpCookie tv_channel_cookie = new HttpCookie("tv_channel_cookie");
                        tv_channel_cookie.Value = Tv_Channel_Id.ToString();
                        tv_channel_cookie.Expires = DateTime.Now.AddDays(1);
                        Response.SetCookie(tv_channel_cookie);
                        Response.Redirect("tv_channel_home.aspx");
                    }
                    else
                    {
                        Response.Write("Invalid Email or Password , Please Enter Wisely");
                    }
                }
            }
            catch (Exception err)
            {
                Response.Write("error : " + err);
            }
        }
    }
}