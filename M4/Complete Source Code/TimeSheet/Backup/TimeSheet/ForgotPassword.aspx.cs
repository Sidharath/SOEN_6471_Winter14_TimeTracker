using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NarolaInfotech.Utility;
using TimeSheet;
public partial class ForgetPassword : System.Web.UI.Page
{
  #region Page_Load
  protected void Page_Load(object sender, EventArgs e)
  {

  } 
  #endregion

  #region btnSave_Click
  protected void btnSave_Click(object sender, EventArgs e)
  {
    ManageForgotPassword();
  } 
  #endregion

  #region ManageForgotPassword
  private void ManageForgotPassword()
  {
    UserMaster loUserMaster = null;
    try 
    {
      loUserMaster = new UserMaster();
      loUserMaster.szUserName = txtUserName.Text.Trim();
      loUserMaster.GetUserIDByEamilID();

      if (loUserMaster.nmUserID == 0)
      {
        Utility.getMessageFormat(lblMessage, Message.FORGOT_PASSWORD_ERROR, true);
      }
      else
      {
        Utility.sendMail(loUserMaster.szUserName, "", "", "Password for timesheet", "your password is : " + loUserMaster.szPassword);
        txtUserName.Text = string.Empty;
        Utility.getMessageFormat(lblMessage, Message.FORGOT_PASSWORD_SUCESS, false);
      }
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion 
}
