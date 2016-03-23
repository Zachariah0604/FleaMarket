<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hot.aspx.cs" Inherits="FleaMarket.hot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/Detail.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    
    <div class="hot">
		            <div class="hotbanner"><img src="images/ranking.jpg" border="0" /></div>
		            <div class="hotnews">
                        <asp:Repeater runat="server" ID="hotrepeater">
                            <ItemTemplate>
			            <div class="hotlist"><div class="hotlogo">[<%# DataBinder.Eval(Container.DataItem,"BuySell") %>]</div><div class="hottitle"><a href='Detail.aspx?commodityID=<%# DataBinder.Eval(Container.DataItem,"commodityID") %>' target="_parent"><%#Limit((string)DataBinder.Eval(Container.DataItem,"title")) %>(<%# DataBinder.Eval(Container.DataItem, "ClickCount")%>)</a></div><div class="hotdate">[<%# DataBinder.Eval(Container.DataItem, "ProTime","{0:MM-dd}")%>]</div></div>
                            </ItemTemplate>
                        </asp:Repeater>
			        </div>
	            </div>
    
</body>
</html>
