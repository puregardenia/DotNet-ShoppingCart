<%@ Page Language="C#" AutoEventWireup="true" CodeFile="All.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 117px;
        }
        .style3
        {
            width: 166px;
        }
    </style>
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function Button1_onclick() {

        }

// ]]>
    </script>
</head>
<body style="width: 636px; height: 191px;">
    <form id="form1" runat="server">
    <div style="height: 192px; width: 633px;" dir="ltr"">
    
        <table class="style1">
            <tr>
                <td class="style2" align="left">
                    添加教员信息：</td>
                <td class="style3" align="left">
                    &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" align="left">
                    编号：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="txt_id" runat="server"></asp:TextBox>
                </td>
                <td align="left">
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
                <td class="style2" align="left">
                    姓名：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        ControlTovalidate="txt_name"
                        runat="server" 
                        ErrorMessage="姓名不能为空" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2" align="left">
                    职称：</td>
                <td class="style3" align="left">
                    <asp:DropDownList ID="ddl_job" runat="server">
                        <asp:ListItem Selected="True" Value="讲师"></asp:ListItem>
                        <asp:ListItem Value="副教授">副教授</asp:ListItem>
                        <asp:ListItem>教授</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" align="left">
                    办公室：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="txt_loc" runat="server"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"   
                        ControlTovalidate="txt_loc" runat="server" 
                        ErrorMessage="办公室不能为空" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2" align="left">
                    学院：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="txt_college" runat="server"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"   
                        ControlTovalidate="txt_college" runat="server" 
                        ErrorMessage="学院不能为空" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2" align="left">
                    电子邮箱：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                </td>
                <td align="left">
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
                <td class="style2" align="left">
                    <asp:Button ID="bt_query" runat="server" onclick="bt_query_Click" Text="查询" 
                        Width="40px" CausesValidation="False" Height="20px" />
                </td>
                <td class="style3" align="left">
                    <asp:Button ID="bt_change" runat="server" onclick="bt_change_Click" Text="修改" 
                        Height="20px" Width="40px" />
                &nbsp;&nbsp;
                    <asp:Button ID="bt_delete" runat="server" Text="删除" CausesValidation="False" 
                        onclick="bt_delete_Click" Height="20px" Width="40px" />
                </td>
                <td align="left">
                    <asp:Button ID="bt_new" runat="server" Text="新建" onclick="bt_back_Click" 
                        Width="40px" Height="20px" />
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
