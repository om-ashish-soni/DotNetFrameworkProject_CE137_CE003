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
    public partial class tv_channel_signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_redirect_action(object sender, EventArgs e)
        {
            Response.Redirect("tv_channel_login.aspx");
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
        protected bool is_existing_news_paper(SqlConnection con, string Email)
        {
            string command = "SELECT Email From Tv_Channel WHERE Email=@Email";
            Console.WriteLine("command : " + command);

            using (SqlCommand cmd = new SqlCommand(command, con))
            {
                cmd.Parameters.AddWithValue("@Email", Email);
                DataTable dt = new DataTable();
                SqlDataReader rdr = cmd.ExecuteReader();
                dt.Load(rdr);
                int rows = dt.Rows.Count;
                return rows > 0;
            }


        }
        protected void submit_btn_click(object sender, EventArgs e)
        {
            //Response.Write(News_Paper_Name_Input.Text);
            //Response.Write(Email_Id_Input.Text);
            //Response.Write(Password_Input.Text);
            string Name = Tv_Channel_Name_Input.Text;
            string Email = Email_Id_Input.Text;
            string Password = Password_Input.Text;
            //Response.Write("signing you up ....<br/>");
            SqlConnection con = getCon();
            try
            {
                using (con)
                {
                    if (is_existing_news_paper(con, Email))
                    {
                        Response.Write("user with this email , already existing , please fill wisely");
                        return;
                    }
                    string command = "INSERT INTO Tv_Channel(Email,Password,Name) VALUES(@Email,@Password,@Name)";
                    using (SqlCommand cmd = new SqlCommand(command, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", Email);
                        cmd.Parameters.AddWithValue("@Password", Password);
                        cmd.Parameters.AddWithValue("@Name", Name);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("tv_channel_home.aspx");
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