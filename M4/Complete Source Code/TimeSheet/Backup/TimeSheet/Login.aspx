<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title>:: User Login ::</title>
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
            User Login
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
            <asp:TextBox ID="txtUserName" runat="server" Width="225" CssClass="inputbg" 
              ValidationGroup="UserLogin"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regularExpvalEmail" 
              runat="server" ControlToValidate="txtUserName" SetFocusOnError="true" ErrorMessage="<b>Invalid Email.</b>"
              ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
              Display="None" ValidationGroup="UserLogin"></asp:RegularExpressionValidator>
            <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1"
              TargetControlID="regularExpvalEmail" HighlightCssClass="validatorCalloutHighlight" />
            <asp:RequiredFieldValidator runat="server" ID="reqUserName" ControlToValidate="txtUserName"
              SetFocusOnError="true" Display="None" 
              ErrorMessage="<b>Required Field Missing</b><br />Username is required." 
              ValidationGroup="UserLogin" />
            <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ajaxreqUserName" TargetControlID="reqUserName"
              HighlightCssClass="validatorCalloutHighlight" />
          </td>
        </tr>
        <tr>
          <td align="left" valign="top">
            <span class="contentbold">Password :  </span>
              <br />
              <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="inputbg"
                Width="225" ValidationGroup="UserLogin"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtPassword"
                SetFocusOnError="true" Display="None" 
              ErrorMessage="<b>Required Field Missing</b><br />Password is required." 
              ValidationGroup="UserLogin" />
              <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ajaxreqPassword" TargetControlID="RequiredFieldValidator1"
                HighlightCssClass="validatorCalloutHighlight" />
          
          </td>
        </tr>
        <tr>
          <td align="left" valign="top" class="contentwhite">
            <br />
            <asp:CheckBox ID="chkRemember" runat="server" Text="Remember me" />
        </tr>
        <tr>
          <td align="left" valign="top">
            <asp:Button ID="btnSave" runat="server" Text="" OnClick="btnSave_Click" CssClass="btnlogin"
              onmouseover="this.className='btnloginhover'" 
              onmouseout="this.className='btnlogin'" ValidationGroup="UserLogin" />
            <a href="ForgotPassword.aspx" class="contentwhite">Forgot Password ?</a>
          </td>
        </tr>
        <tr>
          <td align="left" valign="top">
            &nbsp;
          </td>
        </tr>
      </table>
    </div>
  </div>
  </form>
</body>
</html>
