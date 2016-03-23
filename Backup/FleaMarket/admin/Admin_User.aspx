<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_User.aspx.cs" Inherits="FleaMarket.admin.Admin_User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="15"  HeaderStyle-BackColor="#DEE8F4" HeaderStyle-BorderColor="#9FB6D5" BorderStyle="Solid" BorderColor="#A1B6D5" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging" >
            <Columns>
            <asp:BoundField HeaderText="用户id" DataField="userID"/>
            <asp:BoundField HeaderText="用户名" DataField="userName" />
        <asp:BoundField HeaderText="学号" DataField="studentID"/>
        <asp:BoundField HeaderText="性别" DataField="Sex" />
        <asp:BoundField HeaderText="QQ号" DataField="QQ" />
        <asp:BoundField HeaderText="电子邮件" DataField="Email" />
        <asp:BoundField HeaderText="手机" DataField="Tel" />
        <asp:BoundField HeaderText="注册日期" DataField="regTime" DataFormatString="{0:yyyy-M-d}" HtmlEncode="False" />
        
        <asp:ButtonField CommandName="DeleteButton" ButtonType="Button" Text="删除" HeaderText="操作" />
    </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
