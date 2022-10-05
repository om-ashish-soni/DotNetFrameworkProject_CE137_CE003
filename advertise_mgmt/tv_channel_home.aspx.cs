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
                Response.Write("is null");
                //Response.Redirect("tv_channel_login.aspx");
            }
            else
            {
                string tv_channel_id = Request.Cookies["tv_channel_cookie"].Value;
                Response.Write(tv_channel_id);
            }
            
        }

        protected void GridView4_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            GridView3.DataBind();
        }
    }
}