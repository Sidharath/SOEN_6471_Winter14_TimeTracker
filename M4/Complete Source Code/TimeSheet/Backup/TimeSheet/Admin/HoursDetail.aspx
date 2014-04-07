<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HoursDetail.aspx.cs" MasterPageFile="~/Admin/admin.master"
  Inherits="Admin_HoursDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <table width="90%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>
        &nbsp;
      </td>
    </tr>
    <tr>
      <td align="left" valign="top" class="title1">
        <asp:Label ID="lblTitle" runat="server"></asp:Label>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        &nbsp;
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        <table cellpadding="3" cellspacing="0" border="0">
          <tr>
            <td align="left">
              <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
          </tr>
          <tr>
            <td align="left">
              Hour Option :
              <br />
              <asp:HiddenField ID="hddID" runat="server" />
              <asp:TextBox ID="txtHour" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="reqUserName" ControlToValidate="txtHour"
                SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Hour is required." />
              <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ajaxreqUserName" TargetControlID="reqUserName"
                HighlightCssClass="validatorCalloutHighlight" />
              <ajaxToolkit:FilteredTextBoxExtender ID="ftxtboxextContactNo" runat="server" TargetControlID="txtHour"
                FilterType="Custom" FilterMode="ValidChars" ValidChars="1234567890." />
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtHour"
                Display="None" SetFocusOnError="true" ValidationExpression="[0-9]+(\.[0-9]{1,2}){0,1}"
                ErrorMessage="Enter valid value"></asp:RegularExpressionValidator>
              <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender8"
                TargetControlID="RegularExpressionValidator1" HighlightCssClass="validatorCalloutHighlight" />
            </td>
          </tr>
          <tr>
            <td align="left"><br />
              <asp:Button ID="btnSubmit" runat="server" CssClass="btnsave" onmouseover="this.className='btnsavehover'"
                onmouseout="this.className='btnsave'" OnClick="btnSubmit_Click" />
              <asp:Button ID="btnCancel" runat="server" CssClass="btnCancel" onmouseover="this.className='btnCancelhover'"
                onmouseout="this.className='btnCancel'" CausesValidation="false" PostBackUrl="~/Admin/HoursList.aspx" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</asp:Content>
