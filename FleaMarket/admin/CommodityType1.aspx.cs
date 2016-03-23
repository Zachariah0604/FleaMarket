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
    public partial class CommodityType1 : System.Web.UI.Page
    {
        DataSql TypeData = new DataSql();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Manager"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
                return;
            }
            else
            {
                SqlConnection conn = new SqlConnection(TypeData.SqlBase);
                conn.Open();
                DataTable dt = new DataTable();
                dt = TypeData.DisPlayList_Ds("select * from T_CommodityType left join T_commodityType2 on T_CommodityType.CommodityTypeID=T_commodityType2.CommodityTypeID", conn);
                repeaterty.DataSource = dt.DefaultView;
                repeaterty.DataBind();
            }
        }

        protected void TypeButton_Click(object sender, EventArgs e)
        {
            int state;
            SqlConnection conn = new SqlConnection(TypeData.SqlBase);
            conn.Open();
            if (TypeData.DisPlayList_Ds("select * from T_CommodityType where TypeName='" + Type1.Text + "'", conn).Rows.Count != 0)
                Response.Write("<script language='javascript'>alert('此一级分类已存在，请不要重复添加')</script>");
            else
            {
                conn.Open();
                string str = "insert into T_CommodityType(TypeName) values (@tname)";
                SqlParameter[] paras = new SqlParameter[]
                {
                    new SqlParameter("@tname",Type1.Text)
                };
                state = TypeData.AddInfo(str, conn,paras);
                if (state == 1)
                {
                    Response.Write("<script language='javascript'>alert('添加成功')</script>");
                }
                else
                    Response.Write("<script language='javascript'>alert('添加失败')</script>");
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand cmd;
            conn = new SqlConnection(TypeData.SqlBase);
            LinkButton linkButton = (LinkButton)sender;
            string itemId = linkButton.CommandArgument;
            string sql = "delete from T_commodityType2 where CommodityType2ID='" + itemId + "'";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", "<script language='javascript'>alert('删除成功.');</script>");

        }
    }
}