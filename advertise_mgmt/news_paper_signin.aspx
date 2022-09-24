<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_paper_signin.aspx.cs" Inherits="advertise_mgmt.news_paper_signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>News Paper Signin</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            News Paper Name :
            <asp:TextBox ID="News_Paper_Name_Input" runat="server"></asp:TextBox>
            <br />
            <br />
            Email Id : <asp:TextBox ID="Email_Id_Input" runat="server"></asp:TextBox>
            <br />
            <br />
            Password :
            <asp:TextBox ID="Password_Input" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="signin_btn" runat="server" Height="29px" OnClick="submit_btn_click" Text="Signin" Width="242px" />
            <br />
            <br />
            <asp:Button ID="login_redirect_btn" runat="server" OnClick="login_redirect_action" Text="Already a user ? login" />
            <br />
            <br />
            <asp:Button ID="go_back_btn" runat="server" Height="30px" OnClick="go_back_action" Text="Go Back" Width="239px" />
        </div>
    </form>
</body>
</html>
