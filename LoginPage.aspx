<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title></title>
    <link href="Style/styleLogin.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">
    uname = "admin";
    pass = "admin";

    </script>
</head>
<body >
   <h1>Rush Cargo Inc.</h1>
   <form id="form1" runat="server">
    <label>
    &nbsp;<asp:TextBox type ="text" ID="userID" runat="server" placeholder ="Username"></asp:TextBox>
    
    <asp:TextBox ID="userPass" runat="server" placeholder ="Password" 
        TextMode="Password"></asp:TextBox>
&nbsp;
    <asp:Button ID="loginButton" runat="server" Text="Login" 
        onclick="loginButton_Click" />
        <asp:Button ID="butBack" runat="server" Text="Back To Main Menu" 
        onclick="butBack_Click" />
  </label>
  
  &nbsp;
  </form>
    <footer>
  <p>All rights reserverd for Rush Cargo Inc. &#9400;</p>
</footer>
    </body>
</html>
