<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreventSqlIn.aspx.cs" Inherits="FleaMarket.admin.PreventSqlIn" %>
<%@ import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="Expires" content="0">
    <title>ASP.NET��SQLע��</title>
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
        <div style=" width:700px; margin:10px auto; color:Red; text-indent:2em;">ע�������Ϊ����ժ����Դ��Ŀ�����������վ��ȫ�ԣ�����ɿ�����������в���ȷ���������к�̨��Ա�Ǳ����������������²����� </div>
<table width="940" height="150" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#666666">
  <tr>
    <td width="400" align="center">ASP.NET��SQLע��ű�</td>
    <td height="40" align="center"><a href = "?action=xconfig">ϵͳ����</a> <a href="PreventSqlIn.aspx">��¼��Ϣ</a> ����ʽ    
       
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="0">��¼���(��С����)</asp:ListItem>
            <asp:ListItem Value="1">��¼���(�Ӵ�С)</asp:ListItem>
            <asp:ListItem Value="2">��¼����</asp:ListItem>
            <asp:ListItem Value="3">GET</asp:ListItem>
            <asp:ListItem Value="4">POST</asp:ListItem>
            <asp:ListItem Value="5">Cookies</asp:ListItem>
        </asp:DropDownList>
&nbsp;<a href="?action=loginout">�˳���¼</a></td>
  </tr>
  <tr>
    <td height="120" colspan="2" valign="middle">
    
    <%
        if (Request.Params["action"] != "xconfig")
        {
             %>
    <table width="100%" height="80" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#3399CC">
      <tr>
         <td width="6%" height="30" align="center">���</td>
        <td width="12%" align="center">��¼IP</td>
        <td width="9%" align="center">�Ƿ�����</td>
        <td width="6%" align="center">����</td>
        <td width="15%" align="center">����ҳ��</td>
        <td width="6%" align="center">�ύ��ʽ</td>
        <td width="8%" align="center">�ύ����</td>
        <td width="8%" align="center">�ύ����</td>
        <td width="15%" align="center">��¼����</td>
        <td width="15%" align="center">������Դ</td>
      </tr>
      <%= xstr %>
        <tr>
        <td colspan="10"><input name="checkbox" type="checkbox" id="checkall" onclick="javascript:selectchange('group[]',this);" />
        ȫѡ/��ѡ&nbsp;&nbsp; 
            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text=" ɾ �� " 
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
          <td width="200" height="30" align="center">��Ҫ���˵Ĺؼ���:</td>
          <td><input name="gjz" type="text" class="lx_font_12" id="gjz" size="70" value="<%=xFiled %>" /> (�ؼ����á��ָ�)</td>
        </tr>
        <tr>
          <td height="30" align="center">�Ƿ��¼�����ߵ���Ϣ:</td>
          <td><select name="select2" class="lx_font_12">
          <option><%=xNotes.Replace("True", "��").Replace("False", "��")%></option>
            <option>��</option>
            <option>��</option>
          </select>          </td>
        </tr>
        <tr>
          <td height="30" align="center">�Ƿ���������IP:</td>
          <td><select name="select3" class="lx_font_12">
          <option><%=xLock.Replace("True", "��").Replace("False", "��")%></option>
            <option>��</option>
            <option>��</option>
          </select></td>
        </tr>
        <tr>
          <td height="30" align="center">����Ϊ��ȫ��ҳ��:</td>
          <td><input name="ym" type="text" class="lx_font_12" id="gjz2" size="60" value="<%=xSafe %>" /> (�ؼ����á��ָ�)</td>
        </tr>
        <tr>
          <td height="30" align="center">�����Ĵ���ʽ:</td>
          <td><select name="select4" class="lx_font_12">
          <option><%=xError%></option>
            <option>ֱ�ӹر���ҳ</option>
            <option>�����ر�</option>
            <option>��ת��ָ��ҳ��</option>
            <option>�������ת</option>
          </select></td>
        </tr>
        <tr>
          <td height="30" align="center">�������תURL��ַ:</td>
          <td><input name="urla" type="text" class="lx_font_12" id="gjz22" size="30"  value="<%=xJumpUrl %>"/></td>
        </tr>
        <tr>
          <td align="center">������ʾ��Ϣ:</td>
          <td><textarea name="tishi" cols="50" rows="5"><%=xWarn%></textarea></td>
        </tr>
        <tr>
          <td align="center">��ֹ������ʾ��Ϣ:</td>
          <td><textarea name="zuzhi" cols="50" rows="5"><%=xStop%></textarea></td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center">
              <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text=" �� �� " 
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
