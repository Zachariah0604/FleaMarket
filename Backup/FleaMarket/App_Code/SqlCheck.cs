using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Net;
                
public class SqlCheck
{
    DataSql SqlCheckData = new DataSql();
	public SqlCheck()
	{
		
       
    }

    public static void JKLX_Check()
    {
        string xip = xiao_Getip();
        SqlConnection xiao_conn = xiao_getconn();
        string xsql = "select IsLock from NetInSql where GetIp='" + xip + "'";
        SqlCommand cmd = new SqlCommand(xsql, xiao_conn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (String.Format("{0}", dr[0]) == "True")
            {
                HttpContext.Current.Response.Write("<script>alert('" + xiao_getstr("Stop") + "');window.close();</script>");
                HttpContext.Current.Response.End();
            }
        }
        cmd.Dispose();
        dr.Close();
        xiao_conn.Close();
        xiao_conn.Dispose();
    }

    public static string xiao_getstr(string jkstr)
    {
        string xiao_str = null;
        SqlConnection xiao_conn = xiao_getconn();
        SqlCommand cmd = new SqlCommand("select " + jkstr + " from Config", xiao_conn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            xiao_str = String.Format("{0}", dr[0]);
        }
        dr.Close();
        dr.Dispose();
        cmd.Dispose();
        xiao_conn.Close();
        return xiao_str;
    }


