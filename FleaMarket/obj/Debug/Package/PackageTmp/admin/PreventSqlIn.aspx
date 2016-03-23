<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreventSqlIn.aspx.cs" Inherits="FleaMarket.admin.PreventSqlIn" %>
<%@ import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="Expires" content="0">
    <title>ASP.NET防SQL注入</title>
<script language="JavaScript">

    function selectchange(groupname, selectall) {
        var checkboxall = document.getElementsByName(groupname);
        if (isallselect(checkboxall) || isallnot(checkboxall)) {
            for (i = 0; i < checkboxall.length; i++) {
                checkboxall[i].checked = !checkboxall[i].checked;
                selectall.checked = checkboxall[i].checked;
            }
        }
        else {
            for (i = 0; i < checkboxall.length; i++) {
                checkboxall[i].checked = true;
            }
        }
    }
    function isallon(selectall) {
        var selectall = document.getElementById(selectall);
        if (selectall.checked == true) {
            selectall.checked = false;
        }
        return false;
    }
    function isallselect(checkboxall) {
        for (i = 0; i < checkboxall.length; i++) {
            if (checkboxall[i].checked == false)
            { return false; }
        }
        return true;
    }
    function isallnot(checkboxall) {
        for (i = 0; i < checkboxall.length; i++) {
            if (checkboxall[i].checked == true)
            { return false; }
        }
        return true;
    }
</script> 
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%
        

        if (Session["Manager"] != null)
        {    
        %>
        <div style=" width:700px; margin:10px auto; color:Red; text-indent:2em;">注：此项功能为网络摘抄资源，目的在于提高网站安全性，但其可靠性与可行性尚不能确定。故所有后台人员非必须情况请勿更改以下参数。 </div>
<table width="940" height="150" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#666666">
  <tr>
    <td width="400" align="center">ASP.NET防SQL注入脚本</td>
    <td height="40" align="center"><a href = "?action=xconfig">系统设置</a> <a href="PreventSqlIn.aspx">记录信息</a> 排序方式    
       
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="0">记录编号(从小到大)</asp:ListItem>
            <asp:ListItem Value="1">记录编号(从大到小)</asp:ListItem>
            <asp:ListItem Value="2">记录日期</asp:ListItem>
            <asp:ListItem Value="3">GET</asp:ListItem>
            <asp:ListItem Value="4">POST</asp:ListItem>
            <asp:ListItem Value="5">Cookies</asp:ListItem>
        </asp:DropDownList>
&nbsp;<a href="?action=loginout">退出登录</a></td>
  </tr>
  <tr>
    <td height="120" colspan="2" valign="middle">
    
    <%
        if (Request.Params["action"] != "xconfig")
        {
             %>
    <table width="100%" height="80" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#3399CC">
      <tr>
         <td width="6%" height="30" align="center">编号</td>
        <td width="12%" align="center">记录IP</td>
        <td width="9%" align="center">是否锁定</td>
        <td width="6%" align="center">操作</td>
        <td width="15%" align="center">操作页面</td>
        <td width="6%" align="center">提交方式</td>
        <td width="8%" align="center">提交参数</td>
        <td width="8%" align="center">提交数据</td>
        <td width="15%" align="center">记录日期</td>
        <td width="15%" align="center">攻击来源</td>
      </tr>
      <%= xstr %>
        <tr>
        <td colspan="10"><input name="checkbox" type="checkbox" id="checkall" onclick="javascript:selectchange('group[]',this);" />
        全选/反选&nbsp;&nbsp; 
            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text=" 删 除 " 
                CssClass="lx_font_12" />
                                </td>
        </tr>
    </table>
     
     
      <%
        }
          if (Page.Request.Params["action"] == "xconfig")
          {
              
              SqlConnection conn = xiao_conn();
              conn.Open();
              cmd = new SqlCommand("select * from Config", conn);
              string xFiled = null;
              string xNotes = null;
              string xLock = null;
              string xSafe = null;
              string xError = null;
              string xJumpUrl = null;
              string xWarn = null;
              string xStop = null;
              dr = cmd.ExecuteReader();
              while (dr.Read()) 
              {
                  xFiled = dr.GetValue(1).ToString();
                  xNotes = dr.GetValue(2).ToString();
                  xLock = dr.GetValue(3).ToString();
                  xSafe = dr.GetValue(4).ToString();
                  xError = dr.GetValue(5).ToString();
                  xJumpUrl = dr.GetValue(6).ToString();
                  xWarn = dr.GetValue(7).ToString();
                  xStop = dr.GetValue(8).ToString();
                  
                  
              }
             %>
      
      <table width="800" height="270" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#3399CC">
        <tr>
          <td width="200" height="30" align="center">需要过滤的关键字:</td>
          <td><input name="gjz" type="text" class="lx_font_12" id="gjz" size="70" value="<%=xFiled %>" /> (关键词用↓分割)</td>
        </tr>
        <tr>
          <td height="30" align="center">是否记录入侵者的信息:</td>
          <td><select name="select2" class="lx_font_12">
          <option><%=xNotes.Replace("True", "是").Replace("False", "否")%></option>
            <option>是</option>
            <option>否</option>
          </select>          </td>
        </tr>
        <tr>
          <td height="30" align="center">是否启用锁定IP:</td>
          <td><select name="select3" class="lx_font_12">
          <option><%=xLock.Replace("True", "是").Replace("False", "否")%></option>
            <option>是</option>
            <option>否</option>
          </select></td>
        </tr>
        <tr>
          <td height="30" align="center">您认为安全的页面:</td>
          <td><input name="ym" type="text" class="lx_font_12" id="gjz2" size="60" value="<%=xSafe %>" /> (关键词用↓分割)</td>
        </tr>
        <tr>
          <td height="30" align="center">出错后的处理方式:</td>
          <td><select name="select4" class="lx_font_12">
          <option><%=xError%></option>
            <option>直接关闭网页</option>
            <option>警告后关闭</option>
            <option>跳转到指定页面</option>
            <option>警告后跳转</option>
          </select></td>
        </tr>
        <tr>
          <td height="30" align="center">出错后跳转URL地址:</td>
          <td><input name="urla" type="text" class="lx_font_12" id="gjz22" size="30"  value="<%=xJumpUrl %>"/></td>
        </tr>
        <tr>
          <td align="center">警告提示信息:</td>
          <td><textarea name="tishi" cols="50" rows="5"><%=xWarn%></textarea></td>
        </tr>
        <tr>
          <td align="center">阻止访问提示信息:</td>
          <td><textarea name="zuzhi" cols="50" rows="5"><%=xStop%></textarea></td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center">
              <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text=" 提 交 " 
                  CssClass="lx_font_12" />
            </td>
        </tr>
      </table>
      <%
          cmd.Dispose();
          dr.Close();
          dr.Dispose();
          conn.Close();
          conn.Dispose();
          }
                 %>
      
      </td>
  </tr>
  
</table>
<%
        }
     %>
    </div>
    </form>
</body>
</html>
