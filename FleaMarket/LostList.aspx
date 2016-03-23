<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LostList.aspx.cs" Inherits="FleaMarket.LostList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="FleaMarketHead" TagName="head" Src="~/head.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>失物招领、寻物启事--山东理工大学跳蚤市场</title>
    <link rel="stylesheet" href="Styles/WaterfallList.css" media="screen" />
    <link rel="Stylesheet" type="text/css" href="Styles/classify.css" />
<script src="Scripts/waterfall.jquery.min.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="Scripts/html5.js"></script>
<![endif]-->
<script src="Scripts/blocksit.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
       
        $('#header')
	.css({ 'top': -50 })
	.delay(1000)
	.animate({ 'top': 0 }, 800);

        $('#footer')
	.css({ 'bottom': -15 })
	.delay(1000)
	.animate({ 'bottom': 0 }, 800);

       
        $(window).load(function () {
            $('#container').BlocksIt({
                numOfCol: 5,
                offsetX: 8,
                offsetY: 8
            });
        });

        
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
            <div class="selCity" id="allCity" style="DISPLAY: none">
                <div class="area">
                   <table>
                        <tr>
                            <td>生活用品</td>
                            <td><a href='Classify.aspx?CommodityType2ID=5&BuySell=寻物启事||BuySell=失物招领' )>其他用品</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=6&BuySell=寻物启事||BuySell=失物招领' )>玩具</a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                           
                        </tr>
                        <tr>
                            <td>手机</td>
                            <td><a href='Classify.aspx?CommodityType2ID=8&BuySell=寻物启事||BuySell=失物招领' )>手机</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=9&BuySell=寻物启事||BuySell=失物招领' )>配件</a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>数码3C产品</td>
                            <td><a href='Classify.aspx?CommodityType2ID=10&BuySell=寻物启事||BuySell=失物招领' )>MP3/MP4/录音</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=11&BuySell=寻物启事||BuySell=失物招领' )>U盘</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=12&BuySell=寻物启事||BuySell=失物招领' )>移动硬盘</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=13&BuySell=寻物启事||BuySell=失物招领' )>闪存卡</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=14&BuySell=寻物启事||BuySell=失物招领' )>其他</a></td>
                            <td></td>
                            <td></td>
                           
                        </tr>
                        <tr>
                            <td>相机/摄像机</td>
                            <td><a href='Classify.aspx?CommodityType2ID=15&BuySell=寻物启事||BuySell=失物招领' )>单反镜头</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=16&BuySell=寻物启事||BuySell=失物招领' )>数码单反</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=17&BuySell=寻物启事||BuySell=失物招领' )>普通数码相机</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=18&BuySell=寻物启事||BuySell=失物招领' )>胶片相机</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=19&BuySell=寻物启事||BuySell=失物招领' )>摄像机</a></td>
                            <td></td>
                            <td></td>
                           
                        </tr>
                        <tr>
                            <td>电脑/电脑配件</td>
                            <td><a href='Classify.aspx?CommodityType2ID=20&BuySell=寻物启事||BuySell=失物招领' )>笔记本电脑</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=21&BuySell=寻物启事||BuySell=失物招领' )>平板电脑</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=22&BuySell=寻物启事||BuySell=失物招领' )>台式机</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=23&BuySell=寻物启事||BuySell=失物招领' )>显示器</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=24&BuySell=寻物启事||BuySell=失物招领' )>台式机配件</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=25&BuySell=寻物启事||BuySell=失物招领' )>网络设备</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=26&BuySell=寻物启事||BuySell=失物招领' )>笔记本配件</a></td>
                           
                        </tr>
                        <tr>
                            <td>校园/证件</td>
                            <td><a href='Classify.aspx?CommodityType2ID=27&BuySell=寻物启事||BuySell=失物招领' )>身份证</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=28&BuySell=寻物启事||BuySell=失物招领' )>银行卡</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=29&BuySell=寻物启事||BuySell=失物招领' )>校园卡</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=30&BuySell=寻物启事||BuySell=失物招领' )>钱包</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=31&BuySell=寻物启事||BuySell=失物招领' )>钥匙</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=32&BuySell=寻物启事||BuySell=失物招领' )>挂饰</a></td>
                            <td></td>
                           
                        </tr>
                        
                        <tr>
                            <td>游戏</td>
                            <td><a href='Classify.aspx?CommodityType2ID=33&BuySell=寻物启事||BuySell=失物招领' )>游戏点卡</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=34&BuySell=寻物启事||BuySell=失物招领' )>游戏账号</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=35&BuySell=寻物启事||BuySell=失物招领' )>游戏机</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=36&BuySell=寻物启事||BuySell=失物招领' )>游戏软件</a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                           
                        </tr>
                        
                        <tr>
                            <td>艺术收藏</td>
                            <td><a href='Classify.aspx?CommodityType2ID=37&BuySell=寻物启事||BuySell=失物招领' )>书画</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=38&BuySell=寻物启事||BuySell=失物招领' )>古玩</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=39&BuySell=寻物启事||BuySell=失物招领' )>收藏品</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=40&BuySell=寻物启事||BuySell=失物招领' )>其他收藏</a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                           
                        </tr>
                        <tr>
                            <td>自行车/电动车</td>
                            <td><a href='Classify.aspx?CommodityType2ID=42&BuySell=寻物启事||BuySell=失物招领' )>汽车配件</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=43&BuySell=寻物启事||BuySell=失物招领' )>摩托/电动车</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=44&BuySell=寻物启事||BuySell=失物招领' )>摩托/电动配件</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=45&BuySell=寻物启事||BuySell=失物招领' )>自行车</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=46&BuySell=寻物启事||BuySell=失物招领' )>其他车类</a></td>
                            <td></td>
                            <td></td>
                           
                        </tr>
                        <tr>
                            <td>图书音像</td>
                            <td><a href='Classify.aspx?CommodityType2ID=47&BuySell=寻物启事||BuySell=失物招领' )>书籍</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=48&BuySell=寻物启事||BuySell=失物招领' )>CD/DVD</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=49&BuySell=寻物启事||BuySell=失物招领' )>期刊杂志</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=50&BuySell=寻物启事||BuySell=失物招领' )>乐器</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=51&BuySell=寻物启事||BuySell=失物招领' )>运动器材</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=52&BuySell=寻物启事||BuySell=失物招领' )>文具</a></td>
                            <td></td>
                           
                        </tr>
                        <tr>
                            <td>鞋包配饰</td>
                            <td><a href='Classify.aspx?CommodityType2ID=53&BuySell=寻物启事||BuySell=失物招领' )>旅行箱</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=54&BuySell=寻物启事||BuySell=失物招领' )>男鞋</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=55&BuySell=寻物启事||BuySell=失物招领' )>男包</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=56&BuySell=寻物启事||BuySell=失物招领' )>女鞋</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=57&BuySell=寻物启事||BuySell=失物招领' )>女包</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=58&BuySell=寻物启事||BuySell=失物招领' )>配饰</a></td>
                            <td></td>
                           
                        </tr>
                        <tr>
                            <td>生活服务/票</td>
                            <td><a href='Classify.aspx?CommodityType2ID=59&BuySell=寻物启事||BuySell=失物招领' )>电影票</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=60&BuySell=寻物启事||BuySell=失物招领' )>折扣劵</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=61&BuySell=寻物启事||BuySell=失物招领' )>购物卡</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=62&BuySell=寻物启事||BuySell=失物招领' )>休闲娱乐</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=63&BuySell=寻物启事||BuySell=失物招领' )>生活服务</a></td>
                            <td><a href='Classify.aspx?CommodityType2ID=64&BuySell=寻物启事||BuySell=失物招领' )>其他门票</a></td>
                            <td></td>
                           
                        </tr>
                         <tr>
                            <td>其他闲置</td>
                            <td><a href='Classify.aspx?CommodityType2ID=65&BuySell=寻物启事||BuySell=失物招领' )>其他闲置</a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                           
                        </tr>
                    </table>
                    <div class="none"><a id="foldin" href="javascript:;">收起</a></div>
                </div>
            </div>
            <div class="classify">
	            <div class="area">
		            <div class="r">
			            <div class="topCtiy clear">
				            
				                
				                <div class="i2" id="changeCity">分类查询</div>
				            
			            </div>
		            </div>
	            </div>
            </div>
            
            <script type="text/javascript">
                jQuery(function () {
                    $("#changeCity").click(function (a) { $("#allCity").slideDown(300); a.stopPropagation(); $(this).blur() }); $("#allCity").click(function (a) { a.stopPropagation() }); $(document).click(function (a) { a.button != 2 && $("#allCity").slideUp(300) }); $("#foldin").click(function () { $("#allCity").slideUp(300) })
                });
            </script>
            <div id="container">
                <asp:Repeater ID="DataLostList" runat="server" >
                    <ItemTemplate>
                        <div class="grid">
		                    <div class="imgholder"><a href='Detail.aspx?commodityID=<%#DataBinder.Eval(Container.DataItem,"commodityID") %>' target='_blank'><img src='<%#DataBinder.Eval(Container.DataItem,"PicPath") %>' /></a></div>
		                    <strong><a href='Detail.aspx?commodityID=<%#DataBinder.Eval(Container.DataItem,"commodityID") %>' target='_blank' style=" color:#333;"><%#LostListTitle((string)DataBinder.Eval(Container.DataItem, "title"))%></a></strong>
		                    <p style=" text-align:right;">失物类型：<%#DataBinder.Eval(Container.DataItem, "BuySell")%></p>
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

