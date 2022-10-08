using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace advertise_mgmt
{
    public partial class news_paper_signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_redirect_action(object sender, EventArgs e)
        {
            Response.Redirect("news_paper_login.aspx");
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
        protected bool is_existing_news_paper(SqlConnection con,string Name,string Email,string Password)
        {
            string command = "SELECT Email From News_Paper WHERE Email=@Email";
            Console.WriteLine("command : " + command);
            
            using(SqlCommand cmd=new SqlCommand(command, con))
            {
                cmd.Parameters.AddWithValue("@Email", Email);
                DataTable dt = new DataTable();
                SqlDataReader rdr= cmd.ExecuteReader();
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
            
            string Name = News_Paper_Name_Input.Text;
            string Email = Email_Id_Input.Text;
            string Password = Password_Input.Text;
            SqlConnection con= getCon();
            try
            {
                using (con)
                {
                    if (is_existing_news_paper(con, Name, Email, Password))
                    {
                        Response.Write("user with this email , already existing , please fill wisely");
                        return;
                    }
                    string command = "INSERT INTO News_Paper(Email,Password,Name) VALUES(@Email,@Password,@Name)";
                    using (SqlCommand cmd = new SqlCommand(command, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", Email);
                        cmd.Parameters.AddWithValue("@Password",Password);
                        cmd.Parameters.AddWithValue("@Name", Name);
                        cmd.ExecuteNonQuery();
                        int News_Paper_Id = get_news_paper_id(con, Email, Password);
                        HttpCookie news_paper_cookie = new HttpCookie("news_paper_id_cookie");
                        news_paper_cookie.Value = News_Paper_Id.ToString();
                        news_paper_cookie.Expires = DateTime.Now.AddDays(1);
                        Response.SetCookie(news_paper_cookie);
                        Response.Redirect("news_paper_home.aspx");
                    }
                    

                }
            }
            catch (Exception err)
            {
                Response.Write("error : "+ err);
            }
            
        }
    }
}