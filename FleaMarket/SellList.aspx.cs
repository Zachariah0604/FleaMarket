using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

namespace FleaMarket
{
    public partial class SellList : System.Web.UI.Page
    {
        DataSql SellListData = new DataSql();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(SellListData.SqlBase);
            conn.Open();
            DataTable dt = new DataTable();
            dt = SellListData.DisPlayList_Ds("select * from T_commodity where BuySell='出售' and pass='True' order by ProTime desc", conn);
            DataSellList.DataSource = dt.DefaultView;
            DataSellList.DataBind();
        }
        public string SellListTitle(string lcontent)
        {
            string buycontent;

            if (lcontent.Length <= 9)
            {


                buycontent = lcontent;

                return buycontent;

            }

            else
            {

                buycontent = lcontent.Substring(0, 8);

                return buycontent + "..";
            }

        }
    }
}