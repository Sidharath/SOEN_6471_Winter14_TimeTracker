using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NarolaInfotech.Data;
using NarolaInfotech.Utility;
using AjaxControlToolkit;
using TimeSheet;
using System.Data;
public partial class DashBoard : System.Web.UI.Page
{
    public string msRootPath = string.Empty;

    #region _dtTimeSheetDetail
    private DataTable _dtTimeSheetDetail
    {
        get { return (DataTable)Session["_dtTimeSheetDetail"]; }
        set { Session["_dtTimeSheetDetail"] = value; }
    }
    #endregion

    #region _Count
    private int _Count
    {
        get { return (int)Session["_Count"]; }
        set { Session["_Count"] = value; }
    }
    #endregion

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        AjaxPro.Utility.RegisterTypeForAjax(typeof(DashBoard));

        msRootPath = clsFunctions.GetSiteRoot();

        if (!IsPostBack)
        {
            LoadPermissionDate();
            ManageTable(DateTime.Now);
            lblTodayDate.Text = DateTime.Today.ToString("dd-MMM-yy");
        }
        SetDashBoard();
    }
    #endregion

    #region loDeleteImage_click
    protected void loDeleteImage_click(object sender, EventArgs e)
    {
        String lsImageId = ((ImageButton)sender).ID;
        lsImageId = lsImageId.Replace("imDelete", "");
        string FinalRowNo = lsImageId;
        if (lsImageId.Contains("_"))
        {
            string[] rowTest = lsImageId.Split('_');
            FinalRowNo = rowTest[0];
        }
        //delete selected row.

        DataRow[] LoValue = null;
        try
        {
            //LoValue = _dtTimeSheetDetail.Select("nmTimeSheetDetail=" + lsImageId + "");
            LoValue = _dtTimeSheetDetail.Select("nmTimeSheetDetail=" + FinalRowNo + "");
            if (LoValue.Length > 0)
            {
                LoValue[0].Delete();
                SetDashBoard();
            }

        }
        catch (Exception ex)
        {

        }
    }
    #endregion

    #region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(hddDate.Value))
        {
            ManageSave(Convert.ToDateTime(hddDate.Value));
        }
        else
        {
            ManageSave(DateTime.Now);
        }
    }
    #endregion

    #region btnAdd_Click
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DataRow dr = null;
        try
        {
            dr = _dtTimeSheetDetail.NewRow();
            _Count++;
            dr["nmTimeSheetDetail"] = _Count;
            _dtTimeSheetDetail.Rows.Add(dr);
            SetDashBoard();


        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion

    #region tnG0_Click
    protected void btnG0_Click(object sender, EventArgs e)
    {
        lblMessage.Text = string.Empty;
        DateTime loDate = Convert.ToDateTime(drdDate.SelectedValue);
        ManageTable(loDate);
        SetDashBoard();
        hddDate.Value = drdDate.SelectedValue;
        lblTodayDate.Text = loDate.ToString("dd-MMM-yy");
    }
    #endregion

    #region SetDashBoard
    private void SetDashBoard()
    {
        TableHeaderCell loTableHeader = null;
        TableRow loTableRow = null;
        try
        {
            tblDashBoard.Rows.Clear();

            #region Add Header

            loTableRow = new TableRow();

            loTableHeader = new TableHeaderCell();
            loTableHeader.Text = "Project";
            loTableHeader.Width = Unit.Pixel(160);
            loTableRow.Cells.Add(loTableHeader);
            tblDashBoard.Rows.Add(loTableRow);

            loTableHeader = new TableHeaderCell();
            loTableHeader.Text = "Task";
            loTableHeader.Width = Unit.Pixel(154);
            loTableRow.Cells.Add(loTableHeader);
            tblDashBoard.Rows.Add(loTableRow);

            loTableHeader = new TableHeaderCell();
            loTableHeader.Text = "Hours";
            loTableHeader.Width = Unit.Pixel(60);
            loTableRow.Cells.Add(loTableHeader);
            tblDashBoard.Rows.Add(loTableRow);

            loTableHeader = new TableHeaderCell();
            loTableHeader.Text = "Notes";
            loTableHeader.Width = Unit.Pixel(450);
            loTableRow.Cells.Add(loTableHeader);
            tblDashBoard.Rows.Add(loTableRow);

            loTableHeader = new TableHeaderCell();
            loTableHeader.Text = "Delete";
            loTableHeader.Width = Unit.Pixel(55);
            loTableRow.Cells.Add(loTableHeader);
            tblDashBoard.Rows.Add(loTableRow);


            #endregion

            foreach (DataRow dr in _dtTimeSheetDetail.Rows)
            {
                if (dr.RowState != DataRowState.Deleted)
                {
                    AddRow(dr);
                }
            }
            //txtTotalHour.Text = _dtTimeSheetDetail.Compute("SUM(nmHourValue)", string.Empty).ToString();
            txtTotalHour.Text = Count_Total_Time();
        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion

    public string Count_Total_Time()
    {
        Int32 finalHour = 0;
        Int32 totalHour = 0;
        Int32 finalMinutes = 0;
        Int32 totalMinutes = 0;
        foreach (DataRow dr in _dtTimeSheetDetail.Rows)
        {
            if (dr.RowState == DataRowState.Deleted)
            {
                totalHour = totalHour + 0;
                totalMinutes = totalMinutes + 0;
            }
            else
            {
                string[] splittime = dr["nmHourID"].ToString().Split(':');
                if (splittime.Length == 2)
                {
                    // Chnage Made by Shiv on 13/12/2012 To make hour in correct format and value
                    try
                    {
                        string strHour = splittime[0].Replace('_', ' ');
                        strHour = strHour.Trim();
                        int intHour = (!string.IsNullOrEmpty(strHour) ? Convert.ToInt32(strHour) : 0);
                        string strMinute = splittime[1].Replace('_', ' ');
                        strMinute = strMinute.Trim();
                        int intMinute = (!string.IsNullOrEmpty(strMinute) ? Convert.ToInt32(strMinute) : 0);
                        totalHour = totalHour + intHour; //Convert.ToInt32(splittime[0].Replace('_', '0'));
                        totalMinutes = totalMinutes + intMinute; //Convert.ToInt32(splittime[1].Replace('_', '0'));
                    }
                    catch (Exception ex)
                    {
                    }
                }
                else
                {
                    totalHour = totalHour + 0;
                    totalMinutes = totalMinutes + 0;
                }
            }

        }

        finalHour = totalHour;
        Int32 temph = 0;
        temph = Math.DivRem(totalMinutes, 60, out finalMinutes);
        finalHour = finalHour + temph;
        string return_time = "";
        if (finalHour.ToString().Length == 1)
        {
            return_time += "0" + finalHour.ToString();
        }
        else
        {
            return_time += finalHour.ToString();
        }
        return_time += ":";
        if (finalMinutes.ToString().Length == 1)
        {
            return_time += "0" + finalMinutes.ToString();
        }
        else
        {
            return_time += finalMinutes.ToString();
        }
        //return finalHour.ToString() + ":"+ finalMinutes.ToString();
        return return_time;
        // finalMinutes =   totalMinutes % 60;
    }

    #region AddRow
    private void AddRow(DataRow drRow)
    {
        TableRow loTableRow = null;
        TableCell loTableCell = null;
        TextBox loTextBox = null;
        TextBox txtmaskedbox = null;
        ImageButton loDeleteImage = null;
        AutoCompleteExtender loAutoCompleteExtender = null;
        string NullTimeSheetCheck = drRow["nmProjectID"].ToString();
        String lsSetID;
        if (string.IsNullOrEmpty(NullTimeSheetCheck))
        {
            lsSetID = drRow["nmTimeSheetDetail"].ToString() + "_1";
        }
        else
        {
            lsSetID = drRow["nmTimeSheetDetail"].ToString();
        }
        DropDownList loDropDown = null;
        try
        {
            loTableRow = new TableRow();

            //Add Project Textbox.
            loTableCell = new TableCell();
            loTextBox = new TextBox();
            loTextBox.ID = "txtProject" + lsSetID;
            loTextBox.Attributes.Add("autocomplete", "off");
            loTextBox.Text = drRow["szProjectName"].ToString();
            loTextBox.Attributes.Add("onBlur", "UpdateTimeSheet('" + lsSetID + "','1');");

            loAutoCompleteExtender = new AutoCompleteExtender();
            loAutoCompleteExtender.ID = "AutoCompleteExtenderProject" + lsSetID;
            loAutoCompleteExtender.TargetControlID = loTextBox.ID;
            loAutoCompleteExtender.ServiceMethod = "GetProjectName";
            loAutoCompleteExtender.ServicePath = clsFunctions.GetSiteRoot() + "/AutoComplete.asmx";
            loAutoCompleteExtender.MinimumPrefixLength = 1;
            loAutoCompleteExtender.CompletionInterval = 10;
            loAutoCompleteExtender.FirstRowSelected = true;
            loAutoCompleteExtender.EnableCaching = true;
            loAutoCompleteExtender.CompletionListCssClass = "autocomplete_completionListElement";
            loAutoCompleteExtender.CompletionListItemCssClass = "autocomplete_listItem";
            loAutoCompleteExtender.CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem";
            loAutoCompleteExtender.CompletionSetCount = 10;

            loTableCell.Controls.Add(loAutoCompleteExtender);
            loTableCell.Controls.Add(loTextBox);
            loTableRow.Cells.Add(loTableCell);

            //Add Module Textbox.
            loTableCell = new TableCell();
            loTextBox = new TextBox();
            loTextBox.ID = "txtModule" + lsSetID;
            loTextBox.Attributes.Add("autocomplete", "off");
            loTextBox.Text = drRow["szModuleName"].ToString();
            loTextBox.Attributes.Add("onBlur", "UpdateTimeSheet('" + lsSetID + "','2');");

            loAutoCompleteExtender = new AutoCompleteExtender();
            loAutoCompleteExtender.ID = "AutoCompleteExtenderModule" + lsSetID;
            loAutoCompleteExtender.TargetControlID = loTextBox.ID;
            loAutoCompleteExtender.ServiceMethod = "GetModuleName";
            loAutoCompleteExtender.ServicePath = clsFunctions.GetSiteRoot() + "/AutoComplete.asmx";
            loAutoCompleteExtender.MinimumPrefixLength = 1;
            loAutoCompleteExtender.CompletionInterval = 10;
            loAutoCompleteExtender.EnableCaching = true;
            loAutoCompleteExtender.FirstRowSelected = true;
            loAutoCompleteExtender.CompletionListCssClass = "autocomplete_completionListElement";
            loAutoCompleteExtender.CompletionListItemCssClass = "autocomplete_listItem";
            loAutoCompleteExtender.CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem";
            loAutoCompleteExtender.CompletionSetCount = 10;

            loTableCell.Controls.Add(loAutoCompleteExtender);
            loTableCell.Controls.Add(loTextBox);
            loTableRow.Cells.Add(loTableCell);

            //Add Hours DropDownlist.
            //loTableCell = new TableCell();
            //loDropDown = new DropDownList();
            //GetAllHour(loDropDown);
            //loDropDown.Width = Unit.Pixel(60);

            //if (!string.IsNullOrEmpty(drRow["nmHourID"].ToString()))
            //{
            //  loDropDown.SelectedValue = drRow["nmHourID"].ToString();
            //}

            //loDropDown.ID = "drdHour" + lsSetID;
            //loDropDown.Attributes.Add("onBlur", "UpdateTimeSheet('" + lsSetID + "','3');");

            //loTableCell.Controls.Add(loDropDown);
            //loTableRow.Cells.Add(loTableCell);


            // Add Masked Text Box
            loTableCell = new TableCell();
            txtmaskedbox = new TextBox();
            txtmaskedbox.ID = "txtmaskedbox" + lsSetID;
            txtmaskedbox.ValidationGroup = "validate";
            txtmaskedbox.Text = drRow["nmHourID"].ToString();
            txtmaskedbox.Attributes.Add("onBlur", "UpdateTimeSheet('" + lsSetID + "','3');");

            System.Web.UI.WebControls.Unit wd = new Unit(50);
            txtmaskedbox.Width = wd;

            MaskedEditExtender objMaskedEditExtender = new MaskedEditExtender();
            objMaskedEditExtender.ID = "MaskedEditExtender" + lsSetID;
            objMaskedEditExtender.TargetControlID = txtmaskedbox.ID;
            objMaskedEditExtender.Mask = "99:99";
            objMaskedEditExtender.MessageValidatorTip = true;
            objMaskedEditExtender.MaskType = MaskedEditType.Time;
            objMaskedEditExtender.AcceptAMPM = false;
            objMaskedEditExtender.InputDirection = MaskedEditInputDirection.LeftToRight;
            objMaskedEditExtender.ErrorTooltipEnabled = true;
            objMaskedEditExtender.AutoComplete = true;
            objMaskedEditExtender.AutoCompleteValue = "__:__";
            txtmaskedbox.Attributes.Add("onkeydown", "KeyDownHandler('" + objMaskedEditExtender.ID + "');");


            MaskedEditValidator objMaskedEditValidator = new MaskedEditValidator();
            objMaskedEditValidator.ID = "MaskedEditValidator" + lsSetID;
            objMaskedEditValidator.ControlExtender = objMaskedEditExtender.ID;
            objMaskedEditValidator.ControlToValidate = txtmaskedbox.ID;
            objMaskedEditValidator.IsValidEmpty = true;
            objMaskedEditValidator.EmptyValueMessage = "";
            objMaskedEditValidator.InvalidValueMessage = "Invalid Hour";
            objMaskedEditValidator.Display = ValidatorDisplay.Dynamic;
            objMaskedEditValidator.TooltipMessage = "";
            objMaskedEditValidator.EmptyValueBlurredText = "*";
            objMaskedEditValidator.InvalidValueBlurredMessage = "Invalid Hour";
            objMaskedEditValidator.ValidationGroup = "validate";


            loTableCell.Controls.Add(txtmaskedbox);
            loTableCell.Controls.Add(objMaskedEditExtender);
            loTableCell.Controls.Add(objMaskedEditValidator);
            loTableRow.Cells.Add(loTableCell);

            //Add Detail Textbox.
            loTableCell = new TableCell();
            loTextBox = new TextBox();
            loTextBox.TextMode = TextBoxMode.MultiLine;
            loTextBox.Height = Unit.Pixel(40);
            loTextBox.Width = Unit.Percentage(100);
            loTextBox.Text = drRow["szDetail"].ToString();
            loTextBox.ID = "txtDetail" + lsSetID;
            loTextBox.Attributes.Add("onBlur", "UpdateTimeSheet('" + lsSetID + "','4');");
            loTextBox.ToolTip = loTextBox.Text;
            loTableCell.Controls.Add(loTextBox);
            loTableRow.Cells.Add(loTableCell);

            //Add Delete Button.
            loTableCell = new TableCell();
            loTableCell.HorizontalAlign = HorizontalAlign.Center;
            loTableCell.VerticalAlign = VerticalAlign.Middle;

            loDeleteImage = new ImageButton();
            loDeleteImage.CausesValidation = false;
            loDeleteImage.ID = "imDelete" + lsSetID;
            loDeleteImage.ImageUrl = clsFunctions.GetSiteRoot() + "/images/cancel.png";
            loDeleteImage.OnClientClick = "return window.confirm('Are you sure you want to delete this item')";
            loDeleteImage.Click += new ImageClickEventHandler(loDeleteImage_click);
            loTableCell.Controls.Add(loDeleteImage);
            loTableRow.Cells.Add(loTableCell);

            tblDashBoard.Rows.Add(loTableRow);
        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion

    #region GetAllHour
    private void GetAllHour(DropDownList loDropDown)
    {
        Hours loHour = null;
        DataSet dsHour = null;
        try
        {
            loHour = new Hours();
            dsHour = loHour.Load();

            loDropDown.DataSource = dsHour;
            loDropDown.DataValueField = "nmHourID";
            loDropDown.DataTextField = "nmHourValue";
            loDropDown.DataBind();
        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }

    }
    #endregion

    #region ManageTable
    private void ManageTable(DateTime dtCreationDate)
    {
        clsTimeSheet loTimeSheet = null;
        TimeSeetDetail loDetail = null;
        DataSet dsTimeSheet = null;
        DataSet dsValue = null;
        DataRow drValue = null;
        int nmTimeSheetID = 0;
        int DetailCount = 0;
        try
        {
            //Get Record for timesheet.
            loTimeSheet = new clsTimeSheet();
            loTimeSheet.dtCreateDate = dtCreationDate;
            loTimeSheet.nmUserID = Utility.GetUserId();
            dsTimeSheet = loTimeSheet.LoadTodayData();

            if (dsTimeSheet.Tables[0].Rows.Count > 0)
            {
                nmTimeSheetID = clsFunctions.ToInteger(dsTimeSheet.Tables[0].Rows[0]["nmTimeSheetID"]);
                hddValue.Value = nmTimeSheetID.ToString();
            }
            else
                hddValue.Value = string.Empty;

            loDetail = new TimeSeetDetail();
            loDetail.nmTimeSheetID = nmTimeSheetID;
            dsValue = loDetail.GetAllDetailByID();
            int j = 0;
            _dtTimeSheetDetail = dsValue.Tables[0].Copy();
            DetailCount = _dtTimeSheetDetail.Rows.Count;
            if (DetailCount == 0)
            {
                for (int i = 0; i < 5; i++)
                {
                    drValue = _dtTimeSheetDetail.NewRow();

                    #region Set Default Value
                    if (i == 0)
                    {
                        //Get Project Setting Value.
                        UserProjectSetting loSetting = new UserProjectSetting();
                        loSetting.nmUserID = Utility.GetUserId();
                        if (loSetting.GetValueByUSerID() == 0)
                        {
                            Project loProject = new Project();
                            loProject.nmProjectID = loSetting.nmProjectID;
                            loProject.LoadById();

                            Module loModule = new Module();
                            loModule.nmModule = loSetting.nmModule;
                            loModule.LoadById();

                            drValue["nmProjectID"] = loProject.nmProjectID.ToString();
                            drValue["szProjectName"] = loProject.szProjectName;
                            drValue["nmModule"] = loModule.nmModule.ToString();
                            drValue["szModuleName"] = loModule.szModuleName;
                            Session["ProjectID"] = loProject.nmProjectID;
                            drValue["nmTimeSheetDetail"] = j;
                            _dtTimeSheetDetail.Rows.Add(drValue);
                            j++;
                        }
                    }
                    #endregion

                    //  drValue["nmTimeSheetDetail"] = i;
                    //  _dtTimeSheetDetail.Rows.Add(drValue);
                }
            }
            if (DetailCount < 5)
            {
                if (j == 1)
                {
                    for (int i = 0; i < 4; i++)
                    {
                        drValue = _dtTimeSheetDetail.NewRow();
                        drValue["nmTimeSheetDetail"] = j;
                        _dtTimeSheetDetail.Rows.Add(drValue);
                        j++;
                    }
                }
                else
                {
                    for (int i = 0; i < 5 - DetailCount; i++)
                    {
                        drValue = _dtTimeSheetDetail.NewRow();
                        drValue["nmTimeSheetDetail"] = j;
                        _dtTimeSheetDetail.Rows.Add(drValue);
                        j++;
                    }
                }
            }
            _Count = clsFunctions.ToInteger(_dtTimeSheetDetail.Compute("MAX(nmTimeSheetDetail)", string.Empty));
        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion

    #region AjaxToolKits
    [AjaxPro.AjaxMethod]
    public string UpdateTimeSheetDetail(String lsRowID, String lsNumber, String lsValue)
    {
        string lsTotal = string.Empty;
        DataRow[] LoValue = null;
        LoValue = _dtTimeSheetDetail.Select("nmTimeSheetDetail='" + lsRowID + "'");
        if (LoValue.Length > 0)
        {
            switch (lsNumber)
            {
                case "1":
                    LoValue[0].BeginEdit();

                    //Get Project ID.
                    Project loProject = new Project();
                    loProject.szProjectName = lsValue;
                    loProject.GetProjectIDByName();

                    LoValue[0]["szProjectName"] = lsValue;
                    LoValue[0]["nmProjectID"] = loProject.nmProjectID.ToString();

                    LoValue[0].EndEdit();
                    if (loProject.nmProjectID != 0)
                    {
                        Session["ProjectID"] = loProject.nmProjectID;
                        lsTotal = loProject.nmProjectID.ToString();
                    }
                    break;

                case "2":
                    LoValue[0].BeginEdit();

                    //Get Module ID.
                    Module loModule = new Module();
                    loModule.szModuleName = lsValue;
                    loModule.nmProjectID = clsFunctions.ToInteger(LoValue[0]["nmProjectID"]);
                    loModule.GetProjectIDByName();

                    LoValue[0]["szModuleName"] = lsValue;
                    LoValue[0]["nmModule"] = loModule.nmModule;
                    LoValue[0].EndEdit();

                    if (loModule.nmModule != 0)
                    {
                        lsTotal = loModule.nmModule.ToString();
                    }
                    break;
                case "3":
                    LoValue[0].BeginEdit();

                    //Get Hour Value.
                    Hours loHour = new Hours();
                    loHour.nmHourID = clsFunctions.ToInteger(lsValue);
                    loHour.LoadById();

                    //LoValue[0]["nmHourValue"] = loHour.nmHourValue;
                    LoValue[0]["nmHourID"] = lsValue;
                    LoValue[0].EndEdit();
                    //lsTotal = _dtTimeSheetDetail.Compute("SUM(nmHourValue)", string.Empty).ToString();
                    lsTotal = Count_Total_Time();
                    break;
                case "4":
                    LoValue[0].BeginEdit();
                    LoValue[0]["szDetail"] = lsValue;
                    LoValue[0].EndEdit();
                    break;

            }
        }
        return lsTotal;
    }
    #endregion

    #region ManageSave
    private void ManageSave(DateTime dtCreationDate)
    {
        clsTimeSheet loTimeSheet = null;
        TimeSeetDetail loTimeSeetDetail = null;
        try
        {
            //Insert New record in TimeSheet.
            if (string.IsNullOrEmpty(hddValue.Value))
            {
                loTimeSheet = new clsTimeSheet();
                loTimeSheet.nmUserID = Utility.GetUserId();
                loTimeSheet.szAdminApproval = "1";
                loTimeSheet.dtCreateDate = dtCreationDate;
                if (loTimeSheet.Insert() == 0)
                {
                    hddValue.Value = loTimeSheet.nmTimeSheetID.ToString();
                }
            }
            foreach (DataRow drRow in _dtTimeSheetDetail.Rows)
            {
                loTimeSeetDetail = new TimeSeetDetail();
                if (drRow.RowState == DataRowState.Added)
                {
                    //Check for Blank Value.
                    if (!string.IsNullOrEmpty(drRow["nmHourID"].ToString())
                        && !string.IsNullOrEmpty(drRow["nmProjectID"].ToString())
                        && !string.IsNullOrEmpty(drRow["nmModule"].ToString()))
                    {
                        string[] splittime = drRow["nmHourID"].ToString().Trim().Split(':');
                        if (splittime.Length == 2)
                        {
                            string strHour = splittime[0].Replace('_', ' ');
                            strHour = strHour.Trim();
                            strHour = strHour.Trim();
                            if (strHour.Length == 1)
                            {
                                strHour = "0" + strHour;
                            }
                            if (string.IsNullOrEmpty(strHour))
                            {
                                strHour = "00";
                            }
                            string strMinute = splittime[1].Replace('_', ' ');
                            strMinute = strMinute.Trim();
                            if (strMinute.Length == 1)
                            {
                                strMinute = "0" + strMinute;
                            }
                            if (string.IsNullOrEmpty(strMinute))
                            {
                                strMinute = "00";
                            }
                            string temp_time = strHour + ":" + strMinute;  //drRow["nmHourID"].ToString().Trim().Replace("_", "0");
                            if (!temp_time.Equals("00:00"))
                            {
                                loTimeSeetDetail.szDetail = drRow["szDetail"].ToString();
                                loTimeSeetDetail.nmHourID = temp_time; //drRow["nmHourID"].ToString();
                                loTimeSeetDetail.nmTimeSheetID = clsFunctions.ToInteger(hddValue.Value);
                                loTimeSeetDetail.nmModule = clsFunctions.ToInteger(drRow["nmModule"]);
                                loTimeSeetDetail.nmProjectID = clsFunctions.ToInteger(drRow["nmProjectID"]);
                                loTimeSeetDetail.Insert();
                            }
                        }
                    }
                }
                else if (drRow.RowState == DataRowState.Modified)
                {
                    if (!string.IsNullOrEmpty(drRow["nmHourID"].ToString())
                        && !string.IsNullOrEmpty(drRow["nmProjectID"].ToString())
                        && !string.IsNullOrEmpty(drRow["nmModule"].ToString()))
                    {
                        string[] splittime = drRow["nmHourID"].ToString().Trim().Split(':');
                        if (splittime.Length == 2)
                        {
                            string strHour = splittime[0].Replace('_', ' ');
                            strHour = strHour.Trim();
                            if (strHour.Length == 1)
                            {
                                strHour = "0" + strHour;
                            }
                            if (string.IsNullOrEmpty(strHour))
                            {
                                strHour = "00";
                            }
                            string strMinute = splittime[1].Replace('_', ' ');
                            strMinute = strMinute.Trim();
                            if (strMinute.Length == 1)
                            {
                                strMinute = "0" + strMinute;
                            }
                            if (string.IsNullOrEmpty(strMinute))
                            {
                                strMinute = "00";
                            }
                            string temp_time = strHour + ":" + strMinute;   //drRow["nmHourID"].ToString().Trim().Replace("_", "0");
                            if (!temp_time.Equals("00:00"))
                            {
                                loTimeSeetDetail.szDetail = drRow["szDetail"].ToString();
                                loTimeSeetDetail.nmHourID = temp_time; //drRow["nmHourID"].ToString();
                                loTimeSeetDetail.nmTimeSheetID = clsFunctions.ToInteger(hddValue.Value);
                                loTimeSeetDetail.nmModule = clsFunctions.ToInteger(drRow["nmModule"]);
                                loTimeSeetDetail.nmProjectID = clsFunctions.ToInteger(drRow["nmProjectID"]);
                                loTimeSeetDetail.nmTimeSheetDetail = clsFunctions.ToInteger(drRow["nmTimeSheetDetail"]);
                                loTimeSeetDetail.Update();
                            }
                        }
                    }
                }
                else if (drRow.RowState == DataRowState.Deleted)
                {
                    loTimeSeetDetail.nmTimeSheetDetail = clsFunctions.ToInteger(drRow["nmTimeSheetDetail", DataRowVersion.Original]);
                    loTimeSeetDetail.Delete();
                }
            }
            Utility.setMessage(lblMessage, "Edit");
            ManageTable(dtCreationDate);
            SetDashBoard();
            GetTotalHours();
        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion

    #region LoadPermissionDate
    private void LoadPermissionDate()
    {
        DataSet dsPermisison = null;
        AdminPermission loPermission = null;
        int count = 0;
        try
        {
            loPermission = new AdminPermission();
            loPermission.nmUserID = Utility.GetUserId();
            dsPermisison = loPermission.GetAllPermisionForUserWise();

            foreach (DataRow dr in dsPermisison.Tables[0].Rows)
            {
                if (count == 0)
                {
                    divDate.Visible = true;
                }
                //Add Values.
                drdDate.Items.Add(new ListItem(Convert.ToDateTime(dr["dtPermissionDate"]).ToString("dd-MMM-yy")));
                count++;
            }
        }
        catch (Exception ex)
        {

            throw;
        }
    }
    #endregion

    #region GetTotalHours
    private void GetTotalHours()
    {
        clsTimeSheet loTimeSheet = null;
        DateTime dtStartDate = DateTime.Now;
        try
        {
            loTimeSheet = new clsTimeSheet();
            loTimeSheet.nmUserID = Utility.GetUserId();
            //For Week.
            dtStartDate = Convert.ToDateTime(DateTime.Now.AddDays(DayOfWeek.Monday - DateTime.Now.DayOfWeek));

            Label lblTitle = (Label)Master.FindControl("lblCurrentWeek");
            lblTitle.Text = loTimeSheet.TotalHours(dtStartDate, DateTime.Now);

            //For Month.
            lblTitle = (Label)Master.FindControl("lblCurrentMonth");
            dtStartDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 01);
            //dtStartDate = Convert.ToDateTime(DateTime.Today.Month.ToString() + "-" + "01" + "-" + DateTime.Today.Year.ToString());
            lblTitle.Text = loTimeSheet.TotalHours(dtStartDate, DateTime.Now);
        }
        catch (Exception ex)
        {
            //Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion
}
