<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/admin.master"
  CodeFile="ProjectDetail.aspx.cs" Inherits="Admin_ProjectDetail" %>

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
              Project :
              <br />
              <asp:HiddenField ID="hddID" runat="server" />
              <asp:TextBox ID="txtProjectName" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="reqUserName" ControlToValidate="txtProjectName"
                SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Project Name is required." />
              <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ajaxreqUserName" TargetControlID="reqUserName"
                HighlightCssClass="validatorCalloutHighlight" />
            </td>
          </tr>
          <tr>
            <td align="left">
              <br />
              <asp:Button ID="btnSubmit" runat="server" CssClass="btnsave" onmouseover="this.className='btnsavehover'"
                onmouseout="this.className='btnsave'" OnClick="btnSubmit_Click" />
              <asp:Button ID="btnCancel" runat="server" CssClass="btnCancel" onmouseover="this.className='btnCancelhover'"
                onmouseout="this.className='btnCancel'" CausesValidation="false" PostBackUrl="~/Admin/ProjectList.aspx" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</asp:Content>
