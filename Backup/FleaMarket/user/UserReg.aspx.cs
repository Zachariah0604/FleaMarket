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



namespace FleaMarket.user
{
    public partial class UserReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //public string MD5(string encryptString)
        //{
        //    byte[] result = Encoding.Default.GetBytes(encryptString);
        //    MD5 md5 = new MD5CryptoServiceProvider();
        //    byte[] output = md5.ComputeHash(result);
        //    string encryptResult = BitConverter.ToString(output).Replace("-", "");
        //    return encryptResult;

        //}

        protected void RegButton_Click(object sender, EventArgs e)
        {
            DataSql RegData = new DataSql();
            int State;
            string time;
            if (TxtName.Value == "" || TxtPassword.Value == "")
            {
                Response.Write("<script language='javascript'>alert('用户名或密码未填')</script>");
               
            }
            if (TxtPassword.Value != TxtConfirmPassword.Value)
                Response.Write("<script language='javascript'>alert('两次密码不一致')</script>");
            SqlConnection conn = new SqlConnection(RegData.SqlBase);
            try
            {
                conn.Open();
                if (RegData.DisPlayList_Ds("select * from T_userinfo where userName='" + TxtName.Value + "'", conn).Rows.Count != 0)
                    Response.Write("<script language='javascript'>alert('用户名已被使用')</script>");
                else if (RegData.DisPlayList_Ds("select * from T_userinfo where Email='" + TxtEMail.Value + "'", conn).Rows.Count != 0)
                    Response.Write("<script language='javascript'>alert('邮箱已被使用')</script>");
                else if (Session["code"] != null)
                {
                    if(txtCheckCode.Text!=Session["code"].ToString())
                        Response.Write("<script language='javascript'>alert('验证码不正确，请重新输入')</script>");
                }
                else
                {
                    conn.Open();
                    time = DateTime.Now.ToString("yyyy-MM-dd");
                    string password = FormsAuthentication.HashPasswordForStoringInConfigFile(TxtPassword.Value, "MD5");
                    string connString="insert into T_userinfo(userName,userPassword,regTime,Sex,studentID,QQ,Email,Tel,CheckCode)values(@userName,@userPassword,@regTime,@Sex,@studentID,@QQ,@Email,@Tel,@CheckCode)";
                    SqlParameter[] paras = new SqlParameter[]
                    {
                        new SqlParameter("@userName",TxtName.Value),
                        new SqlParameter("@userPassword",password),
                        new SqlParameter("@regTime",time),
                        new SqlParameter("@Sex",Sex.Value),
                        new SqlParameter("@studentID",TxtNumber.Value),
                        new SqlParameter("@QQ",TxtQQ.Value),
                        new SqlParameter("@Email",TxtEMail.Value),
                        new SqlParameter("@Tel",TxtPhone.Value),
                        new SqlParameter("@CheckCode",txtCheckCode.Text)
                    };
                    
                    //string connString = "insert into T_userinfo(userName,userPassword,regTime,Sex,studentID,QQ,Email,Tel,CheckCode)values('" + TxtName.Value + "','" + password + "','" + time + "','" + Sex.Value + "','" + TxtNumber.Value + "','" + TxtQQ.Value + "','" + TxtEMail.Value + "','" + TxtPhone.Value + "','"+ txtCheckCode.Text +"')";
                    State = RegData.AddInfo(connString, conn,paras);
                    if (State == 1)
                    {

                        Response.Redirect("../OperationSuccess.html");
                        
                    }
                    else
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript'>alert('由于未知原因，注册失败，请重试。');</script>");
                        
                }
            }
            catch (SqlException err)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript'>alert('抱歉，程序错误');window.location.reload();</script>");
                
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            this.TxtName.Value = "";
            this.TxtPassword.Value = "";
            this.TxtPhone.Value = "";
            this.TxtQQ.Value = "";
            this.TxtNumber.Value = "";
            this.TxtEMail.Value = "";
            this.TxtConfirmPassword.Value = "";
            
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../index.aspx");
        }

       
    }
}