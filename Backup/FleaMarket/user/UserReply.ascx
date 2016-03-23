<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserReply.ascx.cs" Inherits="FleaMarket.user.UserReply" %>
<link href="../Styles/User.css" rel="Stylesheet" type="text/css" />
<div style="width:1098px; font-size:14px; float:left; border:1px #0090ff solid; ">
    <table style=" width:100%; display:block;">
        <tr>
            <td width="180px">昵称:</td>
            <td width="480px"><asp:TextBox ID="TxtNiCheng" runat="server" class="Input"></asp:TextBox></td>
            <td width="150px"><asp:RequiredFieldValidator  ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入标题" ControlToValidate="TxtNiCheng"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
                            <td>*验证码</td>
                            <td><asp:TextBox ID="txtCheckCode" runat="server"></asp:TextBox><img src="CheckImage.aspx" alt="校验码" />&nbsp;&nbsp;(让我们知道你不是机器人) </td>
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCheckCode" ErrorMessage="校验码必填"></asp:RequiredFieldValidator></td>
                        </tr>
        <tr>
            <td width="180px">留言内容:</td>
            <td width="480px"><textarea id="TxtContent" rows="6" style="width:480px;overflow-y:visible;" runat ="server"></textarea></td>
            <td width="150px"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="请填写留言内容" ControlToValidate ="TxtContent"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td width="180px"></td>
            <td width="480px"><asp:Button ID="SubmitButton" runat="server" Text="留言" OnClick="SubmitButton_Click" class="bt" /></td>
            <td width="150px"></td>
        </tr>
    </table>
</div>