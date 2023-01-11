<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyPasswords.aspx.cs" Inherits="PasswordManager.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 529px;
            margin-left: 80px;
        }

        .auto-style3 {
            width: 529px;
        }

        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 323px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="LblMyPassUserName" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="BtnEdtCategory" runat="server" OnClick="BtnEdtCategory_Click" Text="Edit Categories" />
                    </td>
                    <td class="auto-style3">
                        <asp:Button ID="BtnLogout" runat="server" OnClick="BtnLogout_Click" Text="Logout" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6" class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="3">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="DsPassword" GridLines="Horizontal" ShowFooter="True" ShowHeaderWhenEmpty="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="false" />
                                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" Visible="false" />
                                <asp:TemplateField HeaderText="Password Name" SortExpression="PasswordName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PasswordName") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvPasswordNameEdit" Text="*" ControlToValidate="TextBox1" ForeColor="Red" ErrorMessage="Password Name is Required!"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("PasswordName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtPasswordName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvPasswordNameInsert" Text="*" ControlToValidate="TxtPasswordName" ForeColor="Red" ErrorMessage="Password Name is Required!" ValidationGroup="BtnInsert"></asp:RequiredFieldValidator>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Username" SortExpression="Username">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvUsernameEdit" Text="*" ControlToValidate="TextBox2" ForeColor="Red" ErrorMessage="Username is Required!" ></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtUserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvUsernameInsert" Text="*" ControlToValidate="TxtUserName" ForeColor="Red" ErrorMessage="Username is Required!" ValidationGroup="BtnInsert"></asp:RequiredFieldValidator>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Password" SortExpression="Password">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvPasswordEdit" Text="*" ControlToValidate="TextBox3" ForeColor="Red" ErrorMessage="Password is Required!"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtPassword" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvPasswordInsert" Text="*" ControlToValidate="TxtPassword" ForeColor="Red" ErrorMessage="Password is Required!" ValidationGroup="BtnInsert"></asp:RequiredFieldValidator>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="URL" SortExpression="URL">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("URL") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvUrlEdit" Text="*" ControlToValidate="TextBox4" ForeColor="Red" ErrorMessage="URL is Required!"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("URL") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtURL" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvUrlInsert" Text="*" ControlToValidate="TxtURL" ForeColor="Red" ErrorMessage="URL is Required!" ValidationGroup="BtnInsert"></asp:RequiredFieldValidator>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category" SortExpression="CategoryID">
                                    <EditItemTemplate>
                                        <asp:DropDownList runat="server" ID="DdlCategory" DataSourceID="DsCategory" DataValueField="ID" DataTextField="CategoryName" Text='<%# Bind("CategoryID") %>'></asp:DropDownList>
                                        <%--<asp:RequiredFieldValidator runat="server" ID="rfvCategoryEdit" Text="*" ControlToValidate="DdlCategory" ForeColor="Red" ErrorMessage="Category is Required!" InitialValue="Select Category"></asp:RequiredFieldValidator>--%>
                                        <asp:SqlDataSource ID="DsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:PasswordManagerConnectionString %>" SelectCommand="SELECT ID,CategoryName FROM [TBL_CATEGORY] WHERE UserID = @UserID">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:DropDownList ID="DdlCategorylistall" runat="server" DataSourceID="DsCategoryListAll" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                                        <asp:SqlDataSource ID="DsCategoryListAll" runat="server" ConnectionString="<%$ ConnectionStrings:PasswordManagerConnectionString %>" SelectCommand="SELECT ID,CategoryName FROM [TBL_CATEGORY] WHERE UserID = @UserID">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:LinkButton runat="server" ID="BtnInsert" Text="Insert" ValidationGroup="BtnInsert" OnClick="BtnInsert_Click"></asp:LinkButton>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" />

                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#487575" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#275353" />
                        </asp:GridView>
                        <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" ValidationGroup="BtnInsert" />
                        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" />
                        <asp:SqlDataSource ID="DsPassword" runat="server" ConnectionString="<%$ ConnectionStrings:PasswordManagerConnectionString %>"
                            SelectCommand="SELECT [TBL_PASSWORD].[ID], [TBL_PASSWORD].[UserID], [TBL_PASSWORD].[PasswordName], [TBL_PASSWORD].[Username], [TBL_PASSWORD].[Password], [TBL_PASSWORD].[URL], [TBL_PASSWORD].[CategoryID], [TBL_CATEGORY].[CategoryName] FROM [TBL_PASSWORD] INNER JOIN [TBL_CATEGORY] ON [TBL_CATEGORY].[ID] = [TBL_PASSWORD].[CATEGORYID] WHERE [TBL_PASSWORD].[UserID] = @UserID"
                            UpdateCommand="UPDATE [TBL_PASSWORD] SET [PasswordName] = @PasswordName, [Username] = @Username, [Password] = @Password, [URL] = @URL, [CategoryID] = @CategoryID WHERE [ID] = @ID"
                            InsertCommand="INSERT INTO [TBL_PASSWORD] ([UserID], [PasswordName], [Username], [Password], [URL], [CategoryID]) VALUES (@UserID, @PasswordName, @Username, @Password, @URL, @CategoryID)"
                            DeleteCommand="DELETE FROM [TBL_PASSWORD] WHERE [ID] = @ID">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
                                <asp:Parameter Name="PasswordName" Type="String" />
                                <asp:Parameter Name="Username" Type="String" />
                                <asp:Parameter Name="Password" Type="String" />
                                <asp:Parameter Name="URL" Type="String" />
                                <asp:Parameter Name="CategoryID" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
                                <asp:Parameter Name="PasswordName" Type="String" />
                                <asp:Parameter Name="Username" Type="String" />
                                <asp:Parameter Name="Password" Type="String" />
                                <asp:Parameter Name="URL" Type="String" />
                                <asp:Parameter Name="CategoryID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </td>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="3">&nbsp;</td>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">&nbsp;</td>
                    <td colspan="3">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
