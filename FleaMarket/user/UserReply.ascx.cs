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

namespace FleaMarket.user
{
    
    public partial class UserReply : System.Web.UI.UserControl
    {
        string cid;
        int Flag;
        public string Content;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cokie = new HttpCookie("User");
            if (Request.Cookies["User"] != null)
            {
                string name = Request.Cookies["User"].Values["NameUser"].ToString();
                TxtNiCheng.Text = name;
            }
            
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {

            Repeater reply = (Repeater)Session["reply"];
            DataSql ReplyData = new DataSql();
            cid = Request["commodityID"];
            Content = TxtContent.Value.ToString();
            if (TxtNiCheng.Text == "")
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript'>alert('请填写昵称');window.location.reload();</script>");
            else if (Session["code"] != null)
            {
                if (txtCheckCode.Text != Session["code"].ToString())
                    Response.Write("<script language='javascript'>alert('验证码不正确，请重新输入')</script>");
            }
            else
            {
                SqlConnection conn = new SqlConnection(ReplyData.SqlBase);
                try
                {
                    conn.Open();
                    string replytime = DateTime.Now.ToString("yyyy-MM-dd");
                    string sql="insert into T_Comment(NiCheng,CContent,SendTime,CommentID,CheckCode) values(@NiCheng,@CContent,@SendTime,@CommentID,@CheckCode)";
                    SqlParameter[] paras =new SqlParameter[]
                    {
                        new SqlParameter("@NiCheng",TxtNiCheng.Text),
                        new SqlParameter("@CContent",TxtContent.Value),
                        new SqlParameter("@SendTime",replytime),
                        new SqlParameter("@CommentID",cid),
                        new SqlParameter("@CheckCode",txtCheckCode.Text)
                    };
                    //Flag = ReplyData.AddInfo("insert into T_Comment(NiCheng,CContent,SendTime,CommentID,CheckCode) values('" + TxtNiCheng.Text + "','" + TxtContent.Value + "','" + replytime + "','" + cid + "','"+ txtCheckCode.Text +"')", conn);
                    Flag = ReplyData.AddInfo(sql,conn,paras);
                    if (Flag == 1)
                    {
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript'>alert('添加留言成功');</script>");
                        TxtNiCheng.Text = "";
                        TxtContent.Value = "";
                        DataSet ds = new DataSet();
                        SqlDataAdapter da = new SqlDataAdapter("select * from T_reply where CommentID='" + cid + "'", conn);
                        da.Fill(ds);
                        reply.DataSource = ds.Tables[0].DefaultView;
                        reply.DataBind();
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript'>alert('由于未知原因，添加失败，如有疑问，请致电新闻网');window.location.reload();</script>");
                        TxtNiCheng.Text = "";
                      
                        TxtContent.Value = "";
                    }
                }
                catch (SqlException err)
                {

                }
            
            }
        }
    }
}