<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clients.aspx.cs" Inherits="clients" %>

<!DOCTYPE html>

<html style="overflow-x:hidden">
<head id="Head1" runat = "server">

<title>Rush Admin Panel</title>
<link href="https://fonts.googleapis.com/css?family=Lemonada" rel="stylesheet">
    <link href="Style/styleClients.css" rel="stylesheet" type="text/css" />
    

    <style type="text/css">
         .style6
        {
            height: 418px;
            width: 70%;
        }
        .style7
        {
            height: 40px;
        }
        .style9
        {
            height: 418px;
            width: 20%;
        }

        .style10
        {
            height: 45px;
        }
        .style11
        {
            height: 45px;
        }

        .style13
        {
            height: 45px;
            text-align: center;
        }

        .style14
        {
            height: 45px;
            width: 211px;
        }

        .style15
        {
            height: 49px;
            text-align: center;
        }
        .style18
        {
            height: 39px;
        }
        .style19
        {
            height: 49px;
        }

        .style20
        {
            height: 39px;
            width: 184px;
        }
        .style21
        {
            height: 49px;
            width: 193px;
        }
        .style22
        {
            width: 184px;
        }
        .style23
        {
            height: 39px;
            width: 193px;
        }
        .style24
        {
            width: 193px;
        }

    </style>
</head>

<body style="margin: 0px; padding: 0px; font-family: 'Trebuchet MS',verdana;">
    
    
<table width="100%" style="height: 100%;" cellpadding="10" cellspacing="0" 
        border="0">

<!-- ============ HEADER SECTION ============== -->
<tr>

<td colspan="2" id="head" class="style7"><h1>CLIENTS</h1></td></tr>

<tr>
<!-- ============ LEFT COLUMN (MENU) ============== -->
<td valign="top" bgcolor="#2B2B2B" class="style9">
<form id="form2" runat = "server">
 <asp:Button ID="mainBut" runat="server" class="action-button shadow animate red" Text="MAIN MENU" Width="95%" Height = "50px" style="text-align: center" CausesValidation="False" onclick="mainBut_Click" />
 <asp:Button ID="butWarehouse" runat="server" class="action-button shadow animate red" Text="WAREHOUSES" Width="95%" Height = "50px" style="text-align: center" onclick="butWarehouse_Click" CausesValidation="False" />
 <asp:Button ID="butOrder" runat="server" class="action-button shadow animate red" Text="ORDER CARGO" Width="95%" Height = "50px" OnClick="butOrder_Click" CausesValidation="False" />
 <asp:Button ID="butClients" runat="server" class="action-button shadow animate red" Text="CLIENTS" Width="95%" Height = "50px" OnClick="butClients_Click" CausesValidation="False"/>
 <asp:Button ID="butView" runat="server" class="action-button shadow animate red" Text="VIEW CARGO" Width="95%" Height = "50px" OnClick="butView_Click" CausesValidation="False"/>
 <asp:Button ID="butLogout" runat="server" class="action-button shadow animate red" Text="LOGOUT" Width="95%" Height = "50px" OnClick="butLogout_Click" CausesValidation="False"/></td>

