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
    public partial class Lost : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSql LostData = new DataSql();
            SqlConnection conn = new SqlConnection(LostData.SqlBase);
            conn.Open();
            DataTable dt = new DataTable();
            dt = LostData.DisPlayList_Ds("select top 7 title,commodityID,BuySell,ProTime from T_commodity where BuySell='失物招领' or BuySell='寻物启事' order by ProTime desc", conn);
            LostDataList.DataSource = dt.DefaultView;
            LostDataList.DataBind();
        }
        public string FLost(string lcontent)
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