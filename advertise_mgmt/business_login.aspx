<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="business_login.aspx.cs" Inherits="advertise_mgmt.business_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Business Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Email Id : <asp:TextBox ID="Email_Id_Input" runat="server"></asp:TextBox>
            <br />
            <br />
            Password :
            <asp:TextBox ID="Password_Input" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="login_btn" runat="server" Height="29px" OnClick="submit_btn_click" Text="Login" Width="242px" />
            <br />
            <br />
            <asp:Button ID="signin_redirect" runat="server" OnClick="signin_redirect_action" Text="Not a user ? Signin" />
            <br />
            <br />
            <asp:Button ID="go_back_btn" runat="server" Height="31px" OnClick="go_back_action" Text="Go Back" Width="213px" />
        </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
