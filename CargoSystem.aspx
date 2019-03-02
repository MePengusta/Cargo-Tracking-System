<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CargoSystem.aspx.cs" Inherits="CargoSystem" %>

<!DOCTYPE html>

<html style="overflow-x:hidden">
<head runat = "server">

<title>Rush Admin Panel</title>
<link href="https://fonts.googleapis.com/css?family=Lemonada" rel="stylesheet">
<link href="Style/styleCargoSystem.css" rel="stylesheet" type="text/css" />
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
    </style>
</head>

<body style="margin: 0px; padding: 0px; font-family: 'Trebuchet MS',verdana;">
    
    
<table width="100%" style="height: 100%;" cellpadding="10" cellspacing="0" border="0">
<tr>

<!-- ============ HEADER SECTION ============== -->
<td colspan="2" id="head" class="style7"><h1>Rush Cargo Inc. Admin Panel</h1></td></tr>

<tr>
<!-- ============ LEFT COLUMN (MENU) ============== -->
<td valign="top" bgcolor="#2B2B2B" class="style9">
<form id="form1" runat = "server">
<asp:Button ID="menuBut" runat="server" 
    class="action-button shadow animate red" Text="MAIN MENU" Width="95%" 
    Height = "50px" style="text-align: center" onclick="menuBut_Click" /><br>
 <asp:Button ID="warehouseButton" runat="server" class="action-button shadow animate red" Text="WAREHOUSES" Width="95%" Height = "50px" OnClick="warehouseButton_Click" style="text-align: center" /><br>
<asp:Button ID="orderButton" runat="server" class="action-button shadow animate red" Text="ORDER CARGO" Width="95%" Height = "50px" OnClick="orderButton_Click" /><br>
<asp:Button ID="clientsButton" runat="server" class="action-button shadow animate red" Text="CLIENTS" Width="95%" Height = "50px" OnClick="clientsButton_Click" /><br>
<asp:Button ID="viewButton" runat="server" class="action-button shadow animate red" Text="VIEW CARGO" Width="95%" Height = "50px" OnClick="viewButton_Click" /><br>
<asp:Button ID="logoutButton" runat="server" class="action-button shadow animate red" Text="LOGOUT" Width="95%" Height = "50px" OnClick="logoutButton_Click" />
    
</td>

<!-- ============ RIGHT COLUMN (CONTENT) ============== -->
<td valign="baseline" bgcolor="#d2d8c7" class="style6">

<h2>&nbsp;</h2>

    </td></tr>

<!-- ============ FOOTER SECTION ============== -->
</form>

</table>


</body>

</html>




                        
                        
                        
                        
