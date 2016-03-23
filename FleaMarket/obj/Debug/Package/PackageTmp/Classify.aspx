<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Classify.aspx.cs" Inherits="FleaMarket.Classify" %>

<%@ Register TagPrefix="FleaMarketHead" TagName="head" Src="~/head.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>二手分类查询--山东理工大学跳蚤市场</title>
    
    <link rel="stylesheet" href="Styles/WaterfallList.css" media="screen" />
<script src="Scripts/waterfall.jquery.min.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="Scripts/html5.js"></script>
<![endif]-->
<script src="Scripts/blocksit.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //vendor script
        $('#header')
	.css({ 'top': -50 })
	.delay(1000)
	.animate({ 'top': 0 }, 800);

        $('#footer')
	.css({ 'bottom': -15 })
	.delay(1000)
	.animate({ 'bottom': 0 }, 800);

        //blocksit define
        $(window).load(function () {
            $('#container').BlocksIt({
                numOfCol: 5,
                offsetX: 8,
                offsetY: 8
            });
        });

        //window resize
        var currentWidth = 1100;
        $(window).resize(function () {
            var winWidth = $(window).width();
            var conWidth;
            if (winWidth < 660) {
                conWidth = 440;
                col = 2
            } else if (winWidth < 880) {
                conWidth = 660;
                col = 3
            } else if (winWidth < 1100) {
                conWidth = 880;
                col = 4;
            } else {
                conWidth = 1100;
                col = 5;
            }

            if (conWidth != currentWidth) {
                currentWidth = conWidth;
                $('#container').width(conWidth);
                $('#container').BlocksIt({
                    numOfCol: col,
                    offsetX: 8,
                    offsetY: 8
                });
            }
        });
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper">
            <hgroup>
                <FleaMarketHead:head ID="head" runat="server" />
		    </hgroup>
            <div id="container">
                <asp:Repeater ID="DataBuyList" runat="server" >
                    <ItemTemplate>
                        <div class="grid">
		                    <div class="imgholder"><a href='Detail.aspx?commodityID=<%#DataBinder.Eval(Container.DataItem,"commodityID") %>' target='_blank'><img src='<%#DataBinder.Eval(Container.DataItem,"PicPath") %>' /></a></div>
		                    <strong><a href='Detail.aspx?commodityID=<%#DataBinder.Eval(Container.DataItem,"commodityID") %>' target='_blank' style=" color:#333;"><%#ClassifyListTitle((string)DataBinder.Eval(Container.DataItem, "title"))%></a></strong>
		                    <p style=" text-align:right;">预估价格：<%#DataBinder.Eval(Container.DataItem, "Price")%>元</p>
		                    <div class="meta">by <%#DataBinder.Eval(Container.DataItem, "ReleaseName")%>&nbsp;&nbsp;[<%#DataBinder.Eval(Container.DataItem, "ProTime", "{0:MM-dd}")%>]</div>
	                    </div>
                    </ItemTemplate>
                </asp:Repeater>
	           
            </div>
        </div>
        <footer id="footer">
        <p style="text-align:center;">版权所有@2013&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;山东理工大学新闻中心网络部</p>
        <p style="text-align:center;">Designed by <a href="http://lgwindow.sdut.edu.cn/karat/" target="_blank">卡瑞特工作室</a></p>
        <p></p> 
        </footer>
    </form>
</body>
</html>