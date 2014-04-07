<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/admin.master"
  CodeFile="UserList.aspx.cs" Inherits="Admin_UserList" %>

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
  <table width="90%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>
        &nbsp;
      </td>
    </tr>
    <tr>
      <td align="left" valign="top" class="title1">
        Employee Master
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        &nbsp;
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
        <div class="gridbg">
          <div class="floatr padding5px">
            <asp:UpdatePanel runat="Server" ID="UpdatePanel3">
              <ContentTemplate>
                <div class="floatl">
                  <p>
                    <b>Search</b> :
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="inputbg" Width="180"></asp:TextBox>
                    <asp:HiddenField ID="hddArchive" runat="server" />
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
                <div class="floatl padding">
                  <asp:LinkButton ID="lnkArchive" Text="View Archive Records" runat="server" OnClick="lnkArchive_Click"></asp:LinkButton>
                </div>
              </ContentTemplate>
            </asp:UpdatePanel>
          </div>
          <div class="clearie">
          </div>
          <div class="padding5px">
            <asp:UpdatePanel runat="Server" ID="UpdatePanel1">
              <ContentTemplate>
                <div class="padding5px default" align="center">
                  <asp:GridView ID="gvPlanList" runat="server" AutoGenerateColumns="False" DataKeyNames="nmUserID"
                    Width="800" OnPageIndexChanging="gvPlanList_PageIndexChanging" AllowPaging="True"
                    OnRowDeleting="gvPlanList_RowDeleting" AllowSorting="true" OnSorting="gvPlanList_Sorting"
                    OnRowCreated="gvPlanList_RowCreated" PageSize="10" EmptyDataText="No matching results found for the search criteria."
                    BorderStyle="Dotted">
                    <Columns>
                      <asp:TemplateField HeaderText="Archive" ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle HorizontalAlign="center" />
                        <ItemStyle HorizontalAlign="center" VerticalAlign="Middle" />
                        <ItemTemplate>
                          <asp:CheckBox runat="server" ID="CheckBox1" OnCheckedChanged="ManageArciveUser" AutoPostBack="true"
                            Checked='<%#isCheck(DataBinder.Eval(Container.DataItem, "szArchive"))%>' Value='<%#DataBinder.Eval(Container.DataItem, "nmUserID")%>' />
                        </ItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="szUserName" SortExpression="szUserName" HeaderText="Email Id / User Name">
                        <ItemStyle HorizontalAlign="left" VerticalAlign="Middle" />
                      </asp:BoundField>
                      <asp:BoundField DataField="szContactPerson" SortExpression="szContactPerson" HeaderText="Display Name">
                        <ItemStyle HorizontalAlign="left" VerticalAlign="Middle" />
                      </asp:BoundField>
                      <asp:ImageField DataImageUrlField="szPhotoPath" HeaderText="Display Image" DataImageUrlFormatString="../images/{0}"
                        NullImageUrl="../images/NoImage.jpg" ControlStyle-Width="45px" ControlStyle-Height="50px">
                        <ItemStyle HorizontalAlign="Center" Width="120px" VerticalAlign="Middle" />
                        <HeaderStyle HorizontalAlign="Center" Width="120px" />
                      </asp:ImageField>
                      <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                          <a href="UserDetail.aspx?id=<%#Eval("nmUserID")%>">
                            <img src="../images/edit.png" title="Edit" alt="Edit" name="Edit" /></a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <HeaderStyle HorizontalAlign="Center" Width="10px" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                          <asp:ImageButton ID="LinkDelete" runat="server" ImageUrl="../images/cancel.png" CommandName="Delete"
                            ToolTip="Delete" OnClientClick="return window.confirm('Are you sure you want to delete this record?');" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <HeaderStyle HorizontalAlign="Center" Width="10px" />
                      </asp:TemplateField>
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
