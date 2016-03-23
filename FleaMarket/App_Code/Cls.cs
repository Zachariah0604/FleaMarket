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
/// <summary>
/// Cls 的摘要说明
/// </summary>
public class Cls
{
	public Cls()
	{
        //
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public  static  SqlConnection getconn() 
    {
        DataSql cls = new DataSql();
        SqlConnection conn = new SqlConnection(cls.SqlBase);
        
        if (conn.State == ConnectionState.Closed) 
        {
            SqlCheck.JKLX_Check();
            string LX_tgym = SqlCheck.xiao_getstr("OperationPage");
            string LX_url = HttpContext.Current.Request.ServerVariables["URL"].ToString().Substring (HttpContext.Current.Request.ServerVariables["URL"].ToString().LastIndexOf("/"),HttpContext.Current.Request.ServerVariables["URL"].ToString().Length - HttpContext.Current.Request.ServerVariables["URL"].ToString().LastIndexOf("/")).Replace("/","").ToLower();
            if (LX_tgym.ToLower().Contains(LX_url) != true) 
            {
               SqlCheck.JK1986_CheckSql();
            }
            conn.Open();
        }
        return conn;
    }


/// <summary>
/// ////////////////////////////
/// </summary>
/// <param name="LX_ip"></param>
/// <param name="LX_ym"></param>
/// <param name="LX_fs"></param>
/// <param name="LX_cs"></param>
/// <param name="LX_sj"></param>
/// <param name="LX_rq"></param>
/// <param name="LX_ly"></param>
/// 



    

}
