<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="business_home.aspx.cs" Inherits="advertise_mgmt.business_home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="crt_news_channel_advertise_btn" runat="server" Height="34px" OnClick="show_news_paper_add_create_action" Text="Create News Paper Advertise" Width="516px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="crt_tv_channel_advertise_btn" runat="server" Height="34px" OnClick="show_tv_channel_advertice_action" Text="Create Tv Channel Advertise" Width="516px" />
        </div>
        <asp:Panel ID="news_paper_advertise_panel_form" runat="server" Visible="False">
            News Paper Advertise Form<br />
            <br />
            Advertise Name :
            <asp:TextBox ID="news_advertise_name_inp" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:RadioButtonList ID="news_paper_inp" runat="server" DataSourceID="news_paper_list" DataTextField="Name" DataValueField="Id">
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="news_paper_list" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Id] FROM [News_Paper]"></asp:SqlDataSource>
            <br />
            <br />
            Image Source Url :
            <asp:TextBox ID="image_source_url_inp" runat="server"></asp:TextBox>
            <br />
            <asp:RadioButtonList ID="Add_Type_inp" runat="server">
                <asp:ListItem Selected="True">Full Page</asp:ListItem>
                <asp:ListItem>Half Page</asp:ListItem>
                <asp:ListItem>Side Bar</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
            Date :
            <asp:TextBox ID="news_paper_display_date_inp" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="news_add_submit_btn" runat="server" Height="29px" OnClick="create_news_advertise_submit_btn_click" Text="Create Advertise" Width="242px" />
        </asp:Panel>
        <asp:Panel ID="tv_channel_advertise_panel_form" runat="server" Visible="False">
            TV Channel Advertise Form<br />
            <br />
            Advertise Name :
            <asp:TextBox ID="tv_channel_advertise_name_inp" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:RadioButtonList ID="tv_channel_inp" runat="server" DataSourceID="tv_channel_list" DataTextField="Name" DataValueField="Id">
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="tv_channel_list" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Id] FROM [Tv_Channel]"></asp:SqlDataSource>
            <br />
            <br />
            Media Source Url :
            <asp:TextBox ID="media_source_url_inp" runat="server"></asp:TextBox>
            <br />
            <br />
            Display Frequency :
            <asp:TextBox ID="display_frequency_inp" runat="server"></asp:TextBox>
            <br />
            <br />
            Date :
            <asp:TextBox ID="tv_channel_advertise_display_date_inp" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="news_add_submit_btn0" runat="server" Height="29px" OnClick="create_tv_channel_advertise_submit_btn_click" Text="Create Advertise" Width="242px" />
            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server">
            Pending News Paper Advertises
            <br />
            <asp:GridView ID="pending_news_paper_advertise_grid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="pending_news_paper_advertises" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                    <asp:BoundField DataField="Add_Type" HeaderText="Add_Type" SortExpression="Add_Type" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="News_Paper" HeaderText="News_Paper" SortExpression="News_Paper" />
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
            <asp:SqlDataSource ID="pending_news_paper_advertises" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name], [Reason], [Add_Type], [Date], [News_Paper] FROM [News_Paper_Advertise] WHERE (([Accepted] = @Accepted) AND ([Business_Id] = @Business_Id)) ORDER BY [Date] DESC">
                <SelectParameters>
                    <asp:Parameter DefaultValue="No" Name="Accepted" Type="String" />
                    <asp:CookieParameter CookieName="business_id_cookie" Name="Business_Id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel4" runat="server">
            <br />
            Pending Tv Channel Advertises<br />
            <asp:GridView ID="pending_tv_channel_advertise_grid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="pending_tv_channel_advertise" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Tv_Channel" HeaderText="Tv_Channel" SortExpression="Tv_Channel" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                    <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                    <asp:BoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Frequency" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <asp:SqlDataSource ID="pending_tv_channel_advertise" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Tv_Channel], [Reason], [Cost], [Frequency], [Date] FROM [Tv_Channel_Advertise] WHERE (([Business_Id] = @Business_Id) AND ([Accepted] = @Accepted))">
                <SelectParameters>
                    <asp:CookieParameter CookieName="business_id_cookie" Name="Business_Id" Type="Int32" />
                    <asp:Parameter DefaultValue="No" Name="Accepted" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <br />
            Accepted News Paper Advertises<br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="accepted_news_paper_advertise" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="News_Paper" HeaderText="News_Paper" SortExpression="News_Paper" />
                    <asp:BoundField DataField="Add_Type" HeaderText="Add_Type" SortExpression="Add_Type" />
                    <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
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
            <asp:SqlDataSource ID="accepted_news_paper_advertise" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [News_Paper], [Add_Type], [Cost], [Date] FROM [News_Paper_Advertise] WHERE (([Accepted] = @Accepted) AND ([Business_Id] = @Business_Id))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Yes" Name="Accepted" Type="String" />
                    <asp:CookieParameter CookieName="business_id_cookie" Name="Business_Id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
            <br />
            Accepted Tv Channel Advertises<br />
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="accepted_tv_channel_advertise" ForeColor="Black" GridLines="None">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Tv_Channel" HeaderText="Tv_Channel" SortExpression="Tv_Channel" />
                    <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                    <asp:BoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Frequency" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            <asp:SqlDataSource ID="accepted_tv_channel_advertise" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Tv_Channel], [Cost], [Frequency], [Date] FROM [Tv_Channel_Advertise] WHERE (([Business_Id] = @Business_Id) AND ([Accepted] = @Accepted))">
                <SelectParameters>
                    <asp:CookieParameter CookieName="business_id_cookie" Name="Business_Id" Type="Int32" />
                    <asp:Parameter DefaultValue="Yes" Name="Accepted" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </form>
</body>
</html>
