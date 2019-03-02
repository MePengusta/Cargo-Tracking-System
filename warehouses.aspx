<%@ Page Language="C#" AutoEventWireup="true" CodeFile="warehouses.aspx.cs" Inherits="warehouses" %>

<!DOCTYPE html >

<html style="overflow-x:hidden">
<head>

<title>Rush Admin Panel</title>
<link href="https://fonts.googleapis.com/css?family=Lemonada" rel="stylesheet">
    <link href="Style/styleWarehouses.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        
                
        .style6
        {
            height: 50px;
        }
        .style8
        {
            width: 128px;
            height: 11px;
        }
        .style10
        {
            height: 11px;
        }
        .style16
        {
            text-align: center;
            height: 49px;
        }
        .auto-style16
        {
            text-align: left;
        }
        .style18
        {
            text-align: center;
            height: 52px;
        }
        .style22
        {
            height: 35px;
        }
        .style24
        {
            width: 128px;
            height: 35px;
        }
        .style26
        {
            height: 11px;
            width: 143px;
        }
        .style27
        {
            width: 143px;
            height: 35px;
        }
        .style28
        {
            text-align: left;
            height: 35px;
        }
        .style29
        {
            width: 224px;
            height: 35px;
        }
        .style30
        {
            width: 92px;
            height: 35px;
        }
    </style>
</head>

<body style="margin: 0px; padding: 0px; font-family: 'Trebuchet MS',verdana;">
    
    
<table width="100%" style="height: 100%;" cellpadding="10" cellspacing="0" border="0">
<tr>

<!-- ============ HEADER SECTION ============== -->
<td colspan="2" id="head" class="style6"><h1>WAREHOUSES</h1></td></tr>

<tr>
<!-- ============ LEFT COLUMN (MENU) ============== -->
<td width="20%" valign="top" bgcolor="#2B2B2B">
<form id="form1"  runat = "server">
<asp:Button ID="menuBut" runat="server"  
    class="action-button shadow animate red" Text="MAIN MENU" Width="95%" 
    Height = "50px"  style="text-align: center" onclick="menuBut_Click" 
    CausesValidation="False" /><br>
<asp:Button ID="warehouseButton" runat="server"  class="action-button shadow animate red" Text="WAREHOUSES" Width="95%" Height = "50px"  style="text-align: center" onclick="warehouseButton_Click" CausesValidation="False" /><br>
<asp:Button ID="orderButton" runat="server" class="action-button shadow animate red" Text="ORDER CARGO" Width="95%" Height = "50px" style="text-align: center" OnClick="orderButton_Click" CausesValidation="False" /><br>
<asp:Button ID="clientsButton" runat="server" class="action-button shadow animate red" Text="CLIENTS" Width="95%" Height = "50px" style="text-align: center" OnClick="clientsButton_Click" CausesValidation="False" /><br>
<asp:Button ID="viewButton" runat="server" class="action-button shadow animate red" Text="VIEW CARGO" Width="95%" Height = "50px" style="text-align: center" OnClick="viewButton_Click" CausesValidation="False" /><br>
<asp:Button ID="logoutButton" runat="server" 
    class="action-button shadow animate red" Text="LOGOUT" Width="95%" 
    Height = "50px" style="text-align: center" CausesValidation="False" 
    onclick="logoutButton_Click" />
</td>

