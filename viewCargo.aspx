<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewCargo.aspx.cs" Inherits="viewOrder" %>
<!DOCTYPE html>

<html style="overflow-x:hidden">
<head id="Head1" runat = "server">

<title>Rush Admin Panel</title>
<link href="https://fonts.googleapis.com/css?family=Lemonada" rel="stylesheet">
    <link href="Style/styleViewCargo.css" rel="stylesheet" type="text/css" />
    

    <style type="text/css">
         .style6
        {
            height: 413px;
            width: 70%;
        }
        .style7
        {
            height: 40px;
        }
        .style9
        {
            height: 413px;
            width: 20%;
        }

        .style10
        {
            text-align: center;
            height: 66px;
        }
        .style11
        {
            height: 97px;
        }

    </style>
</head>

<body style="margin: 0px; padding: 0px; font-family: 'Trebuchet MS',verdana;">
    
    
<table width="100%" style="height: 100%;" cellpadding="10" cellspacing="0" border="0">

<!-- ============ HEADER SECTION ============== -->
<tr>

<td colspan="2" id="head" class="style7"><h1>VIEW CARGO</h1></td></tr>

<tr>
<!-- ============ LEFT COLUMN (MENU) ============== -->
<td valign="top" bgcolor="#2B2B2B" class="style9">
<form id="form2" runat = "server">
<asp:Button ID="menuBut" runat="server" 
    class="action-button shadow animate red" Text="MAIN MENU" Width="95%" 
    Height = "50px" onclick="menuBut_Click"/>
 <asp:Button ID="warehouseButton" runat="server" class="action-button shadow animate red" Text="WAREHOUSES" Width="95%" Height = "50px" onclick="warehouseButton_Click" />
 <asp:Button ID="orderButton" runat="server" class="action-button shadow animate red" Text="ORDER CARGO" Width="95%" Height = "50px" onclick="orderButton_Click" />
 <asp:Button ID="clientsButton" runat="server" class="action-button shadow animate red" Text="CLIENTS" Width="95%" Height = "50px" onclick="clientsButton_Click" />
 <asp:Button ID="viewButton" runat="server" class="action-button shadow animate red" Text="VIEW CARGO" Width="95%" Height = "50px" onclick="viewButton_Click"/>
 <asp:Button ID="logoutButton" runat="server" class="action-button shadow animate red" Text="LOGOUT" Width="95%" Height = "50px" onclick="logoutButton_Click" />
    </td>
 </td>
<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
<td valign="top" class="style6" bgcolor="#d2d8c7">
<asp:GridView ID="orderGrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnSelectedIndexChanged="orderGrid_SelectedIndexChanged">
						<AlternatingRowStyle BackColor="White" />
						<Columns>
							<asp:CommandField ShowSelectButton="True" />
							<asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
							<asp:BoundField DataField="orderID" HeaderText="order ID" SortExpression="orderID" />
							<asp:BoundField DataField="fromLocation" HeaderText="From" SortExpression="fromLocation" />
							<asp:BoundField DataField="toLocation" HeaderText="To" SortExpression="toLocation" />
							<asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
							<asp:BoundField DataField="clientName" HeaderText="Client Name" SortExpression="clientName" />
						</Columns>
						<EditRowStyle BackColor="#2461BF" />
						<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
						<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
						<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
						<RowStyle BackColor="#EFF3FB" />
						<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
						<SortedAscendingCellStyle BackColor="#F5F7FB" />
						<SortedAscendingHeaderStyle BackColor="#6D95E1" />
						<SortedDescendingCellStyle BackColor="#E9EBEF" />
						<SortedDescendingHeaderStyle BackColor="#4870BE" />
					</asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" ProviderName="<%$ ConnectionStrings:dbConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [ordersTable]"></asp:SqlDataSource>

                    <asp:Panel ID="Panel3" runat="server" Visible="False">
            <table class="auto-style1">
                <tr>
                    <td class="style10" bgcolor="#993333" colspan="3"><strong>EDIT OR DELETE CARGO</strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        ID :</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="idBox" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="idBox" ErrorMessage="Type ID !"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Order ID :</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="orderBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="orderBox" ErrorMessage="Type OrderID !"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">From :</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="fromText" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="fromText" ErrorMessage="Type Where From !"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">To :</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="toList" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="toList" ErrorMessage="Select Where To"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Price :</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="priceBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="priceBox" ErrorMessage="Type Price !"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style11"></td>
                    <td class="style11">
                        <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" Text="SUBMIT" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="deleteButton" runat="server" OnClick="deleteButton_Click" 
                            style="text-align: left" Text="DELETE" />
                    </td>
                    <td style="text-align: left" class="style11">
                    </td>
                </tr>
            </table>          
        </asp:Panel>
    <br />
    <br />
</form>

</table>


</body>

</html>

