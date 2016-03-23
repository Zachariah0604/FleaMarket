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
    public partial class Classify : System.Web.UI.Page
    {
        DataSql ClassifyListData = new DataSql();
        protected void Page_Load(object sender, EventArgs e)
        {
            string cid = Request["CommodityType2ID"];
            string ctype = Request["BuySell"];
            SqlConnection conn = new SqlConnection(ClassifyListData.SqlBase);
            conn.Open();
            DataTable dt = new DataTable();
            dt = ClassifyListData.DisPlayList_Ds("select * from T_commodity where BuySell='" + ctype + "' and CommodityType2ID='"+ cid +"' and pass='True' order by ProTime desc", conn);
            DataBuyList.DataSource = dt.DefaultView;
            DataBuyList.DataBind();
        }
        public string ClassifyListTitle(string lcontent)
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