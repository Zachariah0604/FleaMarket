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
using System.Security.Cryptography;
using System.Text;

namespace FleaMarket
{
    public partial class index : System.Web.UI.Page
    {
        public string[] Pic=new string[5];
        public string[] PicName = new string[5];
        DataSql PicData = new DataSql();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(PicData.SqlBase);
                conn.Open();
                DataTable dt = PicData.DisPlayList_Ds("select top 5 commodityID,PicPath,ProTime,title from T_commodity where flag='1' and pass='True' order by ProTime desc",conn);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    PicName[i] = dt.Rows[i][3].ToString();
                    Pic[i] = "<div class='box'><a class='imgBorder' href='detail.aspx?commodityID=" + dt.Rows[i][0] + "' target='_blank'><img src='" + dt.Rows[i][1] + "' title='"+ PicName[i] +"' height='178' width='145' border='0'/></a></div>";
                }
            }
        }
        protected void fabu_Click(object sender, EventArgs e)
        {
            HttpCookie cokie = new HttpCookie("User");
            if (Request.Cookies["User"] != null)
            {
                Response.Redirect("UserRelease.aspx");
                
            }
            else
            {
                Response.Redirect("TouristRelease.aspx");
                
            }
        }
        protected void userLoginButton_Click(object sender, EventArgs e)
        {
            DataSql MarketBase = new DataSql();
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            if (txtUserName.Text == "" || txtPassword.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", "<script language='javascript'>alert('请填写完整信息再点击登录');window.location.reload();</script>");
                
                
            }
            else
            {
                try
                {
                    conn.Open();
                    DataTable GetUserInfoDt = new DataTable();
                    string pass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "MD5");
                    GetUserInfoDt = MarketBase.DisPlayList_Ds("select * from T_userinfo where userName='" + txtUserName.Text + "'and userPassword='" + pass + "'", conn);
                    int CheckNum = GetUserInfoDt.Rows.Count;
                    if (CheckNum == 1)
                    {

                        HttpCookie cookie = new HttpCookie("User");
                        DateTime dt = DateTime.Now;
                        TimeSpan ts = new TimeSpan(1, 0, 0, 0, 0);
                        cookie.Expires = dt.Add(ts);
                        cookie.Values.Add("NameUser", GetUserInfoDt.Rows[0]["userName"].ToString());
                        cookie.Values.Add("EmailUser", GetUserInfoDt.Rows[0]["Email"].ToString());
                        cookie.Values.Add("TelUser", GetUserInfoDt.Rows[0]["Tel"].ToString());
                        cookie.Values.Add("studentIdUser", GetUserInfoDt.Rows[0]["studentID"].ToString());
                        cookie.Values.Add("QQUser", GetUserInfoDt.Rows[0]["QQ"].ToString());

                        Response.AppendCookie(cookie);

                        Response.Write("<script language='javascript'>alert('登录成功，您的登录信息有效期为24小时');window.location.href='OperationSuccess.html';</script>");
                       
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", "<script language='javascript'>alert('登录失败!有疑问请与新闻网联系!')</script>");
                       
                    }
                }
                catch (SqlException err)
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message","<script language='javascript'>alert('" + err.Message + "')</script>");
                }
            }
        }

        protected void userRegButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("user/UserReg.aspx");
        }
    }
}