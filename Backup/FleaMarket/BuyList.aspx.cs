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
    public partial class BuyList : System.Web.UI.Page
    {
       
        DataSql BuyListData = new DataSql();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(BuyListData.SqlBase);
            conn.Open();
            DataTable dt = new DataTable();
            dt = BuyListData.DisPlayList_Ds("select * from T_commodity where BuySell='求购' and pass='True' order by ProTime desc", conn);
            DataBuyList.DataSource = dt.DefaultView;
            DataBuyList.DataBind();
        }
        public string BuyListTitle(string lcontent)
        {
            string buycontent;

            if (lcontent.Length <= 8)
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