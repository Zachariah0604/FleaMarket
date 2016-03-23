<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="FleaMarket.admin.AdminLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>山东理工大学跳蚤市场后台登录</title>
<style>
    body{ font-family:微软雅黑;}
    a{ text-decoration:none; color:#000;}
	#main{width:600px; height:450px; margin:100px auto; background-image:url(../images/adminlogin.png);}
	.user{ float:left; margin-left:223px; margin-top:175px; width:190px; height:49px; font-size:20px;}
	.password{float:left; margin-left:223px; width:190px; height:40px; font-size:20px;}
	.rvuser{ float:right; margin-right:20px; margin-top:175px; width:150px; height:35px; font-size:18px;}
	.rvpassword{float:right; margin-right:20px; margin-top:8px; width:150px; height:36px; font-size:18px;}
	.button{float:left; margin-left:178px;width:240px; height:45px;}
	.forget{float:left; margin-left:360px; margin-top:8px; width:140px; height:25px;}
</style>
</head>
<body>
    <form id="form1" runat="server">
        
    <div id="main">
        <div>
            <div class="user"><asp:TextBox ID="AdminNameTxt" runat="server" Width="193px" Height="35px"></asp:TextBox></div>
            <div class="rvuser"><asp:RequiredFieldValidator ID="rv1" runat="server" ErrorMessage="请先填写用户名" ControlToValidate="AdminNameTxt" Display="dynamic"></asp:RequiredFieldValidator></div>
            <div class="password"><asp:TextBox ID="AdminPwdTxt" runat="server" TextMode="Password" Width="193px" Height="36px"></asp:TextBox></div>
            <div class="rvpassword"><asp:RequiredFieldValidator ID="rv2" runat="server" ErrorMessage="请先输入密码" ControlToValidate="AdminPwdTxt" Display="dynamic"></asp:RequiredFieldValidator></div>
            <div class="forget"><asp:LinkButton ID="ReleaseAlready" runat="server" OnClick="forget_Click" CausesValidation="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:LinkButton></div>
            <div class="button"><asp:ImageButton ID="loginBt" runat="server" ImageUrl="~/images/lgon.png" OnClick="loginBt_Click" /></div>
        </div>
    </div>
    
    
   
    </form>
</body>
</html>
