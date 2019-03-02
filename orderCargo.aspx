<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderCargo.aspx.cs" Inherits="orderCargo" %>
<!DOCTYPE html>

<html style="overflow-x:hidden">
<head id="Head1" runat = "server">

<title>Rush Admin Panel</title>
<link href="https://fonts.googleapis.com/css?family=Lemonada" rel="stylesheet">
    <link href="Style/styleOrder.css" rel="stylesheet" type="text/css" />

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
            text-align: center;
            height : 40px;
        }
        .style13
        {
            text-align: center;
            height: 90px;
        }
        .style14
        {
            width: 156px;
            text-align: center;
            height: 90px;
        }
        .style17
        {
            height: 30px;
        }
        .style19
        {
            width: 156px;
            text-align: center;
            height: 30px;
        }
        .style22
        {
            text-align: center;
            height: 90px;
            width: 126px;
        }
        .style23
        {
            text-align: left;
            height: 30px;
            width: 121px;
        }
        .style24
        {
            text-align: left;
            height: 30px;
            width: 126px;
        }
    </style>
</head>

<body style="margin: 0px; padding: 0px; font-family: 'Trebuchet MS',verdana;">
    
    
<table width="100%" style="height: 100%;" cellpadding="10" cellspacing="0" border="0">

<!-- ============ HEADER SECTION ============== -->
<tr>

<td colspan="2" id="head" class="style7"><h1>ORDER CARGO</h1></td></tr>

<tr>
<!-- ============ LEFT COLUMN (MENU) ============== -->
<td valign="top" bgcolor="#2B2B2B" class="style9">
<form id="form1" runat = "server">
<asp:Button ID="menuBut" runat="server" 
    class="action-button shadow animate red" Text="MAIN MENU" Width="95%" 
    Height = "50px" CausesValidation="False" style="text-align: center" 
    onclick="menuBut_Click" />
 <asp:Button ID="wherehouseBut" runat="server" class="action-button shadow animate red" Text="WAREHOUSES" Width="95%" Height = "50px" CausesValidation="False" onclick="wherehouseBut_Click1" style="text-align: center" />
 <asp:Button ID="orderBut" runat="server" class="action-button shadow animate red" Text="ORDER CARGO" Width="95%" Height = "50px" CausesValidation="False" onclick="orderBut_Click"/>
 <asp:Button ID="clientsBut" runat="server" class="action-button shadow animate red" Text="CLIENTS" Width="95%" Height = "50px" CausesValidation="False" onclick="clientsBut_Click1" />
 <asp:Button ID="viewButton" runat="server" class="action-button shadow animate red" Text="VIEW CARGO" Width="95%" Height = "50px" CausesValidation="False" onclick="viewButton_Click1" />
 <asp:Button ID="butLogout" runat="server" class="action-button shadow animate red" Text="LOGOUT" Width="95%" Height = "50px" style="text-align: center" CausesValidation="False" onclick="butLogout_Click" />
    
</td>

<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
<td valign="baseline" bgcolor="#d2d8c7" class="style6">

<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="606px">
            <table>
                <tr>
                    <td class="style10" colspan="3" bgcolor="#993333"><strong>Enter Order Informations</strong></td>
                </tr>
                <tr>
                    <td class="style17">
                        Order ID :</td>
                    <td class="style24">
                        <asp:TextBox ID="orderidText" runat="server" style="text-align: left" 
                            Height="22px" Width="109px"></asp:TextBox>
                    </td>
                    <td class="style19">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="orderidText" ErrorMessage="Order ID is Required !"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style17">From : </td>
                    <td class="style24">
                        <asp:DropDownList ID="fromList" runat="server" style="text-align: center" 
                            Height="20px" Width="115px">
                        </asp:DropDownList>
                    </td>
                    <td class="style19">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fromList" ErrorMessage="Select Location !"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style17">To : </td>
                    <td class="style24">
                        <asp:DropDownList ID="toList" runat="server" Height="20px" Width="115px">
                        </asp:DropDownList>
                    </td>
                    <td class="style19">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="toList" ErrorMessage="Select Location !"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style17">Price : </td>
                    <td class="style24">
                        <asp:TextBox ID="priceBox" runat="server" Height="22px" Width="107px"></asp:TextBox>
                        $</td>
                    <td class="style19">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="priceBox" ErrorMessage="Price Required !"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style17">
                        Client :</td>
                    <td class="style24">
                        <asp:DropDownList ID="clientList" runat="server" Height="21px" Width="115px">
                        </asp:DropDownList>
                    </td>
                    <td class="style19">
                        <asp:RequiredFieldValidator ID="clientRegex" runat="server" 
                            ControlToValidate="clientList" ErrorMessage="Select Client !"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style13"></td>
                    <td class="style22">
                        <asp:Button ID="sendButton" runat="server" OnClick="sendButton_Click" 
                            Text="ORDER" Font-Bold="True" Height="61px" Width="101px" 
                            style="text-align: center" />
                    </td>
                    <td class="style14">
                        <asp:Label ID="lblinfo" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
<!-- ============ FOOTER SECTION ============== -->
</form>

</table>


</body>

</html>

