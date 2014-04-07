using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TimeSheet;
using NarolaInfotech.Utility;
using System.Data;
public partial class Admin_Permission : System.Web.UI.Page
{
  #region _dtUser
  private DataTable _dtUser
  {
    get { return (DataTable)Session["_dtUser"]; }
    set { Session["_dtUser"] = value; }
  }
  #endregion

  public string msRootPath;

  #region Page_Load
  protected void Page_Load(object sender, EventArgs e)
  {
    msRootPath = clsFunctions.GetSiteRoot();
    if (!IsPostBack)
    {
      GetUserData();
      GetYearList();
      drdMonth.SelectedValue = DateTime.Now.Month.ToString();
      drdYear.SelectedValue = DateTime.Now.Year.ToString();
    }
    CreateTimeSheet();
  } 
  #endregion

  #region GetUserData
  private void GetUserData()
  {
    UserMaster loMaster = null;
    DataSet ds = null;
    try
    {
      //Get All UserMaster Record
      loMaster = new UserMaster();
      loMaster.szArchive = "0";
      ds = loMaster.Load();

      _dtUser = ds.Tables[0].Copy();
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion

  #region GetYearList
  private void GetYearList()
  {
    drdYear.Items.Add(new ListItem((DateTime.Now.Year - 1).ToString()));
    for (int i = 0; i < 3; i++)
    {
      drdYear.Items.Add(new ListItem((DateTime.Now.Year + i).ToString()));
    }
  }
  #endregion

  #region CreateTimeSheet
  private void CreateTimeSheet()
  {
    AdminPermission loPermission = null;
    TableHeaderCell loHeader = null;
    TableCell loCell = null;
    TableRow loRow = null;
    int lnTotalDays = 0;
    string Day = string.Empty;
    CheckBox loChkBox = null;

    DateTime dtStartDate;
    DateTime dtEndDate;
    DataSet dsValue = null;
    DataView dvValue = null;
    try
    {
      tblPermission.Rows.Clear();

      //Get Total Number of Days.
      lnTotalDays = new DateTime(clsFunctions.ToInteger(drdYear.SelectedValue), clsFunctions.ToInteger(drdMonth.SelectedValue), 1).AddMonths(1).AddDays(-1).Day;
      
      loPermission = new AdminPermission();
      dtStartDate = new DateTime(clsFunctions.ToInteger(drdYear.SelectedValue), clsFunctions.ToInteger(drdMonth.SelectedValue),1);
      dtEndDate = new DateTime(clsFunctions.ToInteger(drdYear.SelectedValue), clsFunctions.ToInteger(drdMonth.SelectedValue), lnTotalDays);

      dsValue = loPermission.GetAllPermisionForMonth(dtStartDate, dtEndDate);
      dvValue = new DataView(dsValue.Tables[0]);

      //Create now Row.
      loRow = new TableRow();

      #region Add Header

      loHeader = new TableHeaderCell();
      loHeader.Text = string.Empty;
      loRow.Cells.Add(loHeader);
      for (int i = 1; i <= lnTotalDays; i++)
      {
        Day = new DateTime(clsFunctions.ToInteger(drdYear.SelectedValue), clsFunctions.ToInteger(drdMonth.SelectedValue), i).DayOfWeek.ToString();
        loHeader = new TableHeaderCell();
        loHeader.Text = string.Format("{0}<br>{1}", Day.Substring(0, 1), i);
        loHeader.ToolTip = Day;
        loRow.Cells.Add(loHeader);
      }
      tblPermission.Rows.Add(loRow);

      #endregion

      #region Add Rows
      foreach (DataRow dr in _dtUser.Rows)
      {
        loRow = new TableRow();
        loCell = new TableCell();
        loCell.Text = dr["szContactPerson"].ToString();
        loCell.CssClass = "editpermission";
        loRow.Cells.Add(loCell);
        for (int i = 01; i <= lnTotalDays; i++)
        {
          Day = new DateTime(clsFunctions.ToInteger(drdYear.SelectedValue), clsFunctions.ToInteger(drdMonth.SelectedValue), i).DayOfWeek.ToString();
          loChkBox = new CheckBox();
          loCell = new TableCell();
          loChkBox.ID = string.Format("chk{0}{1}", dr["szContactPerson"].ToString().Replace(" ", string.Empty), i);
          loCell.Controls.Add(loChkBox);

          #region Manage Previous Value

        //  dvValue.RowFilter = string.Format("dtPermissionDate='{0}' and nmUserID={1}", new DateTime(clsFunctions.ToInteger(drdYear.SelectedValue), clsFunctions.ToInteger(drdMonth.SelectedValue), i), dr["nmUserID"]);
          string dt = "";
          if (i.ToString().Length == 1)
          {
              dt = "0" + i;
          }
          else
          {
              dt = i.ToString();
          }

          dvValue.RowFilter = string.Format("dtPermissionDate='{0}' and nmUserID={1}", drdYear.SelectedValue +  "/" + drdMonth.SelectedValue +"/"+ dt, dr["nmUserID"]);
          foreach (DataRow dr1 in dvValue.ToTable().Rows)
          {
            loChkBox.Checked = clsFunctions.StrToBool(dr1["szPermission"].ToString());
          }

          #endregion

          loCell.CssClass = "editpermission1";
          if (Day.Equals("Sunday"))
          {
            loCell.BackColor = System.Drawing.Color.FromArgb(255, 169, 165);
          }
          loRow.Cells.Add(loCell);
        }
        tblPermission.Rows.Add(loRow);
      }
      #endregion
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion

  #region lblGo_Click
  protected void lblGo_Click(object sender, EventArgs e)
  {
    lblMessage.Text = string.Empty;
    CreateTimeSheet();
  } 
  #endregion

  #region btnSave_Click
  protected void btnSave_Click(object sender, EventArgs e)
  {
    Save();

  } 
  #endregion

  #region Save
  private void Save()
  {
    int lnTotalDays = 0;
    AdminPermission loPermission = null;
    try
    {
      loPermission = new AdminPermission();

      //Get Total Number of Days.
      lnTotalDays = new DateTime(clsFunctions.ToInteger(drdYear.SelectedValue), clsFunctions.ToInteger(drdMonth.SelectedValue), 1).AddMonths(1).AddDays(-1).Day;

      //Delete All Record for Permission Table.
      DateTime StartDate = new DateTime(clsFunctions.ToInteger(drdYear.SelectedValue), clsFunctions.ToInteger(drdMonth.SelectedValue), 1);
      DateTime EndDate = new DateTime(clsFunctions.ToInteger(drdYear.SelectedValue), clsFunctions.ToInteger(drdMonth.SelectedValue), lnTotalDays);
      loPermission.DeleteAllMonthRecord(StartDate, EndDate);


      foreach (DataRow dr in _dtUser.Rows)
      {
        for (int i = 1; i <= lnTotalDays; i++)
        {
          Control loControl = tblPermission.FindControl(string.Format("chk{0}{1}", dr["szContactPerson"].ToString().Replace(" ", string.Empty), i));

          if (loControl is CheckBox)
          {
            CheckBox locheckbox = (CheckBox)loControl;

            if (locheckbox.Checked == true)
            {
              loPermission.dtPermissionDate = new DateTime(clsFunctions.ToInteger(drdYear.SelectedValue), clsFunctions.ToInteger(drdMonth.SelectedValue), i);
              loPermission.dtCreationDate = DateTime.Now;
              loPermission.nmUserID = clsFunctions.ToInteger(dr["nmUserID"]);
              loPermission.szPermission = "1";
              loPermission.Insert();
            }
          }
        }
      }
      Utility.setMessage(lblMessage, "Edit");
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  } 
  #endregion
}
