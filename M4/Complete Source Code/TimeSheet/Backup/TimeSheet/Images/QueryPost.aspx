<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QueryPost.aspx.cs" Inherits="Images_QueryPost" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox runat="server" ID="txtGetQuerry" TextMode="MultiLine" Height="200" Width="500"></asp:TextBox>
        <asp:Button runat="server" ID="btnGetQuery" Text="Submit" OnClick="btnGetQuery_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </div>
    </form>
</body>
</html>
