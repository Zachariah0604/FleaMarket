using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace FleaMarket
{
    public partial class Buy : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSql BuyData = new DataSql();
            SqlConnection conn = new SqlConnection(BuyData.SqlBase);
            conn.Open();
            DataTable dt = new DataTable();
            dt = BuyData.DisPlayList_Ds("select top 7 title,commodityID,ProTime from T_commodity where BuySell='求购' and pass='True' order by ProTime desc", conn);
            BuyDataList.DataSource = dt.DefaultView;
            BuyDataList.DataBind();
        }
        public string FBuy(string lcontent)
        {
            string buycontent;

            if (lcontent.Length <= 12)
            {


                buycontent = lcontent;

                return buycontent;

            }

            else
            {

                buycontent = lcontent.Substring(0, 7);

                return buycontent + "..";
            }

        }
    }
}