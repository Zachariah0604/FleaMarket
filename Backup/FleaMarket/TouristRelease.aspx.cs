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
namespace FleaMarket
{
    public partial class TouristRelease : System.Web.UI.Page
    {
        DataSql CommodityData = new DataSql();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                SqlConnection conn = new SqlConnection(CommodityData.SqlBase);
                conn.Open();
                DataTable Fdt = new DataTable();
                Fdt = CommodityData.DisPlayList_Ds("select * from T_commodityType",conn);
                FKind.DataTextField = "TypeName";
                FKind.DataValueField = "CommodityTypeID";
                FKind.DataSource = Fdt.DefaultView;
                FKind.DataBind();
                DataTable Sdt = new DataTable();
                int Fid = int.Parse(FKind.Value);
                Sdt = CommodityData.DisPlayList_Ds("select * from T_commodityType2 where CommodityTypeID='" + Fid + "'", conn);
                SKind.DataTextField = "CommodityType2Name";
                SKind.DataValueField = "CommodityType2ID";
                SKind.DataSource = Sdt.DefaultView;
                SKind.DataBind();
            }
        }

        protected void ReleaseButton_Click(object sender, EventArgs e)
        {
           
            int state;
            string PicPath;
            string RaleaseDate = DateTime.Now.ToString("yyyy-MM-dd");
            string time = TxtTime.Value;
            string CheckFlag;
            string Pic;
            if (Session["code"] != null)
            {
                if (txtCheckCode.Text != Session["code"].ToString())
                    Response.Write("<script language='javascript'>alert('验证码不正确，请重新输入')</script>");
            }
            SqlConnection conn = new SqlConnection(CommodityData.SqlBase);
            conn.Open();
            HttpPostedFile httpup = PicUp.PostedFile;
            if (httpup.ContentLength != 0)
            {
                string PathFileName = httpup.FileName;
                int i = PathFileName.LastIndexOf("\\");
                string filename = PathFileName.Substring(i + 1);
                httpup.SaveAs(Server.MapPath("images/Uploads/" + filename));
                PicPath = "images/Uploads/" + filename;
                Pic = "1";
                CheckFlag = "1";
            }
            else
            {
                PicPath = DBNull.Value.ToString();
                Pic = "0";
                CheckFlag = "0";
            }
            string ReleaseSql = "insert into T_commodity(title,Flag,Email,QQ,IsCommodityPic,ReleaseName,StudetID,Phone,Address,content,BuySell,Price,PicPath,ProTime,ProTimeEnd,CommodityTypeID,CommodityType2ID,pass,CheckCode) values(@title,@Flag,@Email,@QQ,@IsCommodityPic,@ReleaseName,@StudetID,@Phone,@Address,@content,@BuySell,@Price,@PicPath,@ProTime,@ProTimeEnd,@CommodityTypeID,@CommodityType2ID,@pass,@CheckCode)";
            SqlParameter[] paras = new SqlParameter[]
            {
                new SqlParameter("@title",TxtTitle.Value),
                new SqlParameter("@Flag",CheckFlag),
                new SqlParameter("@Email",TxtEmail.Value),
                new SqlParameter("@QQ",TxtQQ.Value),
                new SqlParameter("@IsCommodityPic",Pic),
                new SqlParameter("@ReleaseName",TxtName.Value),
                new SqlParameter("@StudetID",TxtStudentID.Value),
                new SqlParameter("@Phone",TxtPhone.Value),
                new SqlParameter("@Address",TxtAddress.Value),
                new SqlParameter("@content",TxtContent.Value),
                new SqlParameter("@BuySell",BuySell.Value),
                new SqlParameter("@Price",TxtPrice.Value),
                new SqlParameter("@PicPath",PicPath),
                new SqlParameter("@ProTime",RaleaseDate),
                new SqlParameter("@ProTimeEnd",time),
                new SqlParameter("@CommodityTypeID",FKind.Value),
                new SqlParameter("@CommodityType2ID",SKind.Value),
                new SqlParameter("@pass","False"),
                new SqlParameter("@CheckCode",txtCheckCode.Text)
            };
            state = CommodityData.AddInfo(ReleaseSql,conn,paras);
            if (state == 1)
            {
                if(BuySell.Value=="求购"||BuySell.Value=="出售")
                {
                
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", "<script language='javascript'>alert('游客你好，你的发布信息已添加至后台，请等待管理员审核通过');window.location.href='../index.aspx';</script>");
                TxtTitle.Value = "";
                TxtEmail.Value = "";
                TxtName.Value = "";
                TxtPhone.Value = "";
                TxtAddress.Value = "";
                TxtContent.Value = "";
                TxtPrice.Value = "";
                TxtTime.Value = "";
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", "<script language='javascript'>alert('游客你好，你的发布信息发布，返回首页即可查看');window.location.href='../index.aspx';</script>");
                    TxtTitle.Value = "";
                    TxtEmail.Value = "";
                    TxtName.Value = "";
                    TxtPhone.Value = "";
                    TxtAddress.Value = "";
                    TxtContent.Value = "";
                    TxtPrice.Value = "";
                    TxtTime.Value = "";
                }
            }
            else
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", "<script language='javascript'>alert('抱歉，由于未知原因，发布失败.');window.location.reload();</script>");
                
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            this.TxtTitle.Value = "";
            this.TxtEmail.Value = "";
            this.TxtName.Value = "";
            this.TxtPhone.Value = "";
            this.TxtAddress.Value = "";
            this.TxtContent.Value = "";
            this.TxtPrice.Value = "";
            this.TxtTime.Value = "";
        }

       
    }
}