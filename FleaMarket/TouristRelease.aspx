<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouristRelease.aspx.cs" Inherits="FleaMarket.TouristRelease" %>
<%@ Register TagPrefix="FleaMarketHead" TagName="head" Src="~/head.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>游客发布--山东理工大学跳蚤市场</title>
    <link href="Styles/User.css" rel="Stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript" src="Scripts/tcal.js"></script>
    <script type="text/javascript" src="Scripts/sort.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <FleaMarketHead:head ID="head" runat="server" />
            <div class="Rmiddle">
                <div class="REleft">
                    <iframe scrolling="no" allowtransparency="true" width="100%" height="380px" src="hot.aspx" frameborder="0"></iframe> 
                <iframe scrolling="no" allowtransparency="true" width="100%" height="260px" src="Link.html" frameborder="0"></iframe> 
                </div>
                <div class="REright">
                    <div class="Releasetitle"><font>游客发布:</font></div>
                    <div class="Release">
                    <table>
                        <tr>
                            <td width="180px">*标题:</td>
                            <td width="480px"><input type="text" id="TxtTitle" runat="server" class="Input" /></td>
                            <td width="150px"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="标题必须填写" ControlToValidate ="TxtTitle" SetFocusOnError="false"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>*类型与类别:</td>
                            
                            <td width="480px"><select id="BuySell" runat="server"><option value="出售">出售</option><option value="求购">求购</option><option value="失物招领">失物招领</option><option value="寻物启事">寻物启事</option></select>&nbsp;&nbsp;&nbsp;<select id="FKind" runat="server" onchange="refreshModelList()"><option></option></select>&nbsp;&nbsp;&nbsp;<select id="SKind"  runat="server"></select></td>
                            <td></td>
                        </tr>
                        
                        <tr>
                            <td>交易（物品丢失/拾取）地址:</td>
                            <td width="480px"><input type="text" id="TxtAddress" runat="server" class="Input" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>*上传图片:</td>
                            <td width="480px"><asp:FileUpload ID="PicUp" runat="server" class="Input" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>*联系人姓名:</td>
                            <td width="480px"><input type="text" id="TxtName" runat="server" class="Input" /></td>
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="姓名必须填写" ControlToValidate ="TxtName"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>*学号:</td>
                            <td width="480px"><input type="text" id="TxtStudentID" runat="server" class="Input" />让你的商品更值得信任</td>
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="学号必须填写" ControlToValidate ="TxtTitle" SetFocusOnError="false"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>*联系电话:</td>
                            <td width="480px"><input type="text" id="TxtPhone"  runat="server" class="Input" /></td>
                            <td><asp:RangeValidator ID="RangeValidator1" runat="server" Display="dynamic" ErrorMessage="请输入正确的手机号" ControlToValidate ="TxtPhone" MinimumValue="1000000" MaximumValue="99999999999" Type="double"></asp:RangeValidator></td>
                        </tr>
                        <tr>
                            <td>*电子邮箱:</td>
                            <td width="480px"><input type="text" id="TxtEmail" runat="server" class="Input" /></td>
                            <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="邮件格式错误!" ControlToValidate ="TxtEmail" ValidationExpression="^[a-z0-9A-Z]{1,}@[a-z0-9A-Z]{1,}\.(com|net|org|edu|mil|cn|cc)$"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>QQ号:</td>
                            <td width="480px"><input type="text" id="TxtQQ" runat="server" class="Input" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>转让价格:</td>
                            <td width="480px"><input type="text"  id="TxtPrice" runat="server" class="Input" />预估价格，可填面议（单位：元）</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>有效期:</td>
                            <td width="480px"><input type="text" id="TxtTime" runat="server" name="date" class="tcal" value="" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>*验证码</td>
                            <td><asp:TextBox ID="txtCheckCode" runat="server"></asp:TextBox><img src="CheckImage.aspx" alt="校验码" />&nbsp;&nbsp;(让我们知道你不是机器人) </td>
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCheckCode" ErrorMessage="校验码必填"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>*物品详细介绍:</td>
                            <td width="480px"><textarea id="TxtContent" runat="server" rows="10" style="width:480px;overflow-y:visible;"></textarea></td>
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="必须要有详细介绍" ControlToValidate ="TxtContent"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr><td colspan="3" height="10px"></td></tr>
                        <tr>
                            <td></td>
                            <td><asp:Button ID="ReleaseButton" runat="server" class="bt" Text="发布" OnClick="ReleaseButton_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="CancelButton" runat="server" class="bt" OnClick="CancelButton_Click" Text="重置" CausesValidation="False" /></td>
                            <td></td>
                        </tr>
                        
                    </table>
                </div>
                </div>
            
        </div>
        <iframe scrolling="no" allowtransparency="true" width="100%" height="80px;" src="footer.html" frameborder="0"></iframe>
    </form>
</body>
</html>
