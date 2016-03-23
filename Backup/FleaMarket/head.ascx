<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="head.ascx.cs" Inherits="FleaMarket.head" %>
<%@ Register TagPrefix="FleaMarketSimpleSearch" TagName="SimpleSearch" Src="~/SimpleSearch.ascx" %>


   
    
    <link href="Styles/head.css" type="text/css" rel="Stylesheet" />
  <table width="1100" height="85" border="0" align="center" cellpadding="0" cellspacing="0" background="img/topmenubg.gif" id="table8">
    <tr>
      <td width="267" align="center"><a href="index.aspx"><img src="images/logo1.png" height="100px" border="0" style=" margin-left:30px;" /></a></td>
      <td width="738" align="center">
        <div id="topright">
            <div id="user">
                <asp:Panel ID="text" runat="server">
                    <div style=" float:right;">
                        <table><tr><td>您尚未</td><td><div id="content"><a href="#">&nbsp;登录&nbsp;</a></div></td><td>或</td><td><a href="user/UserReg.aspx" target="_top">&nbsp;注册</a></td></tr></table>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Info" runat="server">
                    <table width="100%">
                        <tr>
                            <td><asp:Label ID="NameLabel" runat="server"></asp:Label></td>
                            <td><asp:LinkButton ID="UserCollect" runat="server" OnClick="UserCollect_Click" CausesValidation="false">个人收藏物品</asp:LinkButton></td>
                            <td>&nbsp;&nbsp;&nbsp;|</td>
                            <td><asp:LinkButton ID="ReleaseAlready" runat="server" OnClick="ReleaseAlready_Click" CausesValidation="false">已发布信息</asp:LinkButton></td>
                            <td>&nbsp;&nbsp;&nbsp;|</td>
                            <td><asp:LinkButton ID="Quit" runat="server" CausesValidation="false" OnClick="Quit_Click">退出登录</asp:LinkButton></td>
                         </tr>
                     </table>
                        
                        
                        
                </asp:Panel>
            </div>
            <div id="search"><FleaMarketSimpleSearch:SimpleSearch ID="SimpleSearch" runat="server" /></div>
        </div>
      </td>
    </tr>
  </table>
  <div class="header">
    <div class="header_resize">
      
    
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.aspx" target="_blank">首页</a></li>
          <li><a href="SellList.aspx" target="_blank">二手出售</a></li>
          <li><a href="BuyList.aspx" target="_blank">二手求购</a></li>
          <li><a href="LostList.aspx">寻物·招领</a></li>
          <li><asp:LinkButton ID="fabu" runat="server" OnClick="fabu_Click" CausesValidation="false">信息发布</asp:LinkButton></li>
          <li><a href="http://lgwindow.sdut.edu.cn/News/26263.html" target="_blank">关于我们</a></li>
        </ul>
      </div>
     
    </div>
  </div>

  <div id="alert">
    <span id="close">关闭</span>
        <div class="login">
             <div id="loginForm">
		                <H3>山东理工大学校园二手跳蚤市场用户登录</H3>
		                    <LABEL>
                                  <table><tr><td><SPAN>用户名：</SPAN></td><td><asp:TextBox ID="txtUserName" runat="server" Width="196px"></asp:TextBox></td></tr></table>
			                </LABEL>
		                    <LABEL>
                                  <table><tr><td><SPAN>密&nbsp;&nbsp;&nbsp;&nbsp;码：</SPAN></td><td><asp:TextBox ID="txtPassword" runat="server" Width="196px" TextMode="Password"></asp:TextBox></td></tr></table>
			                 </LABEL>
							  		
		                    <DIV id="submit">
                                  <asp:Button ID="userLoginButton" class="bt" runat="server" Text="马上登录" CausesValidation="false" OnClick="userLoginButton_Click" />
			                            
			                      <asp:Button ID="userRegButton" class="bt" runat="server" Text="立即注册" CausesValidation="false" OnClick="userRegButton_Click" />
		                    </DIV>
							<DIV class="youke">
			                            不想登录？那就以游客身份<a href="user/TouristRelease.aspx" target="_blank" style=" color:red;">立即发布</a>二手信息。
		                    </DIV>
	                </div>
        </div>
   </div>
           <script src="Scripts/alert.js" type="text/javascript"></script>