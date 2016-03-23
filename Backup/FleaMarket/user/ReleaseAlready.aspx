<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReleaseAlready.aspx.cs" Inherits="FleaMarket.user.ReleaseAlready" %>
<%@ Register TagPrefix="FleaMarketUserHead" TagName="userhead" Src="~/user/UserHead.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我的发布信息--山东理工大学跳蚤市场</title>
<link href="../Styles/User.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <FleaMarketUserHead:userhead ID="userhead" runat="server" />
        <div id="SearchMain">
		    <div id="SearchLeft">
            <asp:Repeater ID="ReleaseAlreadyRepeater" runat="server"  >
           <ItemTemplate>
			    <div id="SearchList" onmouseover="this.id='SearchOver'" onmouseout="this.id='SearchList'">
			        <table width="100%" border="0" cellspacing="5" cellpadding="5">
  				        <tr>
    				        <td width="18%" rowspan="3"><img src="<%# DataBinder.Eval(Container.DataItem, "PicPath")%>" width="120px" height="100px" border="0" /></td>
    				        <td width="57%" style=" font-size:15px; color:#2255DD; font-weight:600"><%# DataBinder .Eval (Container.DataItem ,"title") %></td>
    				        <td width="25%" rowspan="2"><a href='../Detail.aspx?commodityID=<%#DataBinder.Eval(Container.DataItem, "commodityID").ToString() %>'  onclick="window.open(this.href,'_blank','resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no,width=900px,height=1100px');return false" class="ADetail">详细</a><asp:LinkButton class="ADetele" ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete" OnClick="btnDelete_Click" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "commodityID") %>'>删除</asp:LinkButton></td>
  				        </tr>
  				        <tr>
    				        <td><%#Limit ((string)DataBinder.Eval(Container.DataItem, "content"))%></td>
   				        </tr>
				        <tr>
    				        <td><%# DataBinder.Eval(Container.DataItem, "ReleaseName")%>/<%# DataBinder.Eval(Container.DataItem, "BuySell")%></td>
    				        <td style="text-align:left; color:#FF0000;"><%# DataBinder.Eval(Container.DataItem, "Price")%>元</td>
  				        </tr>
			        </table>
			    </div>
                </ItemTemplate>
          </asp:Repeater>
            <div style=" width:95%; float:right; height:30px; margin-right:10px; margin-top:10px; text-align:right;">
                <div id="PageInfo" runat="server" class="anpager"></div>
            </div>
			</div>
		
		<div id="SearchRight">
            <iframe scrolling="no" allowtransparency="true" width="100%" height="380px" src="../hot.aspx" frameborder="0"></iframe> 
                <iframe scrolling="no" allowtransparency="true" width="100%" height="270px" src="../Link.html" frameborder="0"></iframe> 
        </div>
	</div>
    <iframe scrolling="no" allowtransparency="true" width="100%" height="80px;" src="../footer.html" frameborder="0"></iframe>
    </form>
</body>
</html>
