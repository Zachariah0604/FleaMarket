using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FleaMarket.admin
{
    public partial class menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Manager"] != null)

                Label1.Text = Request.QueryString["Manager"];
            if (Page.Request.Params["action"] == "loginout")
            {
                Session["Manager"] = "";
                Session.Abandon();
                Response.Write("<script>alert('已成功退出');window.location.href='Admin_Login.aspx';</script>");
            }
        }
    }
}