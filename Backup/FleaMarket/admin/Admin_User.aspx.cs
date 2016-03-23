using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace FleaMarket.admin
{
    public partial class Admin_User : System.Web.UI.Page
    {
        DataSql UserData = new DataSql();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Manager"] == null)
                {
                    Response.Redirect("Admin_Login.aspx");
                    return;
                }
                DataTable dt = new DataTable();
                dt = UserData.GetDataTable("select * from T_userInfo order by regTime desc");
                GridView1.DataSource = dt.DefaultView;
                GridView1.DataBind();
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int num = e.RowIndex;
            string userid = GridView1.Rows[num].Cells[0].Text.ToString();
            DataTable dt = new DataTable();
            int result = UserData.ExecuteSQL("delete from T_userInfo where userID='" + userid + "'");
            dt = UserData.GetDataTable("select * from T_userInfo order by regTime desc");
            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();
            if (result == 1)
                Response.Write("<script language='javascript'>alert('删除成功!')</script>");
            else
                Response.Write("<script language='javascript'>alert('删除失败!')</script>");

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DataTable dt = new DataTable();
            dt = UserData.GetDataTable("select * from T_userInfo order by regTime desc");
            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();
        }
    }
}