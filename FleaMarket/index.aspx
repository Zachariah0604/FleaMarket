<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FleaMarket.index" %>
<%@ Register TagPrefix="FleaMarketSell" TagName="Sell" Src="~/Sell.ascx" %>
<%@ Register TagPrefix="FleaMarketBuy" TagName="Buy" Src="~/Buy.ascx" %>
<%@ Register TagPrefix="FleaMarketSimpleSearch" TagName="SimpleSearch" Src="~/SimpleSearch.ascx" %>
<%@ Register TagPrefix="FleaMarketLost" TagName="Lost" Src="~/Lost.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html"; charset="gb2312"/>
<meta name="keywords" content="���飬�����г������֣������г���ɽ������ɽ��Ѱ�����£�ʧ�����졣" />
<meta name="description" content="ɽ������ѧ�����г���ɽ������ѧ�����г���У��Ѱ�����£�ʧ������վ�㡣" />
<meta name="author" content="1334317192@qq.com" />
<title>ɽ������ѧ�����г�</title>
<link href="Styles/index.css" type="text/css" rel="stylesheet"/>

<script type="text/javascript" language="javascript" src="Scripts/ScrollPic.js" ></script>
</head>

<body>
<form id="form1" runat="server">
	<div id="web_bg" style="position:absolute; width:100%; height:100%; z-index:-1;"> 
		<img style="position:fixed; *position:absolute;" src="images/bg.jpg" height="100%" width="100%" /> 
	</div> 
	<div class="alpha">
		<div class="top">
			<div class="logo"><a href="#"><img src="images/logo1.png"  height="80px" title="ɽ������ѧ�����г�logo" border="0" /></a></div>
			<div class="text">���԰�</div>
			<div id="dh">
				<table width="100%">
                    <tr>
                    <td><a href="#" class="dh_button">������ҳ</a></td>
                    <td><a href="http://www.sdut.edu.cn" class="dh_button" target="_blank" >ѧУ��ҳ</a></td>
                    <td><a href="http://lgwindow.sdut.edu.cn/" class="dh_button"  target="_blank" >��������ҳ</a></td>
                    <td><asp:LinkButton ID="fabu" runat="server" OnClick="fabu_Click" class="dh_button" CausesValidation="false">��Ϣ����</asp:LinkButton></td>
                    <td><div id="content"><a href="#" class="dh_button">��¼ע��</a></div></td>
                    <td><a href="http://lgwindow.sdut.edu.cn/News/26263.html" target="_blank" class="dh_button" >��������</a></td>
                    </tr>
                </table>
                	
					
                	
					
					
                	
            	
			</div>
		</div>
	</div>
    
	<div class="middle">
		<div class="Mleft">
			<div class="MLtop">
				<div class="lanmu" id="chushou">
					<div class="Ktittle"><div class="title"><a href="SellList.aspx" target="_blank" class="title">���ֳ���</a></div><div class="titlletu"><a href="SellList.aspx" target="_blank"><img src="images/MS_0000s_0031_net3.png" width="40" height="40" border="0"/></a></div></div>
					<div class="Klist">
						<FleaMarketSell:Sell ID="Sell" runat="server" />
					</div>
				</div>
                <div class="lanmu" id="qiugou">
					<div class="Ktittle"><div class="title"><a href="BuyList.aspx" target="_blank" class="title">������</a></div><div class="titlletu"><a href="BuyList.aspx" target="_blank"><img src="images/MB_0039_print.png" width="40" height="40" border="0" /></a></div></div>
					<div class="Klist">
						<FleaMarketBuy:Buy ID="Buy" runat="server" />
					</div>
				</div>
                <div class="lanmu" id="tuijian">
					<div class="Ktittle"><div class="title"><a href="LostList.aspx" target="_blank" class="title">Ѱ�����</a></div><div class="titlletu"><a href="LostList.aspx" target="_blank"><img src="images/MS_0000s_0034_signal4.png" width="40" height="40" border="0" /></a></div></div>
					<div class="Klist">
						<FleaMarketLost:Lost ID="Lost" runat="server" />
					</div>
				</div>
				
				
			</div>
			<div class="MLbottom">
				<div class="rollphotos">
                    <div class="blk_29">
                        <div class="LeftBotton" id="LeftArr"></div>
                        <div class="Cont" id="ISL_Cont_1">
                            <%=Pic[0]%>
                            <%=Pic[1]%>
                            <%=Pic[2]%>
                            <%=Pic[3]%>
                            <%=Pic[4]%>
                        </div>
                        <div class="RightBotton" id="RightArr"></div>
                    </div>
