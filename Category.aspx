<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="PasswordManager.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 423px;
        }
        .auto-style3 {
            width: 378px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LblCategoryUserName" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Button ID="BtnGoToMyPassword" runat="server" OnClick="BtnGoToMyPassword_Click" Text="My Passwords" />
                    </td>
                    <td>
                        <asp:Button ID="BtnCategoryLogout" runat="server" Text="Logout" OnClick="BtnCategoryLogout_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="DsCategory" GridLines="Horizontal" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="409px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="false" />
                                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" Visible="false" />
                                <asp:TemplateField HeaderText="CategoryName" SortExpression="CategoryName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtCategoryName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvCategoryInsert" Text="*" ControlToValidate="TxtCategoryName" ForeColor="Red" ErrorMessage="CategoryName is Required!" ValidationGroup="BtnInsertCategory"></asp:RequiredFieldValidator>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:LinkButton ID="BtnInsertCategory" runat="server" Text="Insert" ValidationGroup="BtnInsertCategory" OnClick="BtnCategoryInsert_Click"></asp:LinkButton>
                                    </FooterTemplate>
                                </asp:TemplateField>
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
                        <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" ValidationGroup="BtnCategoryInsert" />
                        <asp:SqlDataSource ID="DsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:PasswordManagerConnectionString %>" 
                            DeleteCommand="DELETE FROM [TBL_CATEGORY] WHERE [ID] = @ID" 
                            InsertCommand="INSERT INTO [TBL_CATEGORY] ([UserID], [CategoryName]) VALUES (@UserID, @CategoryName)" 
                            SelectCommand="SELECT * FROM [TBL_CATEGORY] WHERE ([UserID] = @UserID)" 
                            UpdateCommand="UPDATE [TBL_CATEGORY] SET [UserID] = @UserID, [CategoryName] = @CategoryName WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
                                <asp:Parameter Name="CategoryName" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
                                <asp:Parameter Name="CategoryName" Type="String" />
                                <asp:Parameter Name="ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
