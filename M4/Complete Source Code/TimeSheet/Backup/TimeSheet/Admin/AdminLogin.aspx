<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="Admin_AdminLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>:: Admin Login ::</title>
    <link href="../scripts/main.css" rel="stylesheet" type="text/css" />
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
                        Admin Login
                    </td>
                </tr>
                <tr>
                    <td height="35" align="left" valign="top">
                        <asp:Label ID="lblMessage" runat="server" CssClass="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="">
                        <span class="contentbold">Username :</span>
                        <br />
                        <asp:TextBox ID="txtUn" runat="server" Width="225" CssClass="inputbg"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqUserName" ControlToValidate="txtUn"
                            SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Username is required." />
                        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ajaxreqUserName" TargetControlID="reqUserName"
                            HighlightCssClass="validatorCalloutHighlight" />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        <span class="contentbold">Password : </span>
                        <br />
                        <asp:TextBox ID="txtPsw" runat="server" TextMode="Password" Width="225" CssClass="inputbg"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtPsw"
                            SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Password is required." />
                        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ajaxreqPassword" TargetControlID="RequiredFieldValidator1"
                            HighlightCssClass="validatorCalloutHighlight" />
                    </td>
                </tr>
                <tr>
                    <td height="15">
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        <asp:Button ID="Button1" runat="server" Text="" OnClick="btnSave_Click" CssClass="btnlogin"
                            onmouseover="this.className='btnloginhover'" onmouseout="this.className='btnlogin'" />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <br>
        <br>
        <div class="footer">
            Copyright &copy; 2009-<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><a
                href="http://www.narolainfotech.com" target="_blank" class="footercolor"> Narolainfotech</a>
            | All Rights Reserved.</div>
    </div>
    </form>
</body>
</html>
