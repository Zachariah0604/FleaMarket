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
    public partial class SearchResult : System.Web.UI.Page
    {
        DataSql SearchData = new DataSql();
        protected SqlConnection conn; 
        protected SqlDataAdapter da;
        protected DataSet ds;
        protected SqlCommand comm;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(SearchData.SqlBase);
            da = new SqlDataAdapter();
            string KeyWords = Request["KeyWords"];
            da.SelectCommand = new SqlCommand("select * from T_commodity where (title like'%" + KeyWords + "%' or content like '%" + KeyWords + "%') and pass='True' order by ProTime desc", conn);
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


            this.PageInfo.InnerHtml = PageList.GetPageNum(ds, SearchResultRepeater, 7);
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
    }
}