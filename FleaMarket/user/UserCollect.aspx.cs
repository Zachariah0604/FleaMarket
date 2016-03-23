using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace FleaMarket.user
{
    public partial class UserCollect : System.Web.UI.Page
    {
        DataSql SearchData = new DataSql();
        HttpCookie cokie = new HttpCookie("User");
        protected SqlConnection conn;
        protected SqlDataAdapter da;
        protected DataSet ds;
        protected SqlCommand comm;
        protected void Page_Load(object sender, EventArgs e)
        {
            string uid = Request.Cookies["User"].Values["IdUser"];
            conn = new SqlConnection(SearchData.SqlBase);
            da = new SqlDataAdapter();

            da.SelectCommand = new SqlCommand("select * from T_commodity join T_collect on T_commodity.commodityID=T_collect.commodityID where T_collect.IsCollect='True' and T_collect.userID='"+ uid +"' order by ProTime desc", conn);
            ds = new DataSet();
            try
            {
                conn.Open();
                da.Fill(ds, "abs");
                conn.Close();
            }
            catch (SqlException e1)
            {
                Response.Write(e1.ToString());
            }


            this.PageInfo.InnerHtml = PageList.GetPageNum(ds, ReleaseAlreadyRepeater, 7);
        }
        public string Limit(string lcontent)
        {
            string buycontent;

            if (lcontent.Length <= 60)
            {


                buycontent = lcontent;

                return buycontent;

            }

            else
            {

                buycontent = lcontent.Substring(0, 60);

                return buycontent + "..";
            }

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(SearchData.SqlBase);
            LinkButton linkButton = (LinkButton)sender;
            string itemId = linkButton.CommandArgument;
            string sql = "delete from T_collect where commodityID='" + itemId + "'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('已取消收藏');window.location.href='UserCollect.aspx'</script>");

        }
    }
}