    public static string xiao_Getip()
    {
        string lx_getip = null;
        if (System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            lx_getip = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        }
        else
        {
            lx_getip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
        return lx_getip;
    }

    public static string LX_address()
    {
        string LX_add = xiao_Getip();
        string lx_url = "http://www.sogou.com/web?query=" + LX_add;
        WebClient LX_wc = new WebClient();
        byte[] LX_bt = LX_wc.DownloadData(lx_url);
        string LX_data = System.Text.Encoding.Default.GetString(LX_bt);
        LX_wc.Dispose();
        string LX_jk = LX_data.ToLower().Substring(LX_data.ToLower().IndexOf("地理位置："), 15);
        LX_jk = LX_jk.Substring(0, LX_jk.Length - LX_data.ToLower().IndexOf("<")).Replace("地理位置：", "");
        return LX_jk;
    }

    public static void JK1986_Insertsql(string LX_ip, string LX_ym, string LX_fs, string LX_cs, string LX_sj, string LX_rq, string LX_ly)
    {
        SqlConnection LX_conn = xiao_getconn();
        string LX_sql = null;
        string LX_sfsd = xiao_getstr("LX_sd");
        if (LX_sfsd == "True")
        {
            LX_sql = "InSert InTo NetInSql (GetIp,IsLock,OperationPage,SubmitWay,SubmitParameter,SubmitData,NoteDate,AttackSource) values ('" + LX_ip + "',True,'" + LX_ym + "','" + LX_fs + "','" + LX_Replace(LX_cs) + "','" + LX_Replace(LX_sj) + "','" + LX_rq + "','" + LX_ly + "') ";
        }
        else
        {
            LX_sql = "InSert InTo NetInSql (GetIp,IsLock,OperationPage,SubmitWay,SubmitParameter,SubmitData,NoteDate,AttackSource) values ('" + LX_ip + "',False,'" + LX_ym + "','" + LX_fs + "','" + LX_Replace(LX_cs) + "','" + LX_Replace(LX_sj) + "','" + LX_rq + "','" + LX_ly + "') ";

        }
        SqlCommand LX_cmd = new SqlCommand(LX_sql, LX_conn);
        LX_cmd.ExecuteNonQuery();
        LX_conn.Close();
        LX_conn.Dispose();
    }

    public static string LX_Replace(string getstr)
    {
        string lx_str = null;
        lx_str = getstr.Replace("<", "&lt;");
        lx_str = getstr.Replace(">", "&gt;");
        lx_str = getstr.Replace("'", "''");
        return lx_str;
    }

    public static SqlConnection xiao_getconn()
    {
        DataSql SqlCheckData = new DataSql();
        SqlConnection xiao_conn = new SqlConnection(SqlCheckData.SqlBase);

        if (xiao_conn.State == ConnectionState.Closed)
        {
            xiao_conn.Open();
        }
        return xiao_conn;
    }

    public static void JK1986_CheckSql()
    {
        string jk1986_sql = xiao_getstr("Filed");
        string[] jk_sql = jk1986_sql.Split('↓');
        foreach (string jk in jk_sql)
        {
            // -----------------------防 Post 注入-----------------------
            if (System.Web.HttpContext.Current.Request.Form != null)
            {
                for (int k = 0; k < System.Web.HttpContext.Current.Request.Form.Count; k++)
                {
                    string getsqlkey = System.Web.HttpContext.Current.Request.Form.Keys[k];
                    string getip;
                    string geturl;
                    string getsj;
                    if (System.Web.HttpContext.Current.Request.Form[getsqlkey].ToLower().Contains(jk) == true)
                    {
                        string xError = xiao_getstr("Error");
                        if (System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
                        {
                            getip = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                        }
                        else
                        {
                            getip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                        }
                        switch (xError)
                        {
                            case "直接关闭网页":
                                HttpContext.Current.Response.Write("<script Language=JavaScript>window.close();</script>");
                                break;
                            case "警告后关闭":
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>alert('" + xiao_getstr("Warn") + "');</" + "script>");
                                System.Web.HttpContext.Current.Response.Write("非法操作！系统做了如下记录 ↓" + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 I  P ：" + getip + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 时 间：" + DateTime.Now.ToString() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 页 面：" + System.Web.HttpContext.Current.Request.ServerVariables["URL"] + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 方 式：G E T " + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 参 数：" + jk + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 数 据：" + System.Web.HttpContext.Current.Request.Form[getsqlkey].ToLower() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>window.close();</script>");
                                break;
                            case "跳转到指定页面":
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>window.location.href='" + xiao_getstr("JumpUrl") + "'</script>");
                                break;
                            case "警告后跳转":
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>alert('" + xiao_getstr("Warn") + "');</" + "script>");
                                System.Web.HttpContext.Current.Response.Write("非法操作！系统做了如下记录 ↓" + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 I  P ：" + getip + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 时 间：" + DateTime.Now.ToString() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 页 面：" + System.Web.HttpContext.Current.Request.ServerVariables["URL"] + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 方 式：G E T " + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 参 数：" + jk + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 数 据：" + System.Web.HttpContext.Current.Request.Form[getsqlkey].ToLower() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>window.location.href='" + xiao_getstr("JumpUrl") + "'</script>");
                                break;
                        }
                        geturl = System.Web.HttpContext.Current.Request.ServerVariables["URL"];
                        getsj = System.Web.HttpContext.Current.Request.Form[getsqlkey].ToLower();
                        string LX_sfjl = xiao_getstr("Notes");
                        if (LX_sfjl == "True")
                        {
                            JK1986_Insertsql(getip, geturl, "POST", jk, getsj, DateTime.Now.ToString(), LX_address());
                        }
                        System.Web.HttpContext.Current.Response.End();
                    }
                }
            }
            // -----------------------防 GET 注入-----------------------
            if (System.Web.HttpContext.Current.Request.QueryString != null)
            {
                for (int k = 0; k < System.Web.HttpContext.Current.Request.QueryString.Count; k++)
                {
                    string getsqlkey = System.Web.HttpContext.Current.Request.QueryString.Keys[k];
                    string getip;
                    string geturl;
                    string getsj;
                    if (System.Web.HttpContext.Current.Request.QueryString[getsqlkey].ToLower().Contains(jk) == true)
                    {
                        string xError = xiao_getstr("Error");
                        if (System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
                        {
                            getip = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                        }
                        else
                        {
                            getip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                        }
                        switch (xError)
                        {
                            case "直接关闭网页":
                                HttpContext.Current.Response.Write("<script Language=JavaScript>window.close();</script>");
                                break;
                            case "警告后关闭":
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>alert('" + xiao_getstr("Warn") + "');</" + "script>");
                                System.Web.HttpContext.Current.Response.Write("非法操作！系统做了如下记录 ↓" + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 I  P ：" + getip + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 时 间：" + DateTime.Now.ToString() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 页 面：" + System.Web.HttpContext.Current.Request.ServerVariables["URL"] + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 方 式：G E T " + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 参 数：" + jk + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 数 据：" + System.Web.HttpContext.Current.Request.QueryString[getsqlkey].ToLower() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>window.close();</script>");
                                break;
                            case "跳转到指定页面":
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>window.location.href='" + xiao_getstr("JumpUrl") + "'</script>");
                                break;
                            case "警告后跳转":
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>alert('" + xiao_getstr("Warn") + "');</" + "script>");
                                System.Web.HttpContext.Current.Response.Write("非法操作！系统做了如下记录 ↓" + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 I  P ：" + getip + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 时 间：" + DateTime.Now.ToString() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 页 面：" + System.Web.HttpContext.Current.Request.ServerVariables["URL"] + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 方 式：G E T " + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 参 数：" + jk + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 数 据：" + System.Web.HttpContext.Current.Request.QueryString[getsqlkey].ToLower() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>window.location.href='" + xiao_getstr("JumpUrl") + "'</script>");
                                break;

                        }
                        geturl = System.Web.HttpContext.Current.Request.ServerVariables["URL"];
                        getsj = System.Web.HttpContext.Current.Request.QueryString[getsqlkey].ToLower();
                        string LX_sfjl = xiao_getstr("Notes");
                        if (LX_sfjl == "True")
                        {
                            JK1986_Insertsql(getip, geturl, "GET", jk, getsj, DateTime.Now.ToString(), LX_address());
                        }
                        System.Web.HttpContext.Current.Response.End();
                    }
                }
            }

            // -----------------------防 Cookies 注入-----------------------
            if (System.Web.HttpContext.Current.Request.Cookies != null)
            {
                for (int k = 0; k < System.Web.HttpContext.Current.Request.Cookies.Count; k++)
                {
                    string getsqlkey = System.Web.HttpContext.Current.Request.Cookies.Keys[k];
                    string getip;
                    string geturl;
                    string getsj;
                    if (System.Web.HttpContext.Current.Request.Cookies[getsqlkey].Value.ToLower().Contains(jk) == true)
                    {
                        string LX_ts = xiao_getstr("LX_error");
                        if (System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
                        {
                            getip = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                        }
                        else
                        {
                            getip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                        }
                        switch (LX_ts)
                        {
                            case "直接关闭网页":
                                HttpContext.Current.Response.Write("<script Language=JavaScript>window.close();</script>");
                                break;
                            case "警告后关闭":
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>alert('" + xiao_getstr("Warn") + "');</" + "script>");
                                System.Web.HttpContext.Current.Response.Write("非法操作！系统做了如下记录 ↓" + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 I  P ：" + getip + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 时 间：" + DateTime.Now.ToString() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 页 面：" + System.Web.HttpContext.Current.Request.ServerVariables["URL"] + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 方 式：G E T " + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 参 数：" + jk + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 数 据：" + System.Web.HttpContext.Current.Request.Cookies[getsqlkey].Value.ToLower() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>window.close();</script>");
                                break;
                            case "跳转到指定页面":
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>window.location.href='" + xiao_getstr("JumpUrl") + "'</script>");
                                break;
                            case "警告后跳转":
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>alert('" + xiao_getstr("Warn") + "');</" + "script>");
                                System.Web.HttpContext.Current.Response.Write("非法操作！系统做了如下记录 ↓" + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 I  P ：" + getip + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 时 间：" + DateTime.Now.ToString() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("操 作 页 面：" + System.Web.HttpContext.Current.Request.ServerVariables["URL"] + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 方 式：G E T " + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 参 数：" + jk + "<br>");
                                System.Web.HttpContext.Current.Response.Write("提 交 数 据：" + System.Web.HttpContext.Current.Request.Cookies[getsqlkey].Value.ToLower() + "<br>");
                                System.Web.HttpContext.Current.Response.Write("<script Language=JavaScript>window.location.href='" + xiao_getstr("JumpUrl") + "'</script>");
                                break;
                        }
                        geturl = System.Web.HttpContext.Current.Request.ServerVariables["URL"];
                        getsj = System.Web.HttpContext.Current.Request.Cookies[getsqlkey].Value.ToLower();
                        string LX_sfjl = xiao_getstr("Notes");
                        if (LX_sfjl == "True")
                        {
                            JK1986_Insertsql(getip, geturl, "Cookies", jk, getsj, DateTime.Now.ToString(), LX_address());
                        }
                        System.Web.HttpContext.Current.Response.End();
                    }
                }
            }

        }
    }     


  
    

    
    
}
