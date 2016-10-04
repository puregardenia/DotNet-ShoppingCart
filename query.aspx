<%@ Page Language="C#" AutoEventWireup="true" CodeFile="query.aspx.cs" Inherits="query" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 29%;
            height: 147px;
            margin-right: 0px;
        }
        .style4
        {
            width: 71px;
        }
        .style5
        {
            width: 105px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div style="height: 173px; width: 1076px;" dir="ltr"" align="center">
    
        <table class="style1" dir="ltr">
            <tr>
                <td class="style4" align="left">
                    <asp:Label ID="Label1" runat="server" Text="编号"></asp:Label>
                </td>
                <td class="style5" align="left">
                    <asp:TextBox ID="txt_id" runat="server"></asp:TextBox>
                </td>
                </tr>
            <tr>
                <td class="style4" align="left">
                    <asp:Label ID="Label2" runat="server" Text="姓名"></asp:Label>
                </td>
                <td class="style5" align="left">
                    <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                </td>
                </tr>
            <tr>
                <td class="style4" align="left">
                    <asp:Label ID="Label3" runat="server" Text="职称"></asp:Label>
                </td>
                <td class="style5" align="left">
                    <asp:TextBox ID="txt_job" runat="server"></asp:TextBox>
                </td>
                </tr>
            <tr>
                <td class="style4" align="left">
                    <asp:Label ID="Label4" runat="server" Text="办公室"></asp:Label>
                </td>
                <td class="style5" align="left">
                    <asp:TextBox ID="txt_loc" runat="server"></asp:TextBox>
                </td>
                </tr>
            <tr>
                <td class="style4" align="left">
                    <asp:Label ID="Label5" runat="server" Text="学院"></asp:Label>
                </td>
                <td class="style5" align="left">
                    <asp:TextBox ID="txt_college" runat="server"></asp:TextBox>
                </td>
                </tr>
            <tr>
                <td class="style4" align="left">
                    <asp:Label ID="Label6" runat="server" Text="电子邮箱"></asp:Label>
                </td>
                <td class="style5" align="left">
                    <asp:TextBox ID="txt_email" runat="server" Width="143px"></asp:TextBox>
                </td>
                </tr>
        </table>
        <asp:Button ID="bt_back" runat="server" onclick="bt_back_Click" Text="back" />
    
    </div>
    </form>
</body>
</html>
