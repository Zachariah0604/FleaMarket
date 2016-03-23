using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FleaMarket
{
    public partial class SimpleSearch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SimpleSearchButton.Attributes.Add("onclick", "this.form.target='_newName'");
        }

        protected void SimpleSearchButton_Click(object sender, EventArgs e)
        {
            string SimpleKeyWord;

            if (Keyword.Text == "" || Keyword.Text == null)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "RefreshParent", "<script language='javascript'>alert('请填写要查询的内容的关键字');</script>");
             
               
            }
            else
            {

                SimpleKeyWord = Keyword.Text;

                Response.Redirect("~/SearchResult.aspx?KeyWords=" + SimpleKeyWord);

            }
        }
    }
}