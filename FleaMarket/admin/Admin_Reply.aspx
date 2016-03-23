<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Reply.aspx.cs" Inherits="FleaMarket.admin.Admin_Reply" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/admin.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" height="100%" cellpadding="0" cellspacing="0" 
        style="margin-bottom: 0px; text-align:center;" border="1">
        <tr style=" background:#0090FF; color:#fff; height:30px;">
            <td>留言id</td>
            <td>留言者</td>
            <td>留言时间</td>
            <td>对应二手标题</td>
            <td>该二手的发布者</td>
            <td>留言内容</td>
            
            
            <td colspan="2"></td>
        </tr>
        <asp:Repeater ID="rptList"  runat="server">
   <ItemTemplate>
        <tr style="height:30px;">
            <td><%# DataBinder.Eval(Container.DataItem, "CommentID")%></td>
            <td><%# DataBinder.Eval(Container.DataItem, "NiCheng")%></td>
            <td><%# DataBinder.Eval(Container.DataItem, "SendTime", "{0:yyyy-MM-dd}")%></td>
            <td><%# DataBinder.Eval(Container.DataItem, "title")%></td>
            <td><%# DataBinder.Eval(Container.DataItem, "ReleaseName")%></td>
           
            <td><%# DataBinder.Eval(Container.DataItem, "CContent")%></td>
            
            
            <td><a href='../Detail.aspx?commodityID=<%#DataBinder.Eval(Container.DataItem,"commodityID") %>'  onclick="window.open(this.href,'_blank','resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no,width=900px,height=1100px');return false">详细</a></td>
            <td><asp:LinkButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete" OnClick="btnDelete_Click" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "commodityID") %>'>删除</asp:LinkButton></td>
        </tr>
        </ItemTemplate>
   </asp:Repeater>
   <div style=" width:95%;  height:30px; margin-right:10px; margin-top:10px; text-align:right;">
                <div id="PageInfo" runat="server" class="anpager"></div>
            </div>
    </table>
   
    </form>
</body>
</html>
