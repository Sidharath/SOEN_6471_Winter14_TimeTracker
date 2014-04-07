using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


public partial class Admin_Notification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Application["EmailNotification"].ToString().Equals("False"))
        {
            lblMessage.Text = "&nbsp; Email Notification NOT Working &nbsp;";
            lblMessage.ForeColor = System.Drawing.Color.White;
            lblMessage.BackColor = System.Drawing.Color.Red;
        }
        else
        {
            lblMessage.Text = "&nbsp; Email Notification IS Working &nbsp;";
            lblMessage.ForeColor = System.Drawing.Color.White;
            lblMessage.BackColor = System.Drawing.Color.Green;
        }

    }
}