<script language="javascript" type="text/javascript">
		<!--    //--><![CDATA[//><!--
    var scrollPic_02 = new ScrollPic();
    scrollPic_02.scrollContId = "ISL_Cont_1"; 
    scrollPic_02.arrLeftId = "LeftArr"; 
    scrollPic_02.arrRightId = "RightArr"; 

    scrollPic_02.frameWidth = 830; 
    scrollPic_02.pageWidth = 165;

    scrollPic_02.speed = 10; 
    scrollPic_02.space = 10; 
    scrollPic_02.autoPlay = false; 
    scrollPic_02.autoPlayTime = 3; 

    scrollPic_02.initialize(); //��ʼ��

    //--><!]]>
</script>
                </div>
			</div>
		</div>
		<div class="Mright">
			<div class="search"><FleaMarketSimpleSearch:SimpleSearch ID="SimpleSearch" runat="server" /></div>
			<div class="R1" id="QM"><a href="http://lgwindow.sdut.edu.cn/topic/QM/" target="_blank"><img src="images/QM.png" width="120" height="110px" border="0" /></a></div>
			<div class="R1" id="Map"><a href="Topic/Bicycle.aspx" target="_blank">bicycle</a></div>
			<div class="RD">
				<img src="images/Cloud_256x256-32.png" width="140px" height="140px" />
				
				<iframe allowtransparency="true" frameborder="0" width="170" height="36" scrolling="no" style="font-size:16px; background-color:#FFFFFF;" src="http://tianqi.2345.com/plugin/widget/index.htm?s=3&z=2&t=1&v=0&d=3&k=&f=1&q=1&e=1&a=1&c=54830&w=170&h=36"></iframe>
				
		</div>
	</div>
                </div>
    <div id="alert">
    <span id="close">�ر�</span>
        <div class="login">
             <div id="loginForm">
		                <H3>ɽ������ѧУ԰���������г��û���¼</H3>
		                    <LABEL>
                                  <table><tr><td><SPAN>�û�����</SPAN></td><td><asp:TextBox ID="txtUserName" runat="server" Width="196px"></asp:TextBox></td></tr></table>
			                </LABEL>
		                    <LABEL>
                                  <table><tr><td><SPAN>��&nbsp;&nbsp;&nbsp;&nbsp;�룺</SPAN></td><td><asp:TextBox ID="txtPassword" runat="server" Width="196px" TextMode="Password"></asp:TextBox></td></tr></table>
			                 </LABEL>
							  		
		                    <DIV id="submit">
                                  <asp:Button ID="userLoginButton" class="bt" runat="server" Text="���ϵ�¼" CausesValidation="false" OnClick="userLoginButton_Click" />
			                            
			                      <asp:Button ID="userRegButton" class="bt" runat="server" Text="����ע��" CausesValidation="false" OnClick="userRegButton_Click" />
		                    </DIV>
							<DIV class="youke">
			                            �����¼���Ǿ����ο����<a href="user/TouristRelease.aspx" target="_blank" style=" color:red;">��������</a>������Ϣ��
		                    </DIV>
	                </div>
        </div>
   </div>
           <script src="Scripts/alert.js" type="text/javascript"></script>
    <div class="footer">��Ȩ���� 2013&nbsp;&nbsp;ɽ������ѧ�����������粿&nbsp;&nbsp;Designed by <a href="http://lgwindow.sdut.edu.cn/karat/" target="_blank">�����ع�����</a></div>
	</form>
</body>
</html>
