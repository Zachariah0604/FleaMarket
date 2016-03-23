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
    public partial class Admin_Reply : System.Web.UI.Page
    {
        DataSql ReleaseData = new DataSql();
        SqlConnection conn;
        SqlCommand cmd;

        protected SqlDataAdapter da;
        protected DataSet ds;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Manager"] == null)
                {
                    Response.Redirect("Admin_Login.aspx");
                    return;
                }
                else
                {
                    conn = new SqlConnection(ReleaseData.SqlBase);
                    da = new SqlDataAdapter();

                    da.SelectCommand = new SqlCommand("select * from T_Comment left join T_commodity on T_Comment.CommentID = T_commodity.CommodityID", conn);
                    ds = new DataSet();
                    try
                    {
                        conn.Open();
                        da.Fill(ds, "abs");
                        conn.Close();
                    }
                    catch (SqlException e1)
                    {
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", e1.ToString());
                       
                    }


                    this.PageInfo.InnerHtml = PageList.GetPageNum(ds, rptList, 15);
                }

            }
        }
        

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(ReleaseData.SqlBase);
            LinkButton linkButton = (LinkButton)sender;
            string itemId = linkButton.CommandArgument;
            string sql = "delete from T_reply where ReplyID='" + itemId + "'";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", "<script language='javascript'>alert('删除成功.');</script>");
        }



    }
}