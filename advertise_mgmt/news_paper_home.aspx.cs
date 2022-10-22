using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace advertise_mgmt
{
    public partial class News_Paper_Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["news_paper_id_cookie"] == null)
            {
                
                Response.Redirect("news_paper_login.aspx");
            }
           
        }
        protected void GridView3_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            GridView4.DataBind();
        }
        protected void logout_btn_click(object sender, EventArgs e)
        {
            Response.Write("clicked logout");
            Response.Cookies["news_paper_id_cookie"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("login_options.aspx");
        }

        
    }
}