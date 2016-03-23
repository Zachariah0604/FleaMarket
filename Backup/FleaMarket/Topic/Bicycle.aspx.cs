using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace FleaMarket.Topic
{
    public partial class Bicycle : System.Web.UI.Page
    {
        DataSql BicycleData = new DataSql();
        protected SqlConnection conn;
        protected SqlDataAdapter da;
        protected DataSet ds;
        protected SqlCommand comm;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(BicycleData.SqlBase);
            da = new SqlDataAdapter();

            da.SelectCommand = new SqlCommand("select * from T_commodity where title like'%自行车%' or content like '%自行车%' order by ProTime desc", conn);
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
    }
}