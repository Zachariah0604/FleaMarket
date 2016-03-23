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

using System.IO;


namespace FleaMarket
{
    public partial class DetailPic : System.Web.UI.Page
    {
        

        DataTable DtPic = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            string PicId;
            
            PicId = Request["Picid"];
            if (!IsPostBack)
            {

                DataSql DataPic = new DataSql();

                SqlConnection conn = new SqlConnection(DataPic.SqlBase);
                try
                {
                    conn.Open();

                    

                    DtPic = DataPic.DisPlayList_Ds("select PicPath from T_commodity where commodityID='" + PicId + "'", conn);

                   

                    if (DtPic.Rows[0]["PicPath"].ToString() == null || DtPic.Rows[0]["PicPath"].ToString() == "")
                    {
                        PicCommodity.Src = "images/Uploads/111111.gif";
                        
                       
                        
                    }
                    else
                    {
                        PicCommodity.Src = DtPic.Rows[0]["PicPath"].ToString();
                    }
                }

                catch (SqlException err)
                {

                    Response.Write("<script language='javascript'>alert('" + err.Message + "')</script>");
                }

            }

        }
    }

}