<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgetPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>:: Forgot Password ::</title>
    <link href="scripts/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="Script1" runat="server">
    </asp:ScriptManager>
    <div class="userbody">
        <div class="usermiddle">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="6">
                <tr>
                    <td align="left" valign="top" class="title">
                        Forgot Password
                    </td>
                </tr>
                <tr>
                    <td height="30">
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="contentbold">
                        If you’ve forgotten your password, enter your user name you use to sign in to Easy
                        Time Sheet and you will receive your password via email
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="contentbold">Username :</span>
                        <br />
                        <asp:TextBox ID="txtUserName" runat="server" Width="225"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regularExpvalEmail" runat="server" ControlToValidate="txtUserName"
                            SetFocusOnError="true" ErrorMessage="<b>Invalid Email.</b>" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Display="None"></asp:RegularExpressionValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1"
                            TargetControlID="regularExpvalEmail" HighlightCssClass="validatorCalloutHighlight" />
                        <asp:RequiredFieldValidator runat="server" ID="reqUserName" ControlToValidate="txtUserName"
                            SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Username is required." />
                        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ajaxreqUserName" TargetControlID="reqUserName"
                            HighlightCssClass="validatorCalloutHighlight" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <asp:Button ID="lblGo" runat="server" CssClass="btnsend" Text="" onmouseover="this.className='btnsendhover'"
                            onmouseout="this.className='btnsend'" OnClick="btnSave_Click" />&nbsp;&nbsp;
                        <a href="Login.aspx" class="contentwhite">Login</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
