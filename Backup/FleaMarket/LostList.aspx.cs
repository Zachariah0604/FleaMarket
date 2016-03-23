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
    public partial class LostList : System.Web.UI.Page
    {
        DataSql LostListData = new DataSql();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(LostListData.SqlBase);
            conn.Open();
            DataTable dt = new DataTable();
            dt = LostListData.DisPlayList_Ds("select * from T_commodity where BuySell='失物招领' or BuySell='寻物启事' order by ProTime desc", conn);
            DataLostList.DataSource = dt.DefaultView;
            DataLostList.DataBind();
        }
        public string LostListTitle(string lcontent)
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