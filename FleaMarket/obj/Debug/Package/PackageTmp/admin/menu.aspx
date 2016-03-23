<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="FleaMarket.admin.menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/admin.css" type="text/css" rel="stylesheet"/>
<script type="text/JavaScript">
    var $ = function (id) {
        return document.getElementById(id);
    }

    function show_menu(num) {
        for (i = 0; i < 100; i++) {
            if ($('li0' + i)) {
                $('li0' + i).style.display = 'none';
                $('f0' + i).className = '';
            }
        }
        $('li0' + num).style.display = 'block';
        $('f0' + num).className = 'left02down01_xia_li';
    }

    function show_menuB(numB) {
        for (j = 0; j < 100; j++) {
            if (j != numB) {
                if ($('Bli0' + j)) {
                    $('Bli0' + j).style.display = 'none';
                    $('Bf0' + j).style.background = 'url(../images/01.gif)';
                }
            }
        }
        if ($('Bli0' + numB)) {
            if ($('Bli0' + numB).style.display == 'block') {
                $('Bli0' + numB).style.display = 'none';
                $('Bf0' + numB).style.background = 'url(../images/01.gif)';
            } else {
                $('Bli0' + numB).style.display = 'block';
                $('Bf0' + numB).style.background = 'url(../images/02.gif)';
            }
        }
    }


    var temp = 0;

</script>
</head>
<body>
    

    <form id="form1" runat="server">
    <div class="left" id="LeftBox">
	<div class="left01">
		<div class="left01_right"></div>
		<div class="left01_left"></div>
		<div class="left01_c">超级管理员：<asp:Label ID="Label1" runat="server"></asp:Label></div>
	</div>
	<div class="left02">
		<div class="left02top">
			<div class="left02top_right"></div>
			<div class="left02top_left"></div>
			<div class="left02top_c">用户信息管理</div>
		</div>
	  <div class="left02down">
      <div class="left02down01"><a onClick="show_menuB(81)" href="javascript:;">
		      <div id="Bf081" class="left02down01_img"></div>
		      管理员信息管理</a></div>
			<div class="left02down01_xia noneBox" id="Bli081">
				<ul>
					<li onMouseMove="show_menu(12)" id="f012"><a href="#">&middot;信息查询</a></li>
					<li onMouseMove="show_menu(13)" id="f013"><a href="#">&middot;信息更改</a></li>
				</ul>
			</div>
			<div class="left02down01"><a  onclick="show_menuB(80)" href="javascript:;"><div id="Bf080" class="left02down01_img"></div>用户信息查询</a></div>
			<div class="left02down01_xia noneBox" id="Bli080">
				<ul>
					<li onMouseMove="show_menu(10)" id="f010"><a href="Admin_User.aspx" target="main">&middot;用户信息管理</a></li>
					<li onMouseMove="show_menu(11)" id="f011"><a href="Admin_User.aspx" target="main">&middot;用户信息更改</a></li>
				</ul>
			</div>
		    
		</div>
	</div>
	
    <div class="left02">
		<div class="left02top">
			<div class="left02top_right"></div>
			<div class="left02top_left"></div>
			<div class="left02top_c">发布信息管理</div>
		</div>
		<div class="left02down">
			<div class="left02down01"><a href="Admin_Release.aspx" target="main"><div class="left02down01_img"></div>用户发布</a></div>
			<div class="left02down01"><a href="AdminTouristRelease.aspx" target="main"><div class="left02down01_img"></div>游客发布</a></div>
            <div class="left02down01"><a href="Admin_Lost.aspx" target="main"><div class="left02down01_img"></div>失物发布</a></div>
		</div>
	</div>
    <div class="left02">
		<div class="left02top">
			<div class="left02top_right"></div>
			<div class="left02top_left"></div>
			<div class="left02top_c"><a href="Admin_Reply.aspx" target="main">留言及回复管理</a></div>
		</div>
	</div>
	
	<div class="left02">
		<div class="left02top">
			<div class="left02top_right"></div>
			<div class="left02top_left"></div>
			<div class="left02top_c">物品分类管理</div>
		</div>
		<div class="left02down">
			<div class="left02down01"><a href="CommodityType1.aspx" target="main"><div class="left02down01_img"></div>添加一级分类</a></div>
			<div class="left02down01"><a href="CommodityType2.aspx" target="main"><div class="left02down01_img"></div>添加二级分类</a></div>
			
		</div>
	</div>
    <div class="left02">
		<div class="left02top">
			<div class="left02top_right"></div>
			<div class="left02top_left"></div>
			<div class="left02top_c"><a href="PreventSqlIn.aspx" target="main">SQL防注入系统</a></div>
		</div>
	</div>
	<div class="left01">
		<div class="left03_right"></div>
		<div class="left01_left"></div>
		<div class="left03_c"><a href="?action=loginout">退出登录</a></div>
	</div>
</div>
    </form>
</body>
</html>