<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
<td valign="top" bgcolor="#d2d8c7" class="style6">
<table class="auto-style1">
            <tr>
                <td class="style13" colspan="3" bgcolor="#993333"><strong>ADD CLIENT</strong></td>
            </tr>
            <tr>
                <td class="style10">Name &amp; Surname : </td>
                <td class="style10">
                    <asp:TextBox ID="nameBox" runat="server" Height="30px" Width="129px"></asp:TextBox>
                </td>
                <td class="style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nameBox" ErrorMessage="Name Surname is Required !"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style10">Phone Number :</td>
                <td class="style10">
                    <asp:TextBox ID="phoneBox" runat="server" Height="30px"></asp:TextBox>
                </td>
                <td class="style14">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="phoneBox" ErrorMessage="Type Valid Phone Number" 
                        ValidationExpression="^\(\d{3}\) ?\d{3}( |-)?\d{4}|^\d{3}( |-)?\d{3}( |-)?\d{4}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style10">Address : </td>
                <td class="style10">
                    <asp:TextBox ID="addressBox" runat="server" Height="50px"></asp:TextBox>
                </td>
                <td class="style14">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="addressBox" ErrorMessage="Address is Required !"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style10">E-Mail :</td>
                <td class="style10">
                    <asp:TextBox ID="mailBox" runat="server" Height="30px"></asp:TextBox>
                </td>
                <td class="style14">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                        ControlToValidate="mailBox" ErrorMessage="Type Valid E-Mail !" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style11"></td>
                <td class="style11">
                    &nbsp;&nbsp;<asp:Button 
                        ID="Button1" runat="server" OnClick="submitButton_Click" 
                        Text="ADD" Height="33px" Width="101px" Font-Bold="True" />
                </td>
                <td class="style14"></td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="clientGrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnSelectedIndexChanged="clientGrid_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="nameSurname" HeaderText="Name Surname" SortExpression="nameSurname" />
                <asp:BoundField DataField="phoneNumber" HeaderText="Phone Number" SortExpression="phoneNumber" />
                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                <asp:BoundField DataField="mailAddress" HeaderText="Mail Address" SortExpression="mailAddress" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" ProviderName="<%$ ConnectionStrings:dbConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [clientList]"></asp:SqlDataSource>
        <asp:Panel ID="Panel3" runat="server">
            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="editPanel" runat="server" Visible="False">
            <table class="auto-style1">
                <tr>
                    <td class="style15" colspan="3" bgcolor="#993333"><strong>EDIT OR DELETE CLIENT</strong></td>
                </tr>
                <tr>
                    <td class="style18">
                        ID :
                    </td>
                    <td class="style23">
                        <asp:TextBox ID="idBox" runat="server" Enabled="False" Height="30px" 
                            Width="181px"></asp:TextBox>
                    </td>
                    <td class="style18">
                        </td>
                </tr>
                <tr>
                    <td class="style18">Name Surname : </td>
                    <td class="style23">
                        <asp:TextBox ID="nameEditBox" runat="server" Height="30px" Width="182px"></asp:TextBox>
                    </td>
                    <td class="style18">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="nameEditBox" ErrorMessage="Name Surname is Required !" ValidationGroup="editGroup"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style18">Phone Number : </td>
                    <td class="style23">
                        <asp:TextBox ID="phoneEditBox" runat="server" Height="30px" Width="182px"></asp:TextBox>
                    </td>
                    <td class="style18">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="phoneEditBox" ErrorMessage="Enter a Valid Phone Number !" ValidationExpression="^\(\d{3}\) ?\d{3}( |-)?\d{4}|^\d{3}( |-)?\d{3}( |-)?\d{4}" ValidationGroup="editGroup"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style19">Address : </td>
                    <td class="style21">
                        <asp:TextBox ID="addressEditBox" runat="server" Height="48px" Width="182px"></asp:TextBox>
                    </td>
                    <td class="style19">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="addressEditBox" ErrorMessage="Address is Required !" ValidationGroup="editGroup"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style18">Mail Address : </td>
                    <td class="style23">
                        <asp:TextBox ID="mailEditBox" runat="server" Height="30px" Width="182px"></asp:TextBox>
                    </td>
                    <td class="style18">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="mailEditBox" ErrorMessage="Enter a Valid Mail Address !" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="editGroup"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="style24">
                        <asp:Button ID="editSubmitButton" runat="server" Text="EDIT" 
                            OnClick="editSubmitButton_Click" ValidationGroup="editGroup" Font-Bold="True" 
                            Height="41px" Width="79px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="deleteButton" runat="server" CausesValidation="False" 
                            OnClick="deleteButton_Click" Text="DELETE" Font-Bold="True" Height="41px" 
                            Width="79px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="style24">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </asp:Panel>


<!-- ============ FOOTER SECTION ============== -->
</form>

</table>


</body>

</html>
