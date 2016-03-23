<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sell.ascx.cs" Inherits="FleaMarket.Sell" %>

<asp:Repeater ID="SellDataList" runat="server" >
        <ItemTemplate>
            <div class="list"><div class="listTitle"><a href='Detail.aspx?commodityID=<%#DataBinder.Eval(Container.DataItem,"commodityID") %>' target='_blank'><%#FSell((string)DataBinder.Eval(Container.DataItem, "title"))%></a></div><div class="listTime">[<%#DataBinder.Eval(Container.DataItem, "ProTime","{0:MM-dd}")%>]</div></div>
        </ItemTemplate>
    
</asp:Repeater>