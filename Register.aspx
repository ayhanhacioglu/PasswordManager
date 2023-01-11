<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PasswordManager.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 117px;
        }
        .auto-style3 {
            width: 157px;
        }
        .auto-style4 {
            width: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" class="auto-style1">
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Username</strong></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TboxRegUsername" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4"><asp:RequiredFieldValidator ID="ReqValRegisterUserName" runat="server" ErrorMessage="Username is Mandatory" ForeColor="DarkRed" ControlToValidate="TboxRegUsername" SetFocusOnError="True" Display="Dynamic">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Password</strong></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TboxRegPassword" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4"><asp:RequiredFieldValidator ID="ReqValRegisterPassword" runat="server" ErrorMessage="Password is Mandatory" ForeColor="DarkRed" ControlToValidate="TboxRegPassword" SetFocusOnError="True" Display="Dynamic">*</asp:RequiredFieldValidator></td>
                    <td>
                        <asp:Button ID="BtnGeneratePassword" runat="server" Text="Generate Password" CausesValidation="false" OnClick="BtnGeneratePassword_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Email</strong></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TboxRegEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonRegister" runat="server" Text="Register and Login" OnClick="ButtonRegister_Click" />
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="BtnRegLogout" runat="server" CausesValidation="false" OnClick="BtnRegLogout_Click" Text="Logout" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
