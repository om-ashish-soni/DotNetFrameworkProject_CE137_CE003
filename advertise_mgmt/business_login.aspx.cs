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
    public partial class business_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }      
        protected void signin_redirect_action(object sender, EventArgs e)
        {
            Response.Redirect("business_signin.aspx");
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
            string command = "SELECT Email From Business WHERE Email=@Email and Password=@Password";
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
        protected int get_business_id(SqlConnection con, string Email, string Password)
        {
            string command = "SELECT Id From Business WHERE Email=@Email and Password=@Password";
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
            //Response.Write("Logging you in ....<br/>");
            SqlConnection con = getCon();
            try
            {
                using (con)
                {
                    if (is_existing_news_paper(con, Email, Password))
                    {
                        int business_id = get_business_id(con, Email, Password);
                        Response.Write("id : ");
                        Response.Write(business_id);
                        HttpCookie business_id_cookie = new HttpCookie("business_id_cookie");
                        business_id_cookie.Value = business_id.ToString();
                        business_id_cookie.Expires=DateTime.Now.AddDays(1);
                        Response.SetCookie(business_id_cookie);
                        Response.Redirect("business_home.aspx");
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