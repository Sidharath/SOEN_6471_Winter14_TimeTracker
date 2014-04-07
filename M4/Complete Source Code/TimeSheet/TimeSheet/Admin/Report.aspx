﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true"
  CodeFile="Report.aspx.cs" Inherits="Admin_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <%=lsChart %>
 <%=lsPipeChart %>
  <table width="90%" border="0" cellspacing="6" cellpadding="0">
    <tr>
      <td align="left" valign="top" class="title1">
        <asp:Label ID="lblTitle" runat="server"></asp:Label>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        Date :
        <asp:TextBox ID="txtStartDate" runat="server" Width="70"></asp:TextBox>
        <input type="image" src="../images/Calendar.jpg" id="btnOk" />
        <ajaxToolkit:CalendarExtender ID="startCal" runat="server" TargetControlID="txtStartDate"
          Format="MM-dd-yyyy" PopupButtonID="btnOk" CssClass="MyCalendar">
        </ajaxToolkit:CalendarExtender>
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtStartDate"
          SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />Start Date is required." />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender3"
          TargetControlID="RequiredFieldValidator1" HighlightCssClass="validatorCalloutHighlight" />
        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtStartDate"
          Operator="DataTypeCheck" Type="Date" ErrorMessage="Please enter a valid date (MM-dd-yyyy)."
          SetFocusOnError="true" Display="none">
        </asp:CompareValidator>
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender2"
          TargetControlID="CompareValidator3" HighlightCssClass="validatorCalloutHighlight" />
        to
        <asp:TextBox ID="txtEndDate" runat="server" Width="70"></asp:TextBox>
        <input type="image" src="../images/Calendar.jpg" id="Image1" />
        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtEndDate"
          Format="MM-dd-yyyy" PopupButtonID="Image1" CssClass="MyCalendar">
        </ajaxToolkit:CalendarExtender>
        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtEndDate"
          SetFocusOnError="true" Display="None" ErrorMessage="<b>Required Field Missing</b><br />End Date is required." />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender4"
          TargetControlID="RequiredFieldValidator2" HighlightCssClass="validatorCalloutHighlight" />
        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtEndDate"
          Operator="DataTypeCheck" Type="Date" ErrorMessage="Please enter a valid date (MM-dd-yyyy)."
          SetFocusOnError="true" Display="none">
        </asp:CompareValidator>
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ajaxreqPassword" TargetControlID="CompareValidator2"
          HighlightCssClass="validatorCalloutHighlight" />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtEndDate"
          ControlToCompare="txtStartDate" Operator="GreaterThan" Type="Date" ValueToCompare="MM-dd-yyyy"
          ErrorMessage="End date must be greater then Start Date." SetFocusOnError="true"
          Display="none">
        </asp:CompareValidator>
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1"
          TargetControlID="CompareValidator1" HighlightCssClass="validatorCalloutHighlight" />
        <asp:Label Text="Project :" ID="lblProject" runat="server" Visible="false"></asp:Label>
        <asp:DropDownList ID="drdProject" runat="server" Visible="false">
        </asp:DropDownList>
        <asp:Label ID="lblUser" runat="server" Text="User :" Visible="false"></asp:Label>
        <asp:DropDownList ID="drdUserList" runat="server" Visible="false">
        </asp:DropDownList>
        <asp:Button ID="lblGo" runat="server" CssClass="btngo" onmouseover="this.className='btngohover'"
          onmouseout="this.className='btngo'" OnClick="lblGo_Click" />
      </td>
    </tr>
    <tr>
      <td align="left">
        <div id="chart_div">
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <div id="chart_div1">
        </div>
      </td>
    </tr>
  </table>
</asp:Content>
