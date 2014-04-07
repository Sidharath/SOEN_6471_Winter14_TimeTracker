using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NarolaInfotech.Utility;
using TimeSheet;
using System.Web.Security;
public partial class Admin_AdminLogin : System.Web.UI.Page
{
  #region Page_Load
  protected void Page_Load(object sender, EventArgs e)
  {
      DateTime dt = DateTime.Now;
      Label1.Text = dt.Year.ToString();
      
  }
  #endregion

  #region btnSave_Click
  protected void btnSave_Click(object sender, EventArgs e)
  {
    ManangeLogin();
  }
  #endregion

  #region ManangeLogin
  private void ManangeLogin()
  {
    Admin loAdmin = null;
    AdminPermission loPermission = null;
    try
    {
      loAdmin = new Admin();
      loAdmin.szUserName = txtUn.Text;
      loAdmin.szPassword = txtPsw.Text;
      if (Utility.CheckLic())
      {
        if (loAdmin.Login())
        {
          //Delete admin permission record.
          loPermission = new AdminPermission();
          loPermission.Delete24Hours(DateTime.Now.AddDays(-1));

          FormsAuthentication.RedirectFromLoginPage(loAdmin.szUserName, false);
          Session["AdminUser"] = loAdmin;
          //Add Log Trace.
          //  Utility.WriteLogFile("Login by " + txtUserName.Text);
          Response.Redirect(clsFunctions.GetSiteRoot() + "/admin/default.aspx");
        }
        else
        {
          Utility.getMessageFormat(lblMessage, Message.LOGIN_FAIL, true);
        }
      }
      else
      {
        Response.Redirect(clsFunctions.GetSiteRoot() + "/Trial.aspx");
      }
    }
    catch (Exception ex)
    {
      lblMessage.Text = ex.Message;
    }
  }
  #endregion
}
