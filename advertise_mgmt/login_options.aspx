﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_options.aspx.cs" Inherits="advertise_mgmt.login_options" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JOIN AMS</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:RadioButtonList ID="user_type_list" runat="server" Height="66px" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Width="146px">
                <asp:ListItem Selected="True" Value="Business_Btn">Business</asp:ListItem>
                <asp:ListItem Value="News_Paper_Btn">News Paper</asp:ListItem>
                <asp:ListItem Value="TV_Channel_Btn">TV Channel</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <asp:Button ID="submit_btn" runat="server" Height="44px" OnClick="submit_btn_Click" Text="Join" Width="135px" />
    </form>
</body>
</html>
