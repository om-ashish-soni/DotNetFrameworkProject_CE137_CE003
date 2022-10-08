using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace advertise_mgmt
{
    public partial class tv_channel_home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["tv_channel_cookie"] == null)
            {
                Response.Redirect("tv_channel_login.aspx");
            }
            
            
        }

        protected void GridView4_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            GridView3.DataBind();
        }
        protected void logout_btn_click(object sender, EventArgs e)
        {
            Response.Write("clicked logout");
            Response.Cookies["tv_channel_cookie"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("login_options.aspx");
        }
    }
}