<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
<td width="70%" valign="top " bgcolor="#d2d8c7">

    <div>
        <asp:Panel ID="warehousePanel" runat="server" Visible="True" Width="542px" 
            HorizontalAlign="Center">
            <table class="auto-style10" >
              <tr>
                    <td class="style18" colspan="3" bgcolor="#993333"><strong>ADD WAREHOUSE</strong></td>
                </tr>
                <tr>
                    <td class="style22">
                        City :</td>
                    <td class="style24">
                        <asp:DropDownList ID="ddlCity" runat="server" Height="32px" Width="126px">
                            <asp:ListItem>İstanbul</asp:ListItem>
                            <asp:ListItem>Ankara</asp:ListItem>
                            <asp:ListItem>İzmir</asp:ListItem>
                            <asp:ListItem>Bursa</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style27">
                        <asp:RequiredFieldValidator ID="cityRegex" runat="server" 
                            ControlToValidate="ddlCity" ErrorMessage="Choose a city !" 
                            InitialValue="0"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style22">Place :</td>
                    <td class="style24">
                        <asp:TextBox ID="txtPlace" runat="server" Height="30px"></asp:TextBox>
                    </td>
                    <td class="style27">
                        <asp:RequiredFieldValidator ID="placeRegex" runat="server" 
                            ControlToValidate="txtPlace" ErrorMessage="Type a Place !"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style22">Supervisor Name :</td>
                    <td class="style24">
                        <asp:TextBox ID="supervisorBox" runat="server" Height="30px"></asp:TextBox>
                    </td>
                    <td class="style27">
                        <asp:RequiredFieldValidator ID="supervisorRegex" runat="server" 
                            ControlToValidate="supervisorBox" ErrorMessage="Type a Supervisor"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style22">Capacity :</td>
                    <td class="style24">
                        <asp:TextBox ID="capacityBox" runat="server" Height="30px"></asp:TextBox>
                    </td>
                    <td class="style27">
                        <asp:RequiredFieldValidator ID="capacityRegex" runat="server" 
                            ControlToValidate="capacityBox" ErrorMessage="Type Capacity !"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style22">Phone Number :</td>
                    <td class="style24">
                        <asp:TextBox ID="phoneBox" runat="server" Height="30px"></asp:TextBox>
                    </td>
                    <td class="style27">
                        <asp:RegularExpressionValidator ID="phoneRegex" runat="server" 
                            ControlToValidate="phoneBox" ErrorMessage="Type Number !" 
                            
                            ValidationExpression="^\(\d{3}\) ?\d{3}( |-)?\d{4}|^\d{3}( |-)?\d{3}( |-)?\d{4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                    </td>
                    <td class="style8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" 
                            Text="ADD" Font-Bold="True" Height="54px" Width="77px" />
                    </td>
                    <td class="style26">
                        <asp:Label ID="lblinfo" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>

                        <br />
                        <asp:GridView ID="warehouseGrid" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                            HorizontalAlign="Center" 
            onselectedindexchanged="warehouseGrid_SelectedIndexChanged1" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="ID" />
                                <asp:BoundField DataField="place" HeaderText="Place" SortExpression="place" />
                                <asp:BoundField DataField="supervisorName" HeaderText="Supervisor Name" 
                                    SortExpression="supervisorName" />
                                <asp:BoundField DataField="capacity" HeaderText="Capacity" 
                                    SortExpression="capacity" />
                                <asp:BoundField DataField="phoneNo" HeaderText="Phone Number" 
                                    SortExpression="phoneNo" />
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

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" ProviderName="<%$ ConnectionStrings:dbConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [warehouseTable]"></asp:SqlDataSource>
                   

                    </div>
                    <div style="clear:both">
                        <br />
                        <br />
                        <asp:Panel ID="editWarehousePanel" runat="server">
                    </asp:Panel>
                    <asp:Panel ID="editPanel" runat="server" Visible="False" HorizontalAlign="Center" 
                            Width="467px">
                        <table class="auto-style10">
                            <tr>
                                <td class="style16" colspan="3" bgcolor="#993333"><strong style="text-align: center">EDIT OR DELETE 
                                    WAREHOUSE</strong></td>
                            </tr>
                            <tr>
                                <td class="style28">Place : </td>
                                <td class="style29">
                                    <asp:TextBox ID="editPlaceBox" runat="server" Enabled="False" Width="222px" 
                                        Height="30px"></asp:TextBox>
                                </td>
                                <td class="style30">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="editPlaceBox" ErrorMessage="Type Place !" 
                                        ValidationGroup="editGroup"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style28">Supervisor Name :</td>
                                <td class="style29">
                                    <asp:TextBox ID="editSupervisorBox" runat="server" Width="222px" Height="30px"></asp:TextBox>
                                </td>
                                <td class="style30">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="editSupervisorBox" ErrorMessage="Type Supervisor !" 
                                        ValidationGroup="editGroup"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style28">Capacity :</td>
                                <td class="style29">
                                    <asp:TextBox ID="editCapacityBox" runat="server" Width="222px" Height="30px"></asp:TextBox>
                                </td>
                                <td class="style30">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="editCapacityBox" ErrorMessage="Type Capacity !" 
                                        ValidationGroup="editGroup"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style28">Phone Number :</td>
                                <td class="style29">
                                    <asp:TextBox ID="editPhoneBox" runat="server" Width="222px" Height="30px"></asp:TextBox>
                                </td>
                                <td class="style30">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="editPhoneBox" ErrorMessage="Invalid No !" 
                                        ValidationExpression="^\(\d{3}\) ?\d{3}( |-)?\d{4}|^\d{3}( |-)?\d{3}( |-)?\d{4}" 
                                        ValidationGroup="editGroup"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style22"></td>
                                <td class="style29">
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="editSubmitButton" runat="server" 
                                        OnClick="editSubmitButton_Click" Text="EDIT" ValidationGroup="editGroup" 
                                        Height="35px" Width="70px" Font-Bold="True" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="deleteButton" runat="server" OnClick="deleteButton_Click" 
                                        Text="DELETE" ValidationGroup="editGroup" Height="35px" Width="70px" 
                                        Font-Bold="True" />
                                </td>
                                <td class="style30">
                                    </td>
                            </tr>
                        </table>
                    </asp:Panel>
                        <br />
                        <br />
    </div>

    </form>
    </table>
<!-- ============ FOOTER SECTION ============== -->

 <div style="clear:both"></div>
</body>
    </html>




                        
                        
                        
                        









