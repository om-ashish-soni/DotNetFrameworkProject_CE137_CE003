using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace advertise_mgmt
{
    public partial class login_options : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            string user_type = user_type_list.SelectedItem.Value;
            if(user_type== "TV_Channel_Btn")
            {
                Response.Redirect("tv_channel_login.aspx");
            }else if(user_type == "News_Paper_Btn")
            {
                Response.Redirect("news_paper_login.aspx");
            }else if(user_type== "Business_Btn")
            {
                Response.Redirect("business_login.aspx");
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}