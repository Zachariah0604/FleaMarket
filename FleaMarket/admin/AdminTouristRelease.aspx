<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminTouristRelease.aspx.cs" Inherits="FleaMarket.admin.AdminTouristRelease" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/admin.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" height="100%" cellpadding="0" cellspacing="0" 
        style="margin-bottom: 0px; text-align:center;" border="1">
        <tr style=" background:#0090FF; color:#fff; height:30px;">
            <td>商品id</td>
            <td>发布标题</td>
            <td>联系人</td>
            <td>供求、寻物</td>
            <td>转让价格</td>
            <td>发布日期</td>
            <td>结束日期</td>
            <td>是否通过</td>
            <td colspan="3"></td>
        </tr>
        <asp:Repeater ID="rptList"  runat="server" OnItemDataBound="rplist_ItemDataBound">
   <ItemTemplate>
        <tr style="height:30px;">
            <td><%# DataBinder.Eval(Container.DataItem, "commodityID")%></td>
            <td><%# DataBinder.Eval(Container.DataItem, "title")%></td>
            
            <td><%# DataBinder.Eval(Container.DataItem, "ReleaseName")%></td>
            <td><%# DataBinder.Eval(Container.DataItem, "BuySell")%></td>
            <td><%# DataBinder.Eval(Container.DataItem, "Price")%></td>
            <td><%# DataBinder.Eval(Container.DataItem, "ProTime","{0:yyyy-MM-dd}")%></td>
            <td><%# DataBinder.Eval(Container.DataItem, "ProTimeEnd", "{0:yyyy-MM-dd}")%></td>
            <td><%# DataBinder.Eval(Container.DataItem, "pass")%></td>
            <td><asp:LinkButton id="btnpass"  CommandName='<%#DataBinder.Eval(Container.DataItem, "commodityID") %>' OnCommand="btnpass_Click"  runat="server" ></asp:LinkButton></td>
            <td><a href='adminDetail.aspx?commodityID=<%#DataBinder.Eval(Container.DataItem, "commodityID").ToString() %>'  onclick="window.open(this.href,'_blank','resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no,width=900px,height=1100px');return false">详细</a></td>
            <td><asp:LinkButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete" OnClick="btnDelete_Click" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "commodityID") %>'>删除</asp:LinkButton></td>
        </tr>
        </ItemTemplate>
   </asp:Repeater>
   <div style=" width:95%; height:30px; margin-right:10px; margin-top:10px; text-align:right;">
                <div id="PageInfo" runat="server" class="anpager"></div>
            </div>
    </table>
    </form>
</body>
</html>
