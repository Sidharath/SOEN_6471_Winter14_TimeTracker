<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true"
    CodeFile="MissingEntries.aspx.cs" Inherits="Admin_MissingEntery" Title="Missing TimeSheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">
        .accordion .panel
        {
            border: dotted 1px #555555;
            margin-bottom: 2px;
        }
        .accordion .panel h1
        {
            padding: 0.2em;
            font-size: 1.0em;
            font-weight: bold;
            background-color: #CCC;
            cursor: pointer;
        }
        .accordion .panel .content
        {
            padding: 0.5em;
        }
    </style>
    
    <script src="../scripts/jquery-1.4.1.js" type="text/javascript"></script>
  <script src="http://code.jquery.com/jquery-1.6.4.js" type="text/javascript"></script>
    <script src="../scripts/jquery-1.4.1.min.js" type="text/javascript"></script>

<script type="text/javascript">
   $(document).ready(function() {
    $('.accordion .panel h1').click(function() {
        $(this).next('.content').slideToggle();
    });
    var all = $('.accordion .panel .content')
    $('#ca').click(function() { all.slideUp(); });
    $('#ea').click(function() { all.slideDown(); });
});
</script>


    <table width="90%" border="0" cellspacing="6" cellpadding="0">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" valign="top" class="title1">
                View Missing Entries in Time Sheet
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
        <tr>
            <td align="left" valign="top">
                Date :
                <asp:TextBox ID="txtStartDate" runat="server" Width="70"></asp:TextBox>
                <input type="image" src="../images/Calendar.jpg" id="btnOk" />
                <ajaxToolkit:CalendarExtender ID="startCal" runat="server" TargetControlID="txtStartDate"
                    Format="dd-MMM-yy" PopupButtonID="btnOk" CssClass="MyCalendar">
                </ajaxToolkit:CalendarExtender>
                <asp:RequiredFieldValidator ValidationGroup="Validate" ControlToValidate="txtStartDate"
                    SetFocusOnError="true" Display="None" ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="<b>Required Field Missing</b><br />Start Date is required.">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexpName" runat="server" ErrorMessage="Please enter a valid date (MM-dd-yyyy)."
                    Display="None" ControlToValidate="txtStartDate" ValidationGroup="Validate" ValidationExpression="^(d{0}|(31(?!(Feb|feb|Apr|apr|Jun|jun|Sep|sep|Nov|nov)))|((30|29)(?!Feb|feb))|(29(?=Feb|feb(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))))|(29(?=Feb|feb(((0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))))|(0?[1-9])|1\d|2[0-8])[- ](Jan|jan|feb|Feb|mar|Mar|may|May|apr|Apr|jul|Jul|Jun|jun|Aug|aug|Oct|oct|Sep|sep|Nov|nov|dec|Dec)[- ]((1[6-9]|[2-9]\d)\d{2}|\d{2}|d{0})$" />
                <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender3"
                    TargetControlID="RequiredFieldValidator1" HighlightCssClass="validatorCalloutHighlight" />
                <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender2"
                    TargetControlID="regexpName" HighlightCssClass="validatorCalloutHighlight" />
                to
                <asp:TextBox ID="txtEndDate" runat="server" Width="70"></asp:TextBox>
                <input type="image" src="../images/Calendar.jpg" id="Image1" />
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtEndDate"
                    Format="dd-MMM-yy" PopupButtonID="Image1" CssClass="MyCalendar">
                </ajaxToolkit:CalendarExtender>
                <asp:RequiredFieldValidator ValidationGroup="Validate" ControlToValidate="txtEndDate"
                    SetFocusOnError="true" Display="None" ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="<b>Required Field Missing</b><br />End Date is required.">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid date (MM-dd-yyyy)."
                    Display="None" ControlToValidate="txtEndDate" ValidationGroup="Validate" ValidationExpression="^(d{0}|(31(?!(Feb|feb|Apr|apr|Jun|jun|Sep|sep|Nov|nov)))|((30|29)(?!Feb|feb))|(29(?=Feb|feb(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))))|(29(?=Feb|feb(((0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))))|(0?[1-9])|1\d|2[0-8])[- ](Jan|jan|feb|Feb|mar|Mar|may|May|apr|Apr|jul|Jul|Jun|jun|Aug|aug|Oct|oct|Sep|sep|Nov|nov|dec|Dec)[- ]((1[6-9]|[2-9]\d)\d{2}|\d{2}|d{0})$" />
                <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1"
                    TargetControlID="RequiredFieldValidator2" HighlightCssClass="validatorCalloutHighlight" />
                <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender4"
                    TargetControlID="RegularExpressionValidator1" HighlightCssClass="validatorCalloutHighlight" />
            </td>
        </tr>
       
       <tr>
        <td align="left" valign="top">
            <br />
            <asp:Button ID="btnGo" runat="server" CssClass="btngo" onmouseover="this.className='btngohover'"
                onmouseout="this.className='btngo'" OnClick="lblGo_Click" ValidationGroup="Validate" />
        </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                <asp:Label ID="lblDetail" runat="server" Text="Time Sheet Detail" Visible="false"></asp:Label>
            </td>
        </tr>
     
        
        <tr>
        <td>
         <div  id="btndiv" runat="server" visible="false">
         <img style="height: 25px; cursor: pointer;" src="../Images/expand.png" alt="Expand" id="ea" ToolTip="Expand All" />
         <img style="height: 25px; cursor: pointer;"  src="../Images/collapse.png" alt="Collapse" id="ca"  ToolTip="Collapse All"/>
       
        <br />
        <hr />
        <div runat="server" id="MainPanel" class="accordion">
           
        </div>
    </div>
        </td>
        </tr>
    </table>
</asp:Content>
