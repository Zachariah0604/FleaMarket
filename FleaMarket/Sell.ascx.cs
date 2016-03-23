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
    public partial class Sell : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSql SellData = new DataSql();
            SqlConnection conn = new SqlConnection(SellData.SqlBase);
            conn.Open();
            DataTable dt = new DataTable();
            dt = SellData.DisPlayList_Ds("select top 7 title,commodityID,ProTime from T_commodity where BuySell='出售' and pass='True' order by ProTime desc", conn);
            SellDataList.DataSource = dt.DefaultView;
            SellDataList.DataBind();
        }
        public string FSell(string lcontent)
        {
            string sellcontent;
            
            if (lcontent.Length <= 12)
            {


                sellcontent = lcontent;

                return sellcontent;

            }

            else
            {

                sellcontent = lcontent.Substring(0, 7);

                return sellcontent + "..";
            }

        }
    }
}