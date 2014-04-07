<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true"
  CodeFile="Permission.aspx.cs" Inherits="Admin_Permission" %>

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
  <asp:UpdatePanel runat="Server" ID="UpdatePanel2">
    <ContentTemplate>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            &nbsp;
          </td>
        </tr>
        <tr>
          <td align="left" valign="top" class="title1">
            Permission
          </td>
        </tr>
        <tr>
          <td>
            &nbsp;
          </td>
        </tr>
        <tr>
          <td align="left" valign="top">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td align="right" valign="middle" style="padding-right: 0px;">
            Month/Year :
            <asp:DropDownList ID="drdMonth" runat="server">
              <asp:ListItem Text="January" Value="1"></asp:ListItem>
              <asp:ListItem Text="February" Value="2"></asp:ListItem>
              <asp:ListItem Text="March" Value="3"></asp:ListItem>
              <asp:ListItem Text="April" Value="4"></asp:ListItem>
              <asp:ListItem Text="May" Value="5"></asp:ListItem>
              <asp:ListItem Text="June" Value="6"></asp:ListItem>
              <asp:ListItem Text="July" Value="7"></asp:ListItem>
              <asp:ListItem Text="August" Value="8"></asp:ListItem>
              <asp:ListItem Text="September" Value="9"></asp:ListItem>
              <asp:ListItem Text="October" Value="10"></asp:ListItem>
              <asp:ListItem Text="November" Value="11"></asp:ListItem>
              <asp:ListItem Text="December" Value="12"></asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="drdYear" runat="server">
            </asp:DropDownList>
            <asp:Button ID="lblGo" runat="server" CssClass="btngo" onmouseover="this.className='btngohover'"
              onmouseout="this.className='btngo'" OnClick="lblGo_Click" />
          </td>
        </tr>
        <tr>
          <td align="left" valign="top">
            <div class="gridbg">
              <div class="padding5px">
                <asp:Table ID="tblPermission" runat="server" CellPadding="0" CellSpacing="0" CssClass="datagrid1"
                  Width="100%">
                </asp:Table>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td align="left" valign="top">
            &nbsp;
          </td>
        </tr>
        <tr>
          <td align="right" valign="top">
            <asp:Button ID="btnSave" runat="server" CssClass="btnsave" onmouseover="this.className='btnsavehover'"
              onmouseout="this.className='btnsave'" OnClick="btnSave_Click" />
          </td>
        </tr>
        <tr>
          <td align="left" valign="top">
            &nbsp;
          </td>
        </tr>
      </table>
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
