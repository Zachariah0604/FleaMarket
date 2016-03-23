<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SimpleSearch.ascx.cs" Inherits="FleaMarket.SimpleSearch" %>

     
            <asp:TextBox ID="Keyword" runat="server" Text="站内搜索"  style="width:120px; float:left; height:28px; "></asp:TextBox>
      
            <asp:Button ID="SimpleSearchButton" runat="server" Text="搜索" 
    OnClick="SimpleSearchButton_Click" CausesValidation="False" 
    style="width: 40px; height: 33px; float:left; background:#00A1F2; cursor:pointer; color:#ffffff; font-size:14px; margin-left:2px;" />
  
