

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tv_channel_home.aspx.cs" Inherits="advertise_mgmt.tv_channel_home" %>

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
            display:inline;
        }
        #Button1,#login_btn,#signin_redirect_btn,#signin_btn,#news_add_submit_btn,#news_add_submit_btn0,#login_redirect_btn,#go_back_btn,#crt_news_channel_advertise_btn,#crt_tv_channel_advertise_btn{
            color:white;
            background-color:orange;
            border-radius:10px;
            outline:none;
            border:none;
            width:40%;
            font-size:24px;
        }
        #logout_btn,#Tv_Channel_Name_Input,#Email_Id_Input,#Password_Input,#Business_Name_Input{
            outline:none;
            border:none;     
            font-size:20px;
            border-radius:10px;
        }
        #logout_btn{
            width:10%;
            background-color:tomato;
            color:white;
            margin-left:20px;
        }
    </style>
</head>
<body>
    <center>
    
    
    <form id="form2" runat="server">
        <div>
        <h1>Tv Channel Home - Advertise Management System</h1>
        <asp:Button ID="logout_btn" runat="server" Text="Logout" OnClick="logout_btn_click" />
        </div>
        <asp:Panel ID="Panel3" runat="server">
            <h2>Accepted Advertise</h2>
        </asp:Panel>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="accepted_advertise" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="true"/>
                <asp:BoundField DataField="Business_Name" HeaderText="Business_Name" SortExpression="Business_Name" ReadOnly="true"/>
                <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source" ReadOnly="true"/>
                <asp:BoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Frequency" ReadOnly="true"/>
                
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" ReadOnly="true"/>
                
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
        <asp:SqlDataSource ID="accepted_advertise" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Business_Id],[Business_Name],[Source], [Frequency], [Date], [Cost],[Accepted],[Reason] FROM [Tv_Channel_Advertise] WHERE (([Tv_Channel_Id] = @Tv_Channel_Id) AND ([Accepted] = @Accepted))"
            UpdateCommand="Update [Tv_Channel_Advertise] Set [Accepted]=@Accepted,[Cost]=@Cost">
            <SelectParameters>
                <asp:CookieParameter CookieName="tv_channel_cookie" Name="Tv_Channel_Id" Type="Int32" />
                <asp:Parameter DefaultValue="Yes" Name="Accepted" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        
        <h2>Not Accepted Advertise</h2>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataSourceID="not_accepted" OnRowUpdated="GridView4_RowUpdated" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="true"/>
                <asp:BoundField DataField="Business_Name" HeaderText="Business_Name" SortExpression="Business_Name" ReadOnly="true"/>
                <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source" ReadOnly="true"/>
                <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                <asp:BoundField DataField="Accepted" HeaderText="Accepted" SortExpression="Accepted" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Frequency" ReadOnly="true"/>
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" ReadOnly="true"/>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="False" SortExpression="Id" />
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
        <asp:SqlDataSource ID="not_accepted" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [Tv_Channel_Advertise] WHERE (([Accepted] = @Accepted) AND ([Tv_Channel_Id] = @Tv_Channel_Id))"
            UpdateCommand="Update [Tv_Channel_Advertise] Set [Accepted]=@Accepted,[Cost]=@Cost WHERE [Id]=@Id"
            >

            <SelectParameters>
                <asp:Parameter DefaultValue="No" Name="Accepted" Type="String" />
                <asp:CookieParameter CookieName="tv_channel_cookie" Name="Tv_Channel_Id" Type="Int32" />
            </SelectParameters>
            
        </asp:SqlDataSource>
        <br />
        <br />
    </form>
    </center>
    
</body>
</html>