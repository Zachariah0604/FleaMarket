using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace FleaMarket.admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        DataSql AdminLoginData=new DataSql();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBt_Click(object sender, ImageClickEventArgs e)
        {
            string loginsql = "select * from T_manage where adminName='" + AdminNameTxt.Text.Trim() + "' and adminPassword='"+ AdminPwdTxt.Text.Trim()+"'";
            DataRow DR = AdminLoginData.GetDataRow(loginsql);
            if (DR == null)
            {
                Response.Write("<script language='javascript'>alert('密码错误或用户不存在')</script>");

            }
            else
            {
                Session["Manager"] = AdminNameTxt.Text.Trim();

                Response.Redirect("AdminIndex.html?Manager=" + AdminNameTxt.Text);
            }
        }
        protected void forget_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript'>aalert('你真的忘记密码了？');alert('你确定你没有骗我？');alert('好吧，那我就告诉你该怎么办');alert('找程序部吧');</script>");
          
        }
    }
}