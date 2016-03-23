<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mail.aspx.cs" Inherits="FleaMarket.Mail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        你的邮箱：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>（建议使用QQ邮箱）
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="发件人没有填写" ControlToValidate="TextBox1"></asp:RequiredFieldValidator><br /><br />
        邮箱密码：<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>（仅供发送所需，我们不做任何形式的获取，请你放心使用）<br /><br />
        目标邮箱：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br /><br />
        主题：&nbsp&nbsp;&nbsp&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br />
        内容：&nbsp;&nbsp;&nbsp&nbsp;<textarea id="TxtContent" runat="server" rows="10" style="width:480px;overflow-y:visible;"></textarea><asp:RequiredFieldValidator
            ID="RequiredFieldValidator2" runat="server" ErrorMessage="内容为空" ControlToValidate="TxtContent"></asp:RequiredFieldValidator><br /><br />
        &nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" style="width: 99px; height: 35px; background:#00A1F2; cursor:pointer; color:#ffffff; font-size:18px;" OnClick="Button1_Click" Text="发送" />
    </div>
    </form>
</body>
</html>
