<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true"
  CodeFile="Setting.aspx.cs" Inherits="Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  <script type="text/javascript" language="javascript">
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginReq);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);


    function beginReq(sender, args) {
      // shows the Popup     
      $find(ModalProgress).show();
    }
    function endReq(sender, args) {     //  shows the Popup     
      $find(ModalProgress).hide();
    }
    var ModalProgress = '<%=ModalProgress.ClientID%>'; 
  </script>

  <asp:Panel ID="panelUpdateProgress" runat="server">
    <asp:UpdateProgress ID="UpdateProg1" runat="server" DisplayAfter="0">
      <ProgressTemplate>
        <div class="loadingbox">
          <img src="<%=msRootPath%>/images/spinner.gif" align="absmiddle" />&nbsp;&nbsp;Processing...
        </div>
      </ProgressTemplate>
    </asp:UpdateProgress>
  </asp:Panel>
  <ajaxToolkit:ModalPopupExtender ID="ModalProgress" runat="server" TargetControlID="panelUpdateProgress"
    BackgroundCssClass="modalBackground" PopupControlID="panelUpdateProgress" />
  <table width="95%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>
        &nbsp;
      </td>
    </tr>
    <tr>
      <td align="left" valign="top" class="title1">
        Settings
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        <asp:UpdatePanel runat="Server" ID="UpdatePanel2">
          <ContentTemplate>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
          </ContentTemplate>
        </asp:UpdatePanel>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        &nbsp;
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        <asp:UpdatePanel runat="Server" ID="UpdatePanel1">
          <ContentTemplate>
            <strong>Set default project and/or task :</strong><br />
            <br />
            <asp:HiddenField ID="hddid" runat="server" />
            Project :
            <asp:DropDownList ValidationGroup="Setting" ID="drdProject" runat="server" AutoPostBack="True"
              OnSelectedIndexChanged="drdProject_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="reqUserName" ControlToValidate="drdProject"
              SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Project is required."
              ValidationGroup="Setting" />
            <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ajaxreqUserName" TargetControlID="reqUserName"
              HighlightCssClass="validatorCalloutHighlight" />
            <br />
            <br />
              Task :
            <asp:DropDownList ID="drdModule" runat="server" ValidationGroup="Setting">
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="drdProject"
              SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Project is required."
              ValidationGroup="Setting" />
            <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1"
              TargetControlID="RequiredFieldValidator1" HighlightCssClass="validatorCalloutHighlight" />
            <br />
            <br />
            <asp:Button ID="btnSave" runat="server" CssClass="btnsave" ValidationGroup="Setting"
              onmouseover="this.className='btnsavehover'" onmouseout="this.className='btnsave'"
              OnClick="btnSave_Click" />
          </ContentTemplate>
        </asp:UpdatePanel>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        &nbsp;
      </td>
    </tr>
  
    <tr>
      <td align="left" valign="top">
        &nbsp;
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        <asp:UpdatePanel runat="Server" ID="UpdatePanel3">
          <ContentTemplate>
            <strong>Change Password :</strong><br />
            <br />
            Old Password :
            <asp:Label ID="lblOldPassword" runat="server" Visible="false"></asp:Label>
            <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server" ValidationGroup="changepassword"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtOldPassword"
              SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Old Password is required."
              ValidationGroup="changepassword" />
            <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender2"
              TargetControlID="RequiredFieldValidator2" HighlightCssClass="validatorCalloutHighlight" />
            <br />
            <br />
            New Password :
            <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server" ValidationGroup="changepassword"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtNewPassword"
              SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />New Password is required."
              ValidationGroup="changepassword" />
            <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender3"
              TargetControlID="RequiredFieldValidator3" HighlightCssClass="validatorCalloutHighlight" />
            <br />
            <br />
            <asp:Button ID="btnSave1" runat="server" ValidationGroup="changepassword" CssClass="btnsave"
              onmouseover="this.className='btnsavehover'" onmouseout="this.className='btnsave'"
              OnClick="btnSave1_Click" />
            <br />
            <br />
          </ContentTemplate>
        </asp:UpdatePanel>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        &nbsp;
      </td>
    </tr>
  </table>
</asp:Content>
