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
    public partial class head : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cokie = new HttpCookie("User");

            if (Request.Cookies["User"] != null)
            {
                string name = Request.Cookies["User"].Values["NameUser"].ToString();

                NameLabel.Text = "欢迎您!&nbsp;" + name;
                text.Visible = false;
                Info.Visible = true;
                
            }
            else
            {
                text.Visible = true;
                Info.Visible = false;
                
            }
        }
        protected void UserCollect_Click(object sender, EventArgs e)
        {
            Response.Redirect("user/UserCollect.aspx");
        }
        protected void ReleaseAlready_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user/ReleaseAlready.aspx");
        }


        protected void Quit_Click(object sender, EventArgs e)
        {
            HttpCookie cok = Request.Cookies["User"];
            if (cok != null)
            {
                
               TimeSpan ts = new TimeSpan(-1, 0, 0, 0);
               cok.Expires = DateTime.Now.Add(ts);//删除整个Cookie，只要把过期时间设置为现在
                
                Response.AppendCookie(cok);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", "<script language='javascript'>alert('你已成功退出，现以游客身份浏览');window.location.href='index.aspx';</script>");
            }

        }
        protected void fabu_Click(object sender, EventArgs e)
        {

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
                Response.Write("<script language='javascript'>alert('请填写完整信息再点击登录')</script>");
                
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
                        cookie.Values.Add("IdUser", GetUserInfoDt.Rows[0]["userID"].ToString());
                        cookie.Values.Add("NameUser", GetUserInfoDt.Rows[0]["userName"].ToString());
                        cookie.Values.Add("EmailUser", GetUserInfoDt.Rows[0]["Email"].ToString());
                        cookie.Values.Add("TelUser", GetUserInfoDt.Rows[0]["Tel"].ToString());
                        cookie.Values.Add("studentIdUser", GetUserInfoDt.Rows[0]["studentID"].ToString());
                        cookie.Values.Add("QQUser", GetUserInfoDt.Rows[0]["QQ"].ToString());
                       
                        Response.AppendCookie(cookie);

                        //Response.Write("<script language='javascript'>alert('登录成功，您的登录信息有效期为24小时');parent.document.location.reload();</script>");
                        Response.Write("<script language='javascript'>alert('登录成功，您的登录信息有效期为24小时');window.location.href='OperationSuccess.html';</script>");
                        
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", "<script language='javascript'>alert('登录失败!有疑问请与新闻网联系!');window.location.href='../index.aspx';</script>");
                        
                    }
                }
                catch (SqlException err)
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", "<script language='javascript'>alert('程序错误')</script>");
                }
            }
        }

        protected void userRegButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("user/UserReg.aspx");
        }
    }

}