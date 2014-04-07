<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/admin.master"
    CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="90%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" valign="top" class="title1">
                Dashboard
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
                <ul class="tableIcon">
                    <asp:Repeater ID="rptUserMaster" runat="server">
                        <ItemTemplate>
                            <li>
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="9" onmouseover="this.className='tableborder1'"
                                    onmouseout="this.className='tableborder'" class="tableborder">
                                    <tr>
                                        <td width="39%" align="left" valign="top">
                                            <a href="<%=lsRootPath %>/Admin/DailyStatus.aspx?u_id=<%#Eval("nmUserID").ToString()%>&u_name=<%#Eval("szContactPerson").ToString()%>">
                                                <img src="<%=lsRootPath %>/images/<%#Eval("szPhotoPath").ToString()%>" width="84"
                                                    height="100" />
                                            </a>
                                        </td>
                                        <td width="61%" align="left" valign="top">
                                            <a href="<%=lsRootPath %>/Admin/DailyStatus.aspx?u_id=<%#Eval("nmUserID").ToString()%>&u_name=<%#Eval("szContactPerson").ToString()%>">
                                                <%#Eval("szContactPerson").ToString()%>
                                                <br />
                                                <br />
                                                Current Month :
                                                <%#GetCurrentMonth(Eval("nmUserID").ToString())%>
                                                hr<br />
                                                Current Week :
                                                <%#GetCurrentWeek(Eval("nmUserID").ToString())%>
                                                hr<br />
                                                Yesterday :
                                                <%#GetYeasterDayHour(Eval("nmUserID").ToString())%>
                                                hr</a><br />
                                        </td>
                                    </tr>
                                </table>
                                </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
