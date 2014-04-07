using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NarolaInfotech.Data;
using NarolaInfotech.Utility;
using TimeSheet;
using System.Data;
public partial class Admin_Default : System.Web.UI.Page
{
  public string lsRootPath;

  #region Page_Load
  protected void Page_Load(object sender, EventArgs e)
  {
    lsRootPath = clsFunctions.GetSiteRoot();
    if (!IsPostBack)
    {
      GetAllUserList();
    }
  } 
  #endregion

  #region GetAllIUserList
  private void GetAllUserList()
  {
    DataSet dsValue = null;
    UserMaster loMaster = null;
    try
    {
      loMaster = new UserMaster();
      loMaster.szArchive = "0";
      dsValue = loMaster.Load();

      rptUserMaster.DataSource = dsValue.Tables[0];
      rptUserMaster.DataBind();
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion

  #region GetYeasterDayHour
  public string GetYeasterDayHour(string lsUserID)
  {
    string lsHour = string.Empty;
    DateTime dtToday = DateTime.Now.AddDays(-1);
    clsTimeSheet loTimeSheet = new clsTimeSheet();

    loTimeSheet.nmUserID = clsFunctions.ToInteger(lsUserID);
    //For Week.
    DateTime dtStartDate = Convert.ToDateTime(DateTime.Now.AddDays(-1));
    lsHour = loTimeSheet.TotalHours(dtStartDate, new DateTime(dtToday.Year, dtToday.Month, dtToday.Day, 23, 59, 59));
    return lsHour;
  } 
  #endregion

  #region GetCurrentMonth
  public string GetCurrentMonth(string lsUserID)
  {
    string lsHour = string.Empty;
    DateTime dtToday = DateTime.Now.AddDays(-1);
    clsTimeSheet loTimeSheet = new clsTimeSheet();

    loTimeSheet.nmUserID = clsFunctions.ToInteger(lsUserID);
    //For Week.
    DateTime dtStartDate = Convert.ToDateTime(DateTime.Today.Month.ToString() + "/" + "01" + "/" + DateTime.Today.Year.ToString());
    //DateTime dtStartDate = Convert.ToDateTime("01" + "/" + DateTime.Today.Month.ToString() + "/" + DateTime.Today.Year.ToString());

    lsHour = loTimeSheet.TotalHours(dtStartDate, DateTime.Now);
    return lsHour;
  } 
  #endregion

  #region GetCurrentWeek
  public string GetCurrentWeek(string lsUserID)
  {
    string lsHour = string.Empty;
    clsTimeSheet loTimeSheet = new clsTimeSheet();

    loTimeSheet.nmUserID = clsFunctions.ToInteger(lsUserID);
    //For Week.
    DateTime dtStartDate = Convert.ToDateTime(DateTime.Now.AddDays(DayOfWeek.Monday - DateTime.Now.DayOfWeek));
    lsHour = loTimeSheet.TotalHours(dtStartDate, DateTime.Now);
    return lsHour;
  } 
  #endregion
}


