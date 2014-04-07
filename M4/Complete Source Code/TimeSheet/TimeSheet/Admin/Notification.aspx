<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Notification.aspx.cs" Inherits="Admin_Notification" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <table width="90%" border="0" cellspacing="6" cellpadding="0">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" valign="top" class="title1">
                Email Notification Status
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                  <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
      </table>  
  

</asp:Content>

