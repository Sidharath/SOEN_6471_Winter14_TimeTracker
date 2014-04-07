<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="UserModuleDetail.aspx.cs" Inherits="Admin_UserModuleDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
              <asp:DropDownList ID="drdProjectName" runat="server" Width="200">
              </asp:DropDownList>
              <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="drdProjectName"
                SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Project Name is required." />
              <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1"
                TargetControlID="RequiredFieldValidator1" HighlightCssClass="validatorCalloutHighlight" />
            </td>
          </tr>
          <tr>
            <td align="left">
                Task :
              <br />
              <asp:HiddenField ID="hddID" runat="server" />
              <asp:TextBox ID="txtModuleName" runat="server" Width="200"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="reqUserName" ControlToValidate="txtModuleName"
                SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Task Name is required." />
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
                onmouseout="this.className='btnCancel'" CausesValidation="false" PostBackUrl="~/UserModuleList.aspx" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</asp:Content>

