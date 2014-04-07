using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NarolaInfotech.Utility;
using System.Web.Security;
using TimeSheet;
public partial class Admin_User : System.Web.UI.MasterPage
{

    public string msRootPath = string.Empty;

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            Response.Redirect(clsFunctions.GetSiteRoot() + "/Login.aspx");
        }
        msRootPath = clsFunctions.GetSiteRoot();
        if (!IsPostBack)
        {
            lblUserName.Text = Utility.GetUserName();
            GetTotalHours();
        }
    }

    #endregion

    #region LinkButton1_Click
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Abandon();
        Response.Redirect(clsFunctions.GetSiteRoot() + "/login.aspx");
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
            lblCurrentWeek.Text = loTimeSheet.TotalHours(dtStartDate, DateTime.Now);

            //For Month.
            dtStartDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 01);
            //dtStartDate = Convert.ToDateTime(DateTime.Today.Month.ToString() + "-" + "01" + "-" + DateTime.Today.Year.ToString());
            lblCurrentMonth.Text = loTimeSheet.TotalHours(dtStartDate, DateTime.Now);
        }
        catch (Exception ex)
        {
            //Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion
}
