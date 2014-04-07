using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TimeSheet;
using NarolaInfotech.Utility;
using System.Web.Security;
public partial class Login : System.Web.UI.Page
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["TimeSheet"] != null)
            {
                HttpCookie loCookie = Request.Cookies.Get("TimeSheet");
                txtUserName.Text = loCookie.Values["Email"].ToString();
                txtUserName.Attributes.Add("style", "background-image:none");
                txtPassword.Attributes.Add("value", loCookie.Values["Password"].ToString());
                txtPassword.Attributes.Add("style", "background-image:none");
            }
        }
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
        UserMaster loUser = null;
        AdminPermission loPermission = null;
        try
        {
            loUser = new UserMaster();
            loUser.szUserName = txtUserName.Text;
            loUser.szPassword = txtPassword.Text;
            if (Utility.CheckLic())
            {
                if (loUser.Login())
                {
                    //Delete admin permission record.
                    loPermission = new AdminPermission();
                    loPermission.Delete24Hours(DateTime.Now.AddDays(-1));

                    FormsAuthentication.RedirectFromLoginPage(loUser.szUserName, false);

                    if (chkRemember.Checked)
                    {
                        HttpCookie loCookie = new HttpCookie("TimeSheet");
                        Response.Cookies.Remove("TimeSheet");
                        Response.Cookies.Add(loCookie);
                        loCookie.Values.Add("Email", txtUserName.Text.Trim());
                        loCookie.Values.Add("Password", txtPassword.Text.Trim());
                        Response.Cookies["TimeSheet"].Expires = DateTime.Now.AddDays(15);
                    }

                    Session["User"] = loUser;
                    Response.Redirect(clsFunctions.GetSiteRoot() + "/DashBoard.aspx");
                }
                else
                {
                    HttpCookie myCookie = new HttpCookie("TimeSheet");
                    Response.Cookies.Remove("TimeSheet");
                    Response.Cookies.Add(myCookie);
                    myCookie.Values.Add("Email", txtUserName.Text.Trim());
                    myCookie.Values.Add("Password", txtPassword.Text.Trim());
                    DateTime dtExpiry = DateTime.Now.AddSeconds(1); //you can add years and months too here
                    Response.Cookies["Magicircle"].Expires = dtExpiry;

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
