using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.Net.Mail;

namespace FleaMarket
{
    public partial class Mail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string LabelMail = Request["ToMail"].ToString();
            this.Label1.Text = LabelMail;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            SmtpClient mail = new SmtpClient();
            mail.DeliveryMethod = SmtpDeliveryMethod.Network; //发送方式
            mail.Host = "smtp.qq.com"; //指定smtp服务器
            mail.Credentials = new System.Net.NetworkCredential(TextBox1.Text, TextBox2.Text); //用户凭证
            MailMessage message = new MailMessage();//邮件信息
            message.From = new MailAddress(TextBox1.Text); //发件人 
            message.To.Add(Label1.Text); //收件人
            message.Subject = TextBox4.Text; //邮件主题
            message.Body = TxtContent.Value;//邮件内容
            message.BodyEncoding = System.Text.Encoding.UTF8; //正文编码
            message.IsBodyHtml = true;//设置为HTML格式
            message.Priority = MailPriority.High;//设置优先级
            try
            {
                mail.Send(message);
                Response.Write("<script>alert('发送成功')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('非常抱歉的告诉你，发送失败，可能原因：发件人格式错误或密码不正确。或者，请检查你所使用的QQ邮箱，设置里是否开启了STMP服务。')</script>");
            }


        }
       
    }
}