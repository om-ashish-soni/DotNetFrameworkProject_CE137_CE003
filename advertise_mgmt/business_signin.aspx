﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="business_signin.aspx.cs" Inherits="advertise_mgmt.business_signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Business Signin</title>
    <style>
        body{
            background-color:cornsilk;
            font-size:20px;
            font-family: 'Century Gothic';
        }
        #form1{
            margin-top:10%;
        }
        h1,h2{
            font-family: Papyrus;
        }
        #signin_btn,#login_redirect_btn,#go_back_btn{
            color:white;
            background-color:orange;
            border-radius:10px;
            outline:none;
            border:none;
            width:40%;
            font-size:24px;
        }
        #Email_Id_Input,#Password_Input,#Business_Name_Input{
            outline:none;
            border:none;     
            border-bottom:2px solid black;
            font-size:20px;
        }
    </style>
</head>
<body>
    <center>
    <form id="form1" runat="server">
        <h1>Advertise Management System</h1>
        <div>
            <h2>Business Login</h2>
            Business Name :
            <asp:TextBox ID="Business_Name_Input" runat="server"></asp:TextBox>
            <br />
            <br />
            Email Id : <asp:TextBox ID="Email_Id_Input" runat="server"></asp:TextBox>
            <br />
            <br />
            Password :
            <asp:TextBox ID="Password_Input" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="signin_btn" runat="server"  OnClick="submit_btn_click" Text="Signin" />
            <br />
            <br />
            <asp:Button ID="login_redirect_btn" runat="server" OnClick="login_redirect_action" Text="Already a user ? login" />
            <br />
            <br />
            <asp:Button ID="go_back_btn" runat="server"  OnClick="go_back_action" Text="Go Back"  />
        </div>
    </form>
    </center>
</body>
</html>
