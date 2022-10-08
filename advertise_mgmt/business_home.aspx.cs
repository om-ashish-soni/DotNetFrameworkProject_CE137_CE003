using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace advertise_mgmt
{
    public partial class business_home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Request.Cookies["business_id_cookie"] == null)
            {
                Response.Redirect("business_login.aspx");
            }
        }

        protected void show_news_paper_add_create_action(object sender, EventArgs e)
        {
            news_paper_advertise_panel_form.Visible = true;
            tv_channel_advertise_panel_form.Visible = false;
        }

        protected void show_tv_channel_advertice_action(object sender, EventArgs e)
        {
            news_paper_advertise_panel_form.Visible = false;
            tv_channel_advertise_panel_form.Visible = true;
        }
        protected SqlConnection getCon()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ams_connection"].ConnectionString;
            con.Open();
            return con;
        }
        protected int get_news_paper_id(SqlConnection con, string Email)
        {
            string command = "SELECT Id From News_Paper WHERE Email=@Email";
            Console.WriteLine("command : " + command);

            using (SqlCommand cmd = new SqlCommand(command, con))
            {
                cmd.Parameters.AddWithValue("@Email", Email);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        int id= rdr.GetInt32(0);
                        rdr.Close();
                        return id;
                    }
                }
                return -1;
            }


        }
        protected int get_tv_channel_id(SqlConnection con, string Email)
        {
            string command = "SELECT Id From Tv_Channel WHERE Email=@Email";
            Console.WriteLine("command : " + command);

            using (SqlCommand cmd = new SqlCommand(command, con))
            {
                cmd.Parameters.AddWithValue("@Email", Email);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        int id = rdr.GetInt32(0);
                        rdr.Close();
                        return id;
                    }
                }
                return -1;
            }


        }
        protected string get_business_name(SqlConnection con, string id)
        {

            string command = "SELECT Name From Business WHERE Id=@id";
            Console.WriteLine("command : " + command);

            using (SqlCommand cmd = new SqlCommand(command, con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        string name = rdr.GetString(0);
                        rdr.Close();
                        return name;
                    }
                }
                return "-1";
            }
        }
        protected void create_news_advertise_submit_btn_click(object sender, EventArgs e)
        {
            if(news_paper_inp.SelectedItem == null)
            {
                Response.Write("Please select News Paper");
                return;
            }
            string name = news_advertise_name_inp.Text;
            
            string source = image_source_url_inp.Text;
            string date = news_paper_display_date_inp.Text;
            string business_id = Request.Cookies["business_id_cookie"].Value;
            
            string Add_Type = Add_Type_inp.SelectedItem.Value;
          
            SqlConnection con = getCon();
            try
            {
                using (con)
                {
                    string Business_Name = get_business_name(con, business_id);
                    
                    
                    string news_paper_id = news_paper_inp.SelectedItem.Value;
                    string news_paper = news_paper_inp.SelectedItem.Text;
                    
                    if (true)
                    {
                        string command = "INSERT INTO News_Paper_Advertise(Name,Business_Id,Business_Name,News_Paper_Id,News_Paper,Source,Add_Type,Date) VALUES(@Name,@Business_Id,@Business_Name,@News_Paper_Id,@News_Paper,@Source,@Add_Type,@Date)";
                        using (SqlCommand cmd = new SqlCommand(command, con))
                        {
                            cmd.Parameters.AddWithValue("@Name", name);
                            cmd.Parameters.AddWithValue("@Business_Id", business_id);
                            cmd.Parameters.AddWithValue("@Business_Name", Business_Name);
                            cmd.Parameters.AddWithValue("@News_Paper_Id", news_paper_id);
                            cmd.Parameters.AddWithValue("@News_Paper", news_paper);
                            cmd.Parameters.AddWithValue("@Source", source);
                            cmd.Parameters.AddWithValue("@Add_Type", Add_Type);
                            cmd.Parameters.AddWithValue("@Date", date);


                            cmd.ExecuteNonQuery();
                            
                        }
                        
                        news_paper_advertise_panel_form.Visible = false;
                        Response.Write("<br>Applied for News Paper Advertise successfully");
                        pending_news_paper_advertise_grid.DataBind();
                    }
                    else
                    {
                        Response.Write("Invalid News Paper Email , Please Enter Wisely");
                    }
                }
            }
            catch (Exception err)
            {
                Response.Write("error : " + err);
            }
        }

        protected void create_tv_channel_advertise_submit_btn_click(object sender, EventArgs e)
        {
            if(tv_channel_inp.SelectedItem == null)
            {
                Response.Write("Please select a Tv Channel");
                return;
            }
            string name = tv_channel_advertise_name_inp.Text;
            string source = media_source_url_inp.Text;
            string date = tv_channel_advertise_display_date_inp.Text;
            string business_id = Request.Cookies["business_id_cookie"].Value;
            string display_frequency = display_frequency_inp.Text;
            SqlConnection con = getCon();
            try
            {
                using (con)
                {
                    string Business_Name = get_business_name(con, business_id);
                    string tv_channel_id = tv_channel_inp.SelectedItem.Value;
                    string tv_channel = tv_channel_inp.SelectedItem.Text;
                    if (true)
                    {
                        
                        string command = "INSERT INTO Tv_Channel_Advertise(Name,Business_Id,Business_Name,Tv_Channel_Id,Tv_Channel,Source,Frequency,Date) VALUES(@Name,@Business_Id,@Business_Name,@Tv_Channel_Id,@Tv_Channel,@Source,@Frequency,@Date)";
                        using (SqlCommand cmd = new SqlCommand(command, con))
                        {
                            cmd.Parameters.AddWithValue("@Name", name);
                            cmd.Parameters.AddWithValue("@Business_Id", business_id);
                            cmd.Parameters.AddWithValue("@Business_Name", Business_Name);
                            cmd.Parameters.AddWithValue("@Tv_Channel_Id", tv_channel_id);
                            cmd.Parameters.AddWithValue("@Tv_Channel", tv_channel);
                            cmd.Parameters.AddWithValue("@Source", source);
                            cmd.Parameters.AddWithValue("@Frequency", display_frequency);
                            cmd.Parameters.AddWithValue("@Date", date);


                            cmd.ExecuteNonQuery();
                            
                        }
                        
                        tv_channel_advertise_panel_form.Visible = false;
                        Response.Write("<br>Applied for Tv Channel Advertise successfully");
                        pending_tv_channel_advertise_grid.DataBind();
                    }
                    else
                    {
                        Response.Write("Invalid Tv Channel Email , Please Enter Wisely");
                    }
                }
            }
            catch (Exception err)
            {
                Response.Write("error : " + err);
            }
        }


        protected void logout_btn_click(object sender, EventArgs e)
        {
            Response.Write("clicked logout");
            Response.Cookies["business_id_cookie"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("login_options.aspx");
        }
    }
}