<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommodityType2.aspx.cs" Inherits="FleaMarket.admin.CommodityType2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <table cellpadding="1" cellspacing="1" width="700px" style=" margin:10px auto;" border="1">
        <tr style=" background-color:#0090FF; color:#fff;"><td>一级分类</td><td width="50px;"></td><td>对应二级分类</td><td>操作</td></tr>
        <asp:Repeater ID="repeaterty" runat="server"><ItemTemplate>
        <tr><td><%# DataBinder.Eval(Container.DataItem, "TypeName")%></td><td></td><td><%# DataBinder.Eval(Container.DataItem, "CommodityType2Name")%></td><td><asp:LinkButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete" OnClick="btnDelete_Click" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "CommodityType2ID") %>'>删除</asp:LinkButton></td></tr>
        </ItemTemplate></asp:Repeater>
    </table>
    <div>
    添加二级分类：所属一级<select id="firstKind" runat="server" onchange="refreshModelList()"><option></option></select>
        添加二级：<asp:TextBox ID="type2" runat="server"></asp:TextBox>
        <asp:Button ID="TypeButton" runat="server" Text="添加" 
            onclick="TypeButton_Click" /><br /><br />
    </div>
    </form>
</body>
</html>
