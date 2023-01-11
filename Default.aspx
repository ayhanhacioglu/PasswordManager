<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PasswordManager.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 68%;
        }
        .auto-style2 {
            width: 16px;
        }
        .auto-style3 {
            width: 522px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <table class="auto-style1">
                <tr>
                    <td colspan="2"><strong>Welcome to Password Manager Login Page</strong></td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Username</strong></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TboxUsername" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Password</strong></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TboxPassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="BtnLogin" runat="server" Text="Login" Width="70px" OnClick="BtnLogin_Click" />
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">If you do not have any account yet. Please click <asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink> and you can start using Password Manager Application.</td>
                </tr>
            </table>
            
        </div>
    </form>
</body>
</html>
