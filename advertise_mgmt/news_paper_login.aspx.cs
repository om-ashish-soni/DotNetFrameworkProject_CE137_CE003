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
    public partial class news_paper_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signin_redirect(object sender, EventArgs e)
        {
            Response.Redirect("news_paper_signin.aspx");
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
        protected bool is_existing_news_paper(SqlConnection con, string Email, string Password)
        {
            string command = "SELECT Email From News_Paper WHERE Email=@Email and Password=@Password";
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
        protected int get_news_paper_id(SqlConnection con, string Email, string Password)
        {
            string command = "SELECT Id From News_Paper WHERE Email=@Email and Password=@Password";
            

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
                    if(is_existing_news_paper(con, Email, Password))
                    {
                        int News_Paper_Id = get_news_paper_id(con, Email, Password);
                        Response.Write(News_Paper_Id);
                        HttpCookie news_paper_cookie = new HttpCookie("news_paper_id_cookie");
                        news_paper_cookie.Value = News_Paper_Id.ToString();
                        news_paper_cookie.Expires = DateTime.Now.AddDays(1);
                        Response.SetCookie(news_paper_cookie);
                        Response.Redirect("news_paper_home.aspx");
                    }
                    else
                    {
                        Response.Write("Invalid Email or Password , Please Enter Wisely");
                    }
                }
            }catch(Exception err)
            {
                Response.Write("error : " + err);
            }
        }
    }
}