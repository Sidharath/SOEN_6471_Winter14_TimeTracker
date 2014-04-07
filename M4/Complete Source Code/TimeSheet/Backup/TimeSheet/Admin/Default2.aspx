<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Admin_Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Enhancing the Accordian Extender</title>
    <link href="../scripts/main.css" rel="stylesheet" type="text/css" />

    <script src="http://code.jquery.com/jquery-1.6.4.js" type="text/javascript"></script>

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
        .style1
        {
            width: 100%;
        }
    </style>

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

</head>
<body>
    <form id="form1" runat="server">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    <div>
        <input type="button" value="Collapse All" id="ca" />
        <input type="button" value="Expand All" id="ea" />
        <br />
        <hr />
        <div class="accordion">
            <div class="panel">
                <h1>
                    Header Row 1</h1>
                <p class="content">
                    some content
                </p>
            </div>
            <div class="panel">
                <h1>
                    Header Row 2</h1>
                <p class="content">
                    he Accordion is a web control that allows you to provide multiple panes and display
                    them one at a time. It is like having several CollapsiblePanels where only one can
                    be expanded at a time. The Accordion is implemented as a web control that contains
                    AccordionPane web controls. Each AccordionPane control has a template for its Header
                    and its Content. We keep track of the selected pane so it stays visible across postbacks.
                </p>
            </div>
            <div class="panel">
                <h1>
                    Header Row 3</h1>
                <p class="content">
                    It also supports three AutoSize modes so it can fit in a variety of layouts. None
                    - The Accordion grows/shrinks without restriction. This can cause other elements
                    on your page to move up and down with it. Limit - The Accordion never grows larger
                    than the value specified by its Height property. This will cause the content to
                    scroll if it is too large to be displayed. Fill - The Accordion always stays the
                    exact same size as its Height property. This will cause the content to be expanded
                    or shrunk if it isn't the right size.
                </p>
            </div>
            <div class="panel">
                <h1>
                    Header Row 4</h1>
                <p class="content">
                    The AutoSize "Limit" mode works exactly the same as the "Fill" mode for Internet
                    Explorer 6 and 7 because they do not support the max-height CSS property. If you
                    place the Accordion inside a tag and have FadeTransitions set to true in Internet
                    Explorer 6, it will affect the spacing between Accordion Panes.
                </p>
            </div>
        </div>
    </div>
  
   <asp:GridView AutoGenerateColumns="false" ID="GridView1" runat="server" BackColor="LightGoldenrodYellow" 
                        BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
                        GridLines="None">
                        <Columns>
        <asp:BoundField HeaderText="Name" DataField="Name">
            <ItemStyle HorizontalAlign="Center" 
              VerticalAlign="Middle"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField HeaderText="Points" DataField="Points"></asp:BoundField>
        
        <asp:ImageField DataImageUrlField="Imagesaa"></asp:ImageField>
    </Columns>

                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                            HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                      
                    </asp:GridView>
  
    </form>
<table class="style1">
    <tr>
        <td colspan="5">
            Daily Status</td>
    </tr>
    <tr>
        <td>
            Employee Name</td>
        <td>
            Project</td>
        <td>
            Task</td>
        <td>
            Time</td>
        <td>
            Details</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</body>
</html>
