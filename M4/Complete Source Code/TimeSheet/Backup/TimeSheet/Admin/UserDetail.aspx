<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/admin.master"
  CodeFile="UserDetail.aspx.cs" Inherits="Admin_UserDetail" %>

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
              Email Id / User Name :
              <br />
              <asp:TextBox ID="txtu"  runat="server" Width="300"> </asp:TextBox>
              <asp:RegularExpressionValidator ID="regularExpvalEmail" runat="server" ControlToValidate="txtu"
                SetFocusOnError="true" ErrorMessage="<b>Invalid Email.</b>" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                Display="None" ValidationGroup="SaveEmployee"></asp:RegularExpressionValidator>
              <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender2"
                TargetControlID="regularExpvalEmail" HighlightCssClass="validatorCalloutHighlight" />
              <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtu"
                SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Email Id / User Name is required." ValidationGroup="SaveEmployee" />
              <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1"
                TargetControlID="RequiredFieldValidator1" HighlightCssClass="validatorCalloutHighlight" />
            </td>
          </tr>
          <tr>
            <td align="left">
              Password :
              <br />
              <asp:HiddenField ID="hddID" runat="server" />
              <asp:TextBox ID="txtp" runat="server" Text="password" ReadOnly="true"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="reqUserName" ControlToValidate="txtp"
                SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Password is required." ValidationGroup="SaveEmployee" />
              <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ajaxreqUserName" TargetControlID="reqUserName"
                HighlightCssClass="validatorCalloutHighlight" />
            </td>
          </tr>
          <tr>
            <td align="left">
              Display Name :
              <br /> 
              <asp:TextBox ID="txtPersonName" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtPersonName"
                SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br /> Display Name is required." ValidationGroup="SaveEmployee" />
              <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender4"
                TargetControlID="RequiredFieldValidator2" HighlightCssClass="validatorCalloutHighlight" />
            </td>
          </tr>
          <tr>
            <td align="left">
              Display Image :
              <asp:HiddenField ID="hddImage" runat="server" />
              <br />
              <asp:Image ID="imgPer" runat="server" Width="84" Height="100"/>
              <br /> <br />
              <asp:FileUpload ID="fuImageUpload" runat="server" />
            </td>
          </tr>
          <tr>
            <td align="left">
              <br />
              <asp:Button ID="btnSubmit" runat="server" CssClass="btnsave" onmouseover="this.className='btnsavehover'"
                onmouseout="this.className='btnsave'" OnClick="btnSubmit_Click" ValidationGroup="SaveEmployee" />
              <asp:Button ID="btnCancel" runat="server" CssClass="btnCancel" onmouseover="this.className='btnCancelhover'"
                onmouseout="this.className='btnCancel'" CausesValidation="false" PostBackUrl="~/Admin/UserList.aspx" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</asp:Content>
