

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tv_channel_home.aspx.cs" Inherits="advertise_mgmt.tv_channel_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <!--
        <div>
            <asp:Panel ID="Panel2" runat="server">
                Pending Advertise<br />
            </asp:Panel>
        </div>
        
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AutoGenerateEditButton="True" >
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Business_Id" HeaderText="Business_Id" SortExpression="Business_Id" />
                <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Frequency" />
                <asp:BoundField DataField="Accepted" HeaderText="Accepted" SortExpression="Accepted" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [Name], [Business_Id], [Source], [Date], [Frequency], [Accepted] FROM [Tv_Channel_Advertise] WHERE (([Tv_Channel_Id] = @Tv_Channel_Id) AND ([Accepted] = @Accepted))"
            UpdateCommand="Update [Tv_Channel_Advertise] Set [Accepted]=@Accepted">
            <SelectParameters>
                <asp:CookieParameter CookieName="tv_channel_cookie" Name="Tv_Channel_Id" Type="Int32" />
                <asp:Parameter DefaultValue="No" Name="Accepted" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        -->
        <asp:Panel ID="Panel3" runat="server">
            Accepted Advertise<br />
        </asp:Panel>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="accepted_advertise" AutoGenerateEditButton="True" >
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Business_Id" HeaderText="Business_Id" SortExpression="Business_Id" />
                <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source" />
                <asp:BoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Frequency" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="accepted_advertise" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Business_Id], [Source], [Frequency], [Date], [Cost] FROM [Tv_Channel_Advertise] WHERE (([Tv_Channel_Id] = @Tv_Channel_Id) AND ([Accepted] = @Accepted))"
            UpdateCommand="Update [Tv_Channel_Advertise] Set [Accepted]=@Accepted,[Cost]=@Cost">
            <SelectParameters>
                <asp:CookieParameter CookieName="tv_channel_cookie" Name="Tv_Channel_Id" Type="Int32" />
                <asp:Parameter DefaultValue="Yes" Name="Accepted" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        Not Accepted<asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataSourceID="not_accepted" OnRowUpdated="GridView4_RowUpdated">
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
    <p>
        &nbsp;</p>
</body>
</html>