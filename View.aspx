<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="View" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style6
        {
            width: 199px;
        }
        .style7
        {
            width: 151px;
        }
        .style8
        {
            width: 181px;
        }
        .style12
        {
            width: 378px;
        }
        .style15
        {
            width: 167px;
        }
        .style16
        {
            width: 137px;
        }
        .style17
        {
            width: 389px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1" align="center">
            <tr>
                <td class="style12">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td class="style8">
                    &nbsp;</td>
                <td class="style16">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style12">
                    &nbsp;</td>
                <td class="style15">
                    教师姓名:<asp:TextBox ID="txt_name" runat="server" Width="87px" 
                        style="margin-top: 0px"></asp:TextBox>
                </td>
                <td class="style8">
                    学院:<asp:DropDownList 
                        ID="ddl_college" runat="server" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="请选择学院">请选择学院</asp:ListItem>
                        <asp:ListItem>信息系统学院</asp:ListItem>
                        <asp:ListItem>网络空间安全学院</asp:ListItem>
                        <asp:ListItem>软件技术学院</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style16">
                    职称:<asp:DropDownList ID="ddl_job" 
                        runat="server" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="请选择职称">请选择职称</asp:ListItem>
                        <asp:ListItem>讲师</asp:ListItem>
                        <asp:ListItem>副教授</asp:ListItem>
                        <asp:ListItem>教授</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="bt_query" runat="server" Text="查询" onclick="bt_query_click" />
                </td>
            </tr>
        </table>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" 
            AutoGenerateSelectButton="True" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            DataKeyNames="id" GridLines="Horizontal" 
            HorizontalAlign="Center" PageSize="4" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField>   
                   <ItemTemplate>
                        <asp:CheckBox ID="cbSelect" runat="server" />
                   </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="序号" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="tid" HeaderText="编号" SortExpression="tid" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:BoundField DataField="college" HeaderText="学院" SortExpression="college" />
                <asp:BoundField DataField="job" HeaderText="职称" SortExpression="job" />
                <asp:HyperLinkField DataNavigateUrlFields="tid" 
                    DataNavigateUrlFormatString="query.aspx?id={0}" HeaderText="选择" Text="查看详细" />
                <asp:HyperLinkField DataNavigateUrlFields="tid" 
                    DataNavigateUrlFormatString="update.aspx?id={0}" Text="修改" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <table class="style1">
            <tr>
                <td class="style17">
                    &nbsp;</td>
                <td class="style6">
                    <asp:Button ID="bt_all" runat="server" onclick="bt_all_Click" 
                        style="margin-left: 93px" Text="全选" />
                </td>
                <td class="style7">
                    <asp:Button ID="bt_unall" runat="server" Text="取消" 
                        onclick="bt_unall_Click" style="margin-left: 38px" />
                </td>
                <td>
                    <asp:Button ID="bt_del" runat="server" Text="删除" onclick="bt_del_Click" 
                        style="margin-left: 70px" />
                </td>
            </tr>
            <tr>
                <td class="style17">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SDS_teacher" runat="server" 
            ConnectionString="<%$ ConnectionStrings:studentConnectionString %>" 
            DeleteCommand="DELETE FROM [teacher] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [teacher] ([tid], [name], [job], [location], [college], [email]) VALUES (@tid, @name, @job, @location, @college, @email)" 
            SelectCommand="SELECT * FROM [teacher]" 
            UpdateCommand="UPDATE [teacher] SET [tid] = @tid, [name] = @name, [job] = @job, [location] = @location, [college] = @college, [email] = @email WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tid" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="job" Type="String" />
                <asp:Parameter Name="location" Type="String" />
                <asp:Parameter Name="college" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="tid" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="job" Type="String" />
                <asp:Parameter Name="location" Type="String" />
                <asp:Parameter Name="college" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
    </body>
</html>
