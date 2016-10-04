<%@ Page Language="C#" AutoEventWireup="true" CodeFile="update.aspx.cs" Inherits="update" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            width: 49%;
        }
        .style3
        {
            width: 166px;
        }
        .style5
        {
            width: 166px;
            height: 23px;
        }
        .style6
        {
            height: 23px;
            width: 542px;
        }
        .style7
        {
            width: 542px;
        }
        .style8
        {
            width: 294px;
        }
        .style9
        {
            width: 294px;
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 233px; width: 1315px;" dir="ltr"" align="center">
    
        <table class="style1">
            <tr>
                <td class="style8" align="left">
                    添加教员信息：</td>
                <td class="style3" align="left">
                    &nbsp;</td>
                <td align="left" class="style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8" align="left">
                    编号：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="txt_id" runat="server"></asp:TextBox>
                </td>
                <td align="left" class="style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                        ControlTovalidate="txt_id"
                        runat="server" 
                        ErrorMessage="编号不能为空" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="txt_id" ErrorMessage="2005001-2005999" 
                        MaximumValue="2005999" MinimumValue="2005001"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="style8" align="left">
                    姓名：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                </td>
                <td align="left" class="style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        ControlTovalidate="txt_name"
                        runat="server" 
                        ErrorMessage="姓名不能为空" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8" align="left">
                    职称：</td>
                <td class="style3" align="left">
                    <asp:DropDownList ID="ddl_job" runat="server">
                        <asp:ListItem Selected="True" Value="讲师"></asp:ListItem>
                        <asp:ListItem Value="副教授">副教授</asp:ListItem>
                        <asp:ListItem>教授</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" class="style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8" align="left">
                    办公室：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="txt_loc" runat="server"></asp:TextBox>
                </td>
                <td align="left" class="style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"   
                        ControlTovalidate="txt_loc" runat="server" 
                        ErrorMessage="办公室不能为空" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style9" align="left">
                    学院：</td>
                <td class="style5" align="left">
                    <asp:TextBox ID="txt_college" runat="server"></asp:TextBox>
                </td>
                <td align="left" class="style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"   
                        ControlTovalidate="txt_college" runat="server" 
                        ErrorMessage="学院不能为空" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8" align="left">
                    电子邮箱：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                </td>
                <td align="left" class="style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txt_email" ErrorMessage="邮箱不能为空"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  
                        ControlTovalidate="txt_email" runat="server" 
                        ErrorMessage="请输入正确的邮箱" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ForeColor="#FF0066"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style8" align="left">
                    &nbsp;</td>
                <td class="style3" align="left">
                    <asp:Button ID="bt_change" runat="server" onclick="bt_change_Click" Text="修改" 
                        Height="20px" Width="40px" />
                </td>
                <td align="left" class="style7">
                    <asp:Button ID="bt_back" runat="server" onclick="bt_back_Click" Text="返回" />
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
