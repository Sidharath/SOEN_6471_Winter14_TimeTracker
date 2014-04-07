using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
  #region Page_Load
  protected void Page_Load(object sender, EventArgs e)
  {
    Response.Redirect("Login.aspx");
  } 
  #endregion
}
