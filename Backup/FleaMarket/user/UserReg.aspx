<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserReg.aspx.cs" Inherits="FleaMarket.user.UserReg" %>
<%@ Register TagPrefix="FleaMarketUserHead" TagName="userhead" Src="~/user/UserHead.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户注册--山东理工大学跳蚤市场</title>
    <link href="../Styles/User.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <FleaMarketUserHead:userhead ID="userhead" runat="server" />
    <div style=" width:1100px; margin:10px auto;">
        <div style=" float:left; width:670px; height:415px;">
            <div class="regtitle"><font>服务总则:</font></div>
            <div class="Regrule"><iframe scrolling="yes" allowtransparency="true" width="100%" height="100%" src="../Rules.html" frameborder="0"></iframe></div>
        </div>
        <div style=" float:left; width:428px; border:1px solid #D1D1D4;">
            <table width="100%" cellpadding="5" cellspacing="5" border="0">
            <tr>
                <td style="width:100px">姓名*</td>
                <td style="width:170px"><input id="TxtName" type="text" runat ="server"  /></td>
                <td><asp:RequiredFieldValidator ID="rvName" runat="server" EnableClientScript="true" ControlToValidate ="TxtName" Text ="用户名必须填"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width:100px">密码*</td>
                <td><input id="TxtPassword" type="password" runat ="server" /></td>
                <td><asp:RequiredFieldValidator ID="rvPassword" runat="server" EnableClientScript="true" ControlToValidate ="TxtPassword" Text ="密码必须填"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width:100px">确认密码*</td>
                <td><input id="TxtConfirmPassword" type="password" runat ="server"/></td>
                <td><asp:RequiredFieldValidator ID="rvConfirm" runat="server" EnableClientScript="true" ControlToValidate ="TxtConfirmPassword" Text ="密码不一致"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width:100px">手机号码</td>
                <td><input id="TxtPhone" type="text" runat ="server"/></td>
                <td><asp:RangeValidator ID="rvPhone" runat="server" ErrorMessage="请输入正确的手机号" ControlToValidate ="TxtPhone" Type ="Double" MinimumValue="13000000000" MaximumValue="20000000000"></asp:RangeValidator></td>
            </tr>
            <tr>
                <td style="width:100px">性别</td>
                <td>
                    <select id="Sex" runat ="server">
                        <option value="男">男</option>
				        <option value="女">女</option>
                    </select>
                 </td>
                <td></td>
            </tr>
            <tr>
                <td style="width:100px">学号*</td>
                <td><input id="TxtNumber" type="text" runat ="server"/></td>
                <td><asp:RequiredFieldValidator ID="rvNumber" runat="server" EnableClientScript="true" ControlToValidate ="TxtNumber" Text ="学号能不缺少"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width:100px">QQ号</td>
                <td><input id="TxtQQ" type="text" runat ="server"/></td>
                <td></td>
            </tr>
            <tr>
                <td style="width:100px">电子邮件*</td>
                <td><input id="TxtEMail" type="text" runat ="server"/></td>
                <td><asp:RegularExpressionValidator ID="rvMail" runat="server" ErrorMessage="(E-Mail格式错误!)" ControlToValidate ="TxtEMail" ValidationExpression="^[a-zA-Z0-9]{1,}@[a-zA-Z0-9]{1,}\.(com|net|org|edu|mil|cn|cc)$"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                            <td>*验证码</td>
                            <td><asp:TextBox ID="txtCheckCode" runat="server" Width="70px"></asp:TextBox><img src="../CheckImage.aspx" alt="校验码" /> </td>
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCheckCode" ErrorMessage="校验码必填"></asp:RequiredFieldValidator></td>
                        </tr>
            <tr>
                <td><asp:Button ID="RegButton" runat="server" class="bt" Text="注册" OnClick="RegButton_Click" /></td>
                <td><asp:Button ID="CancelButton" runat="server" class="bt" OnClick="CancelButton_Click" Text="重置" CausesValidation="False" /></td>
                <td><asp:Button ID="BackButton" runat="server" class="bt" Text="返回上页" CausesValidation="False" OnClick="BackButton_Click" /></td>
            </tr>
        </table>
        </div>
    </div>
    <iframe scrolling="no" allowtransparency="true" width="100%" height="80px;" src="../footer.html" frameborder="0"></iframe>
    </form>
</body>
</html>
