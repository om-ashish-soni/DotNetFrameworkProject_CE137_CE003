<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_paper_home.aspx.cs" Inherits="advertise_mgmt.News_Paper_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <asp:Panel ID="Panel2" runat="server">
                Pending Advertise<br />
            </asp:Panel>
        </div>
        
        <asp:Panel ID="Panel3" runat="server">
            <br />
        </asp:Panel>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="accepted_advertise" AutoGenerateEditButton="True" OnRowUpdated="GridView3_RowUpdated" DataKeyNames="Id" >
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True"/>
                <asp:BoundField DataField="Business_Name" HeaderText="Business_Name" SortExpression="Business_Name" ReadOnly="True"/>
                <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source" ReadOnly="True"/>
                <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                <asp:BoundField DataField="Add_Type" HeaderText="Add_Type" SortExpression="Add_Type" ReadOnly="True"/>
                <asp:BoundField DataField="Accepted" HeaderText="Accepted" SortExpression="Accepted" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" ReadOnly="True"/>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="accepted_advertise" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [News_Paper_Advertise] WHERE (([Accepted] = @Accepted) AND ([News_Paper_Id] = @News_Paper_Id))"
            UpdateCommand="Update [News_Paper_Advertise] Set [Reason]=@Reason,[Accepted]=@Accepted,[Cost]=@Cost WHERE [Id]=@Id"
            >
            <SelectParameters>
                <asp:Parameter DefaultValue="No" Name="Accepted" Type="String" />
                <asp:CookieParameter CookieName="news_paper_id_cookie" Name="News_Paper_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        Accepted<asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataSourceID="not_accepted"  DataKeyNames="Id">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="true" InsertVisible="False"/>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                <asp:BoundField DataField="Business_Id" HeaderText="Business_Id" SortExpression="Business_Id"/>
                <asp:BoundField DataField="Business_Name" HeaderText="Business_Name" SortExpression="Business_Name" />
                <asp:BoundField DataField="News_Paper_Id" HeaderText="News_Paper_Id" SortExpression="News_Paper_Id" />
                <asp:BoundField DataField="News_Paper" HeaderText="News_Paper" SortExpression="News_Paper" />
                <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source"/>
                <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason"/>
                <asp:BoundField DataField="Add_Type" HeaderText="Add_Type" ReadOnly="False" SortExpression="Add_Type" />
                <asp:BoundField DataField="Accepted" HeaderText="Accepted" SortExpression="Accepted" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            </Columns>
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
    <p>
        &nbsp;</p>
</body>

</html>
