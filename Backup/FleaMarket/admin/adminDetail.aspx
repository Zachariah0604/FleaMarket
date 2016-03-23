<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDetail.aspx.cs" Inherits="FleaMarket.admin.adminDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript">
        function openwin(id) {
            var window_width = 540;
            var window_height = 530;
            var window_top = (screen.height - window_height) / 2;
            var window_left = (screen.width - window_width) / 2;
            newWindow = window.open("../DetailPic.aspx?Picid=" + id + "", "", "height=" + window_height + ",width=" + window_width + ",left=" + window_left + ",top=" + window_top + ",resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no");
            newWindow.focus();
        }
		</script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Repeater ID="CommodityDetail11" runat="server"  >
           <ItemTemplate>
			    <div id="goods">
				<div class="title"><span style=" margin-top:10px; float:left; margin-left:5px;">基本信息</span></div>
					<div class="content">
                   
						<div class="cLeft">
                            <img src='<%# (DataBinder.Eval(Container.DataItem,"PicPath").ToString ()) %>' width="295" height="320" onclick ="openwin(<%# DataBinder.Eval(Container.DataItem,"commodityID") %>)" title ="单击放大" style =" cursor :hand; margin-left:5px; overflow:hidden;" />
                            
                        </div>
						<div class="cRight">
                            <table width="100%" height="100%" border="0" cellspacing="5" cellpadding="5" style="text-align:right;">
                                <tr><td width="28%">主题：</td><td width="72%" style=" text-align:left;"><%# DataBinder.Eval(Container.DataItem, "title")%></td></tr>
                                <tr><td>转让价格（元）：</td><td style=" text-align:left;"><%# DataBinder .Eval (Container.DataItem ,"Price") %></td></tr>
                                <tr><td>交易（物品丢失/拾取）地点：</td><td style=" text-align:left;"><%# DataBinder .Eval (Container.DataItem ,"Address") %></td></tr>
                                <tr><td>物品类型：</td><td style=" text-align:left;"><%# DataBinder .Eval (Container.DataItem ,"BuySell") %></td></tr>
                                <tr><td>点击率：</td><td style=" text-align:left;"><%# DataBinder.Eval(Container.DataItem, "ClickCount")%></td></tr>
                                <tr><td>结束时间：</td><td style="text-align:left"><%# DataBinder.Eval(Container.DataItem, "ProTimeEnd","{0:yyyy-MM-dd}")%></td></tr>
                                <tr><td>姓名：</td><td style=" text-align:left;"><%# DataBinder.Eval(Container.DataItem, "ReleaseName")%></td></tr>
                                <tr><td>联系电话：</td><td style=" text-align:left;"><%# DataBinder .Eval (Container.DataItem ,"Phone") %></td></tr>
                                <tr><td>QQ号：</td><td style=" text-align:left;"><a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=<%# DataBinder .Eval (Container.DataItem ,"QQ") %>&Menu=yes><%# DataBinder .Eval (Container.DataItem ,"QQ") %>&nbsp;&nbsp;【立即与TA交谈】</a></td></tr>
                                <tr><td>邮箱：</td><td style=" text-align:left;"><a href='Mail.aspx?ToMail=<%#DataBinder.Eval(Container.DataItem, "Email").ToString() %>'  onclick="window.open(this.href,'_blank','scrollbars=0,resizable=0,width=700px,height=530px');return false"><%# DataBinder.Eval(Container.DataItem, "Email")%>&nbsp;&nbsp;【给TA发送邮件】</a></td></tr>
                            </table>
                        </div>
                        
					</div>
			</div>
			    <div id="detail">
                <span style=" margin-top:-30px; float:left; margin-left:5px;font-size:16px; color:#fff; ">详细介绍</span>
                <span style=" margin-top:10px; float:left; text-indent:2em;"><%# DataBinder .Eval (Container.DataItem ,"content") %></span>
                </div>
                </ItemTemplate>
          </asp:Repeater>
    </form>
</body>
</html>
