<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="UserModuleList.aspx.cs" Inherits="Admin_UserModuleList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
          Manage Task
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        &nbsp;
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        <div class="gridbg">
          <div class="floatr padding5px">
            <div class="floatl">
              <p>
                <b>Search</b> :
                <asp:TextBox ID="txtSearch" runat="server" CssClass="inputbg" Width="180"></asp:TextBox>
              </p>
            </div>
            <div class="floatl padding">
              <asp:Button ID="lblGo" runat="server" CssClass="btngo" onmouseover="this.className='btngohover'"
                onmouseout="this.className='btngo'" OnClick="lblGo_Click" />
            </div>
            <div class="floatl padding">
              <asp:Button ID="btnReset" runat="server" CssClass="btnreset" onmouseover="this.className='btnresethover'"
                onmouseout="this.className='btnreset'" OnClick="btnReset_Click" />
            </div>
            <div class="floatl padding">
              <asp:Button ID="btnAdd" runat="server" CssClass="btnadd" onmouseover="this.className='btnaddhover'"
                onmouseout="this.className='btnadd'" OnClick="btnAdd_Click" />
            </div>
          </div>
          <div class="clearie">
            <asp:UpdatePanel runat="Server" ID="UpdatePanel2">
              <ContentTemplate>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
              </ContentTemplate>
            </asp:UpdatePanel>
          </div>
          <div class="padding5px ">
            <asp:UpdatePanel runat="Server" ID="UpdatePanel1">
              <ContentTemplate>
                <div class="padding5px default" align="center">
                  <asp:GridView ID="gvPlanList" runat="server" AutoGenerateColumns="False" DataKeyNames="nmModule"
                    Width="100%" OnPageIndexChanging="gvPlanList_PageIndexChanging" AllowPaging="True"
                    OnRowDeleting="gvPlanList_RowDeleting" AllowSorting="true" OnSorting="gvPlanList_Sorting"
                    OnRowCreated="gvPlanList_RowCreated" PageSize="10" EmptyDataText="No matching results found for the search criteria."
                    BorderStyle="Dotted">
                    <Columns>
                      <asp:BoundField DataField="szProjectName" SortExpression="szProjectName" HeaderText="Project">
                        <ItemStyle HorizontalAlign="left" />
                      </asp:BoundField>
                      <asp:BoundField DataField="szModuleName" SortExpression="szModuleName" HeaderText="Task">
                        <ItemStyle HorizontalAlign="left" />
                      </asp:BoundField>
                      <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                          <a href="UserModuleDetail.aspx?id=<%#Eval("nmModule")%>">
                            <img src="images/edit.png" title="Edit" alt="Edit" name="Edit" /></a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="50" />
                        <HeaderStyle HorizontalAlign="Center" Width="50px" />
                      </asp:TemplateField>
                      <%--<asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                          <asp:ImageButton ID="LinkDelete" runat="server" ImageUrl="../images/cancel.png" CommandName="Delete"
                            ToolTip="Delete" OnClientClick="return window.confirm('Are you sure you want to delete this record?');" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" Width="10px" />
                      </asp:TemplateField>--%>
                    </Columns>
                  </asp:GridView>
                </div>
              </ContentTemplate>
            </asp:UpdatePanel>
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
      <td align="left" valign="top">
        &nbsp;
      </td>
    </tr>
  </table>
</asp:Content>

