<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lost.ascx.cs" Inherits="FleaMarket.Lost" %>
<asp:Repeater ID="LostDataList" runat="server" >
        <ItemTemplate>
            <div class="list"><div class="xunwu">[<%#DataBinder.Eval(Container.DataItem, "BuySell")%>]</div><div class="listTitle"><a href='Detail.aspx?commodityID=<%#DataBinder.Eval(Container.DataItem,"commodityID") %>' target='_blank'><%#FLost((string)DataBinder.Eval(Container.DataItem, "title"))%></a></div></div>
        </ItemTemplate>
    
</asp:Repeater>