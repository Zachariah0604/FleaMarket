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
    public partial class hot : System.Web.UI.Page
    {
        DataSql HotData = new DataSql();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(HotData.SqlBase);
            conn.Open();
            DataTable dt = new DataTable();
            dt = HotData.DisPlayList_Ds("select top 10 BuySell,title,commodityID,ClickCount,ProTime from T_commodity order by ClickCount desc", conn);
            hotrepeater.DataSource = dt.DefaultView;
            hotrepeater.DataBind();
        }
        public string Limit(string ValContent)
        {
            string Result_Limit;

            if (ValContent.Length <= 8)
            {

               
                Result_Limit = ValContent;

                return Result_Limit;

            }

            else
            {

                Result_Limit = ValContent.Substring(0, 8);

                return Result_Limit + "..";
            }
        }
    }
}