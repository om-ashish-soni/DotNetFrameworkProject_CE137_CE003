﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_paper_home.aspx.cs" Inherits="advertise_mgmt.News_Paper_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            background-color:cornsilk;
            font-size:20px;
            font-family: 'Century Gothic';
        }
        #form1{
            margin-top:1%;
        }
        h1{
            font-family: Papyrus;
        }
        span{
            font-family: Papyrus;
            font-size:40px;
            font-weight:bolder;
            margin-right:20px;
        }
        #logout_btn,#signin_btn,#login_redirect_btn,#go_back_btn,#crt_news_channel_advertise_btn,#crt_tv_channel_advertise_btn{
            color:white;
            background-color:orange;
            border-radius:10px;
            outline:none;
            border:none;
            width:40%;
            font-size:24px;
        }
        #logout_btn{
            width:10%;
            background-color:tomato;
            color:white;
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
    <form id="form2" runat="server">
        <div>
        <span>News Paper Home - Advertise Management System</span>
        <asp:Button ID="logout_btn" runat="server" Text="Logout" OnClick="logout_btn_click" />
        </div>
        <div>
            <asp:Panel ID="Panel2" runat="server">
                <h2>Pending Advertise</h2>
                <br />
            </asp:Panel>
        </div>
        
        <asp:Panel ID="Panel3" runat="server">
            <br />
        </asp:Panel>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="accepted_advertise" AutoGenerateEditButton="True" OnRowUpdated="GridView3_RowUpdated" CellPadding="4" ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                <asp:BoundField DataField="Business_Name" HeaderText="Business_Name" SortExpression="Business_Name"/>
                <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source"/>
                <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                <asp:BoundField DataField="Add_Type" HeaderText="Add_Type" SortExpression="Add_Type"/>
                <asp:BoundField DataField="Accepted" HeaderText="Accepted" SortExpression="Accepted" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"/>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="accepted_advertise" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [Name], [Business_Name], [Source], [Reason], [Add_Type], [Accepted], [Cost], [Date] FROM [News_Paper_Advertise] WHERE (([Accepted] = @Accepted) AND ([News_Paper_Id] = @News_Paper_Id))"
            >
            <SelectParameters>
                <asp:Parameter DefaultValue="No" Name="Accepted" Type="String" />
                <asp:CookieParameter CookieName="news_paper_id_cookie" Name="News_Paper_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <h2>Accepted Advertise</h2>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataSourceID="not_accepted"  DataKeyNames="Id" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                <asp:BoundField DataField="Business_Name" HeaderText="Business_Name" SortExpression="Business_Name" />
                <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source"/>
                <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason"/>
                <asp:BoundField DataField="Add_Type" HeaderText="Add_Type" ReadOnly="False" SortExpression="Add_Type" />
                <asp:BoundField DataField="Accepted" HeaderText="Accepted" SortExpression="Accepted" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="not_accepted" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [News_Paper_Advertise] WHERE (([News_Paper_Id] = @News_Paper_Id) AND ([Accepted] = @Accepted))"
            >

            <SelectParameters>
                <asp:CookieParameter CookieName="news_paper_id_cookie" Name="News_Paper_Id" Type="Int32" />
                <asp:Parameter DefaultValue="Yes" Name="Accepted" Type="String" />
            </SelectParameters>
            
        </asp:SqlDataSource>
        <br />
        <br />
    </form>
    </center>
    
</body>

</html>
