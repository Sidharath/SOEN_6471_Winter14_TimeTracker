using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NarolaInfotech.Utility;
using TimeSheet;
using System.Web.Security;
public partial class Admin_Adin : System.Web.UI.MasterPage
{
  #region Page_Load
  protected void Page_Load(object sender, EventArgs e)
  {
    if (Session["AdminUser"] == null)
    {
      Response.Redirect(clsFunctions.GetSiteRoot() + "/admin/AdminLogin.aspx");
    }
    if (!IsPostBack)
    {
      lblAdminName.Text = Utility.GetAdminName();
    }
  } 
  #endregion

  #region LinkButton1_Click
  protected void LinkButton1_Click(object sender, EventArgs e)
  {
    FormsAuthentication.SignOut();
    Session.Abandon();
    Response.Redirect(clsFunctions.GetSiteRoot() + "/admin/AdminLogin.aspx");
  } 
  #endregion
}
