using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Xml;

namespace FleaMarket.user
{
    public partial class ajax : System.Web.UI.Page
    {
        DataSql AjaxData = new DataSql();
        protected void Page_Load(object sender, EventArgs e)
        {
            string xmltext = "<seconds>";
            string first = Request["first"];
            SqlConnection conn = new SqlConnection(AjaxData.SqlBase);
            conn.Open();
            DataTable dt = new DataTable();

            dt = AjaxData.DisPlayList_Ds("select CommodityType2Name from T_commodityType2 where CommodityTypeID='" + first + "'", conn);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                xmltext += "<second>";
                xmltext += dt.Rows[i][0].ToString();
                xmltext += "</second>";
            }
            xmltext += "</seconds>";
            Response.ContentType = "text/xml";
            Response.Write(xmltext);


        }
    }
}