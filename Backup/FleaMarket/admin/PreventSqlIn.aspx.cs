using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace FleaMarket.admin
{
    public partial class PreventSqlIn : System.Web.UI.Page
    {
        public string xstr;
        public SqlCommand cmd;
        public SqlDataReader dr;
        protected void Button1_Click(object sender, EventArgs e)
        {
           
            if (Session["Manager"] != null)
            {
                
                Session.Timeout = 1200;
            }
            else
            {
                Page.Response.Write("<script>alert('密码错误');location.href='Admin_Login.aspx'</" + "script>");
            }
        }

        public static SqlConnection  xiao_conn()
        {
            DataSql psi = new DataSql();
            SqlConnection conn = new SqlConnection(psi.SqlBase);
           
            return conn;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Server.ScriptTimeout = 1000;

            if (Page.Request.Params["action"] == "loginout")
            {
                Session["Manager"] = "";
                Session.Abandon();
                Response.Redirect("Admin_Login.aspx");
            }
            else if (Page.Request.Params["action"] == "suo")
            {
                SqlConnection conn = xiao_conn();
                conn.Open();
                cmd = new SqlCommand("update [NetInSql] set IsLock='False' where id=" + Page.Request.Params["id"], conn);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('解锁成功!');location.href='AdminIndex.html'</" + "script>");
                cmd.Dispose();
            }
        }

        public void show(string xorder, string xsql)
        {
            SqlConnection conn = xiao_conn();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            string chksql;
            if (xsql != "")
            {
                chksql = "select * from NetInSql where SubmitWay='" + xsql + "' order by " + xorder;
            }
            else
            {
                chksql = "select * from NetInSql order by " + xorder;
            }
            cmd = new SqlCommand(chksql, conn);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string xlock;
                if (dr.GetValue(2).ToString() == "True")
                {
                    xlock = "解锁";
                }
                else
                {
                    xlock = "未锁";
                }
                xstr += "<tr><td height='3' align='center'><input name=\"group[]\" type=\"checkbox\" onclick=\"javascript:isallon('checkall');\" value=\"" + String.Format("{0}", dr[0]) + "\" /> " + String.Format("{0}", dr[0]) + "</td><td align='center'>" + String.Format("{0}", dr[1]) + "</td><td align='center'>" + String.Format("{0}", dr[2]).Replace("True", "已锁定").Replace("False", "已解锁") + "</td><td align='center'><a href='?action=suo&id=" + String.Format("{0}", dr[0]) + "'>" + xlock + "</a></td><td align='center'>" + String.Format("{0}", dr[3]) + "</td><td align='center'>" + String.Format("{0}", dr[4]) + "</td><td align='center'>" + String.Format("{0}", dr[5]) + "</td><td align='center'>" + String.Format("{0}", dr[6]) + "</td><td align='center'>" + String.Format("{0}", dr[7]) + "</td><td align='center'>" + String.Format("{0}", dr[8]) + "</td></tr>";
            }
            dr.Close();
            dr.Dispose();
            cmd.Dispose();
            conn.Close();
            conn.Dispose();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (DropDownList1.SelectedItem.Text.ToString())
            {
                case "记录日期":
                    show("NoteDate desc", "");
                    break;
                case "记录编号(从小到大)":
                    show("id asc", "");
                    break;
                case "记录编号(从大到小)":
                    show("id desc", "");
                    break;
                case "GET":
                    show("id desc", "GET");
                    break;
                case "POST":
                    show("id desc", "POST");
                    break;
                case "Cookies":
                    show("id desc", "Cookies");
                    break;
            }

        }

        public static string xReplace(string getstr)
        {
            string lx_str = null;
            lx_str = getstr.Replace("<", "&lt;");
            lx_str = getstr.Replace(">", "&gt;");
            lx_str = getstr.Replace("'", "''");
            return lx_str;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string xsf = null;
            string xsfa = null;
            SqlConnection conn = xiao_conn();
            conn.Open();
            switch (Request.Params["select2"])
            {
                case "是":
                    xsf = "True";
                    break;
                case "否":
                    xsf = "False";
                    break;
            }
            switch (Request.Params["select3"])
            {
                case "是":
                    xsfa = "True";
                    break;
                case "否":
                    xsfa = "False";
                    break;
            }
            cmd = new SqlCommand("update Config set Filed='" + xReplace(Request.Params["gjz"]) + "',Notes=" + xsf + ",Lock=" + xsfa + ",Safe='" + Request.Params["ym"] + "',Error='" + Request.Params["select4"] + "',JumpUrl='" + Request.Params["urla"] + "',Warn='" + Request.Params["tishi"] + "',Stop='" + Request.Params["zuzhi"] + "'", conn);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
            conn.Dispose();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Request.Params["group[]"] != null)
            {

                SqlConnection conn = xiao_conn();
                conn.Open();
                string[] xSstr = Request.Params["group[]"].Split(',');
                foreach (string xid in xSstr)
                {
                    cmd = new SqlCommand("delete from NetInSql where id='" + xid + "'", conn);
                    cmd.ExecuteNonQuery();
                }
                Response.Write("<script>alert('批量删除完毕!');</" + "script>");
                cmd.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }
    }
}