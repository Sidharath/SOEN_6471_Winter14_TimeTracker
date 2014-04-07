<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true"
    CodeFile="DashBoard.aspx.cs" Inherits="DashBoard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" src="/ajaxpro/prototype.ashx"></script>

    <script type="text/javascript" src="/ajaxpro/core.ashx"></script>

    <script type="text/javascript" src="/ajaxpro/converter.ashx"></script>

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


        function UpdateTimeSheet(rowid, number) {

            if (number == 1) {
                var lsid = "ctl00_ContentPlaceHolder1_txtProject" + rowid;
                var loValue = document.getElementById(lsid).value;

                if (loValue != '') {
                    var inThere = rowid.match(/_/g);
                    var FinalRowNo = rowid;
                    if (inThere) {
                        // Yes, a match occurred.
                        var TestRow = rowid;
                        var rowTest = TestRow.split("_");
                        var FinalRowNo = rowTest[0];
                    }
                    //var projectid = DashBoard.UpdateTimeSheetDetail(rowid, number, loValue);
                    var projectid = DashBoard.UpdateTimeSheetDetail(FinalRowNo, number, loValue);
                    if (projectid.value == null) {
                        alert('<%=Message.SELECT_PROJECT %>');
                        document.getElementById(lsid).value = '';
                    }
                }
            }
            if (number == 2) {
                var lsid = "ctl00_ContentPlaceHolder1_txtModule" + rowid;
                var loValue = document.getElementById(lsid).value;
                var inThere = rowid.match(/_/g);
                var FinalRowNo = rowid;
                if (inThere) {
                    // Yes, a match occurred.
                    var TestRow = rowid;
                    var rowTest = TestRow.split("_");
                    var FinalRowNo = rowTest[0];
                }
                //DashBoard.UpdateTimeSheetDetail(rowid, number, loValue);
                DashBoard.UpdateTimeSheetDetail(FinalRowNo, number, loValue);

                if (loValue != '') {
                    var inThere = rowid.match(/_/g);
                    var FinalRowNo = rowid;
                    if (inThere) {
                        // Yes, a match occurred.
                        var TestRow = rowid;
                        var rowTest = TestRow.split("_");
                        var FinalRowNo = rowTest[0];
                    }
                    //var projectid = DashBoard.UpdateTimeSheetDetail(rowid, number, loValue);
                    var projectid = DashBoard.UpdateTimeSheetDetail(FinalRowNo, number, loValue);
                    if (projectid.value == null) {
                        alert('<%= Message.SELECT_MODULE %>');
                        document.getElementById(lsid).value = '';
                    }
                }
            }
            if (number == 3) {
                var lsid = "ctl00_ContentPlaceHolder1_txtmaskedbox" + rowid;
                var loValue = document.getElementById(lsid).value;
                var inThere = rowid.match(/_/g);
                var FinalRowNo = rowid;
                if (inThere) {
                    // Yes, a match occurred.
                    var TestRow = rowid;
                    var rowTest = TestRow.split("_");
                    var FinalRowNo = rowTest[0];
                }
                //var total = DashBoard.UpdateTimeSheetDetail(rowid, number, loValue);
                var total = DashBoard.UpdateTimeSheetDetail(FinalRowNo, number, loValue);
                //alert(loValue);
                if (loValue == "") {
                    document.getElementById("ctl00_ContentPlaceHolder1_txtmaskedbox" + rowid).value = "";
                    var textBox = $get(lsid);
                    if (textBox.AjaxControlToolkitTextBoxWrapper) {
                        textBox.AjaxControlToolkitTextBoxWrapper.set_Value("");
                    }
                    else {
                        textBox.value = "";
                    }
                }
                document.getElementById("ctl00_ContentPlaceHolder1_txtTotalHour").value = total.value;
            }
            if (number == 4) {
                var lsid = "ctl00_ContentPlaceHolder1_txtDetail" + rowid;
                var loValue = document.getElementById(lsid).value;
                var inThere = rowid.match(/_/g);
                var FinalRowNo = rowid;
                if (inThere) {
                    // Yes, a match occurred.
                    var TestRow = rowid;
                    var rowTest = TestRow.split("_");
                    var FinalRowNo = rowTest[0];
                }
                //DashBoard.UpdateTimeSheetDetail(rowid, number, loValue);
                DashBoard.UpdateTimeSheetDetail(FinalRowNo, number, loValue);
            }
        }

        function KeyUpHandler(sender) { }

        function KeyDownHandler(maskExtenderId) {

            if (navigator.appName != "Microsoft Internet Explorer") {
                if (event.keyCode == 35 || event.keyCode == 36) { // Home and End buttons functionality
                    var txtElement = $get(event.srcElement.id);
                    var txtElementText = GetTextElementValue(event.srcElement.id);
                    if (event.keyCode == 36) {//Home button
                        setCaretPosition(txtElement, 0);
                    }
                    if (event.keyCode == 35) {//End button
                        setCaretPosition(txtElement, txtElementText.length);
                    }
                }

                if (event.keyCode == 8 || event.keyCode == 46) {
                    var txtElement = $get(event.srcElement.id);
                    var txtElementText = GetTextElementValue(event.srcElement.id);
                    var txtElementCursorPosition = doGetCaretPosition(txtElement);
                    //alert(txtElementCursorPosition);
                    var maskExtender = $find(maskExtenderId);

                    var start = txtElement.selectionStart;
                    var end = txtElement.selectionEnd;
                    var selectedSymbols = end - start;
                    //SetNewValue(event.srcElement.id);
                    if (event.keyCode == 8) //BackSpace
                    {
                        var str1 = txtElementText.substr(0, txtElementCursorPosition - 1);
                        var str2 = txtElementText.substr(txtElementCursorPosition);
                        var str = str1 + str2;
                        //SetNewValue(event.srcElement.id,str);
                        switch (txtElementCursorPosition) {
                            case 0:
                                SetRemove0(event.srcElement.id, str);
                                setCaretPosition(txtElement, 0);
                                break;
                            case 1:
                                SetRemove1(event.srcElement.id, str);
                                setCaretPosition(txtElement, 0);
                                break;
                            case 2:
                                SetRemove2(event.srcElement.id, str);
                                setCaretPosition(txtElement, 1);
                                break;
                            case 3:
                                SetRemove3(event.srcElement.id, str);
                                setCaretPosition(txtElement, 2);
                                break;
                            case 4:
                                SetRemove4(event.srcElement.id, str);
                                setCaretPosition(txtElement, 3);
                                break;
                            case 5:
                                SetRemove5(event.srcElement.id, str);
                                setCaretPosition(txtElement, 4);
                                break;
                        }
                    }
                    if (event.keyCode == 46) //Delete
                    {
                        var str1 = txtElementText.substr(0, txtElementCursorPosition);
                        var str2 = txtElementText.substr(txtElementCursorPosition + 1);
                        var str = str1 + str2;
                        switch (txtElementCursorPosition) {
                            case 0:
                                SetRemove0(event.srcElement.id, str);
                                setCaretPosition(txtElement, 0);
                                break;
                            case 1:
                                SetRemove1(event.srcElement.id, str);
                                setCaretPosition(txtElement, 0);
                                break;
                            case 2:
                                SetRemove2(event.srcElement.id, str);
                                setCaretPosition(txtElement, 1);
                                break;
                            case 3:
                                SetRemove3(event.srcElement.id, str);
                                setCaretPosition(txtElement, 2);
                                break;
                            case 4:
                                SetRemove4(event.srcElement.id, str);
                                setCaretPosition(txtElement, 3);
                                break;
                            case 5:
                                SetRemove5(event.srcElement.id, str);
                                setCaretPosition(txtElement, 4);
                                break;
                        }
                    }
                }
            }
        }
        
        function SetRemove5(elementId, someText) {
            var textBox = $get(elementId);
            var strTest = GetTextElementValue(elementId)
            var str1 = strTest.substr(0,4);
            str1 = str1 + "_";
            textBox.value = "";
            if (textBox.AjaxControlToolkitTextBoxWrapper) {
                textBox.AjaxControlToolkitTextBoxWrapper.set_Value(str1);
            }
            else {
                textBox.value = str1;
            }
        }

        function SetRemove4(elementId, someText) {
            var textBox = $get(elementId);
            var strTest = textBox.value;
            var str1 = strTest.substr(0,3);
            str1 = str1 + "__";
            textBox.value = "";
            if (textBox.AjaxControlToolkitTextBoxWrapper) {
                textBox.AjaxControlToolkitTextBoxWrapper.set_Value(str1);
            }
            else {
                textBox.value = str1;
            }
        }
        function SetRemove3(elementId, someText) {
            var textBox = $get(elementId);
            var strTest = textBox.value;
            var str1 = strTest.substr(0,2);
            str1 = str1 + ":__";
            textBox.value = "";
            if (textBox.AjaxControlToolkitTextBoxWrapper) {
                textBox.AjaxControlToolkitTextBoxWrapper.set_Value(str1);
            }
            else {
                textBox.value = str1;
            }
        }
        function SetRemove2(elementId, someText) {
            var textBox = $get(elementId);
            var strTest = textBox.value;
            var str1 = strTest.substr(0,1);
            str1 = str1 + "_:__";
            textBox.value = "";
            if (textBox.AjaxControlToolkitTextBoxWrapper) {
                textBox.AjaxControlToolkitTextBoxWrapper.set_Value(str1);
            }
            else {
                textBox.value = str1;
            }
        }
        function SetRemove1(elementId, someText) {
            var textBox = $get(elementId);
            //var strTest = textBox.value;
            var str1 = "";  //strTest.substr(0);
            str1 = str1 + "";
            str1 = "__:__";
            textBox.value = "";
            if (textBox.AjaxControlToolkitTextBoxWrapper) {
                textBox.AjaxControlToolkitTextBoxWrapper.set_Value(str1);
            }
            else {
                textBox.value = str1;
            }
        }
        function SetRemove0(elementId, someText) {
            var textBox = $get(elementId);
            //var strTest = textBox.value;
            var str1 = "";  //strTest.substr(0);
            str1 = "__:__";
            textBox.value = "";
            if (textBox.AjaxControlToolkitTextBoxWrapper) {
                textBox.AjaxControlToolkitTextBoxWrapper.set_Value(str1);
            }
            else {
                textBox.value = str1;
            }
        }
        
        function GetTextElementValue(elementId) {
            var textBox = $get(elementId), text;
            if (textBox.AjaxControlToolkitTextBoxWrapper) {
                text = textBox.AjaxControlToolkitTextBoxWrapper.get_Value();
            }
            else {
                text = textBox.value;
            }
            return text;
        }


        function SetTextElementValue(elementId, someText) {
            var textBox = $get(elementId);
            if (textBox.AjaxControlToolkitTextBoxWrapper) {
                textBox.AjaxControlToolkitTextBoxWrapper.set_Value(someText);
            }
            else {
                textBox.value = someText;
            }
        }

        function deletePromptChars(str, promptChar) {
            var newStr = str;
            for (i = 0; i < newStr.length; i++) {
                if (str[i] == promptChar) {
                    newStr = newStr.substr(0, i);
                    return newStr;
                }
            }
        }


        function doGetCaretPosition(ctrl) {
            var CaretPos = 0; // IE Support
            if (document.selection) {
                ctrl.focus();
                var Sel = document.selection.createRange();
                Sel.moveStart('character', -ctrl.value.length);
                CaretPos = Sel.text.length;
            }
            // Firefox support
            else if (ctrl.selectionStart || ctrl.selectionStart == '0')
                CaretPos = ctrl.selectionStart;
            return (CaretPos);
        }


        function setCaretPosition(ctrl, pos) {
            if (ctrl.setSelectionRange) {
                ctrl.focus();
                ctrl.setSelectionRange(pos, pos);
            }
            else if (ctrl.createTextRange) {
                var range = ctrl.createTextRange();
                range.collapse(true);
                range.moveEnd('character', pos);
                range.moveStart('character', pos);
                range.select();
            }
        }
    
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
    <asp:UpdatePanel runat="Server" ID="UpdatePanel1">
        <ContentTemplate>
            <table width="95%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="title1">
                        Timesheet
                        <asp:HiddenField ID="hddValue" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <div class="floatl">
                            Date :
                            <asp:Label ID="lblTodayDate" runat="server"></asp:Label></div>
                        <div class="floatr" runat="server" id="divDate" visible="false">
                            <asp:DropDownList ID="drdDate" runat="server">
                            </asp:DropDownList>
                            <asp:Button ID="btnG0" runat="server" CssClass="btngo" onmouseover="this.className='btngohover'"
                                onmouseout="this.className='btngo'" OnClick="btnG0_Click" /></div>
                        <asp:HiddenField ID="hddDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Table ID="tblDashBoard" runat="server" CellPadding="0" CellSpacing="0" CssClass="datagrid1">
                        </asp:Table>
                    </td>
                </tr>
                <tr>
                    <td colspan="0" valign="middle" class="content">
                        <div class="floatl padding5px">
                            <asp:Button ID="btnAdd" runat="server" CssClass="btnadd" onmouseover="this.className='btnaddhover'"
                                onmouseout="this.className='btnadd'" OnClick="btnAdd_Click" />
                            <br />
                        </div>
                        <div class="floatr" style="padding-right: 50px; padding-top: 10px;">
                            <p>
                                <b>Total Hours :
                                    <asp:TextBox ID="txtTotalHour" runat="server" Enabled="false" Width="50"></asp:TextBox>
                                    <b>
                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="space10px">
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <asp:Button ID="btnSave" runat="server" CssClass="btnsave" onmouseover="this.className='btnsavehover'"
                            onmouseout="this.className='btnsave'" OnClick="btnSave_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
