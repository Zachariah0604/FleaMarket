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


namespace FleaMarket
{
    public partial class Detail : System.Web.UI.Page
    {
        DataSql CommodityDetail = new DataSql();
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["commodityID"];
            Session["reply"] = reply;
            
            conn = new SqlConnection(CommodityDetail.SqlBase);
            conn.Open();
            if (!IsPostBack)
            {
                int state = CommodityDetail.ModInfo("update T_commodity set ClickCount=ClickCount+1 where commodityID='" + id + "'", conn);
               
            }
            

            DataTable dt = new DataTable();
            dt = CommodityDetail.DisPlayList_Ds("select * from T_commodity where commodityID='" + id + "'", conn);
            CommodityDetail11.DataSource = dt.DefaultView;
            CommodityDetail11.DataBind();

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("select * from T_Comment where CommentID='" + id + "'", conn);
            da.Fill(ds);
            reply.DataSource = ds.Tables[0].DefaultView;
            reply.DataBind();
        }
        public string Checked(string path)
        {
            string Result;
            if (path == null || path == "")
                Result = "images/Uploads/111111.gif";
            else
                Result = path;
            
            return Result;
        }
        protected void Collect_Click(object sender, EventArgs e)
        {

            HttpCookie cokie = new HttpCookie("User");

            if (Request.Cookies["User"] == null)
            {

                Page.ClientScript.RegisterStartupScript(Page.GetType(),"message","<script language='javascript'>alert('对不起，您是游客，不能收藏。请登录或注册后使用本功能')</script>");
            }
            else
            {
                string uid = Request.Cookies["User"].Values["IdUser"].ToString();
                string id = Request["commodityID"];
                conn = new SqlConnection(CommodityDetail.SqlBase);
                SqlCommand cmd;
                string sql = "insert into T_collect (userID,commodityID,IsCollect) values('" + uid + "','" + id + "','True')";
                conn.Open();
                cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript'>alert('收藏成功，您可在个人收藏里查看')</script>");
            }
        }
    }
}