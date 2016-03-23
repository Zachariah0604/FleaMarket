using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

namespace FleaMarket.admin
{
    public partial class adminDetail : System.Web.UI.Page
    {
        DataSql CommodityDetail = new DataSql();
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["commodityID"];
            conn = new SqlConnection(CommodityDetail.SqlBase);
            conn.Open();
            


            DataTable dt = new DataTable();
            dt = CommodityDetail.DisPlayList_Ds("select * from T_commodity where commodityID='" + id + "'", conn);
            CommodityDetail11.DataSource = dt.DefaultView;
            CommodityDetail11.DataBind();


        }
    }
}