using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NarolaInfotech.Utility;
using TimeSheet;
using System.Data;

public partial class Admin_HoursDetail : System.Web.UI.Page
{
  Hours loHours = null;

  #region Page_Load
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      SetValue();
    }
  } 
  #endregion

  #region btnSubmit_Click
  protected void btnSubmit_Click(object sender, EventArgs e)
  {
    Save();
  } 
  #endregion

  #region SetValue
  private void SetValue()
  {
    try
    {
      if (!string.IsNullOrEmpty(Request["id"]))
      {
        loHours = new Hours();
        loHours.nmHourID = clsFunctions.ToInteger(Request["id"]);
        loHours.LoadById();

        hddID.Value = loHours.nmHourID.ToString();
        txtHour.Text = loHours.nmHourValue.ToString();
        lblTitle.Text = "Edit Hour Option";
      }
      else
        lblTitle.Text = "Add Hour Option";
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion

  #region GetValue
  private void GetValue()
  {
    try
    {
      loHours = new Hours();
      loHours.nmHourValue = Convert.ToDecimal(txtHour.Text.Trim());      
      if (!string.IsNullOrEmpty(hddID.Value))
      {
        loHours.nmHourID = clsFunctions.ToInteger(hddID.Value);
      
      }
      
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion

  #region Save
  private void Save()
  {
    try
    {
      if (!string.IsNullOrEmpty(hddID.Value))
      {
        Update();
      }
      else
      {
        Insert();
      }
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion

  #region Insert
  private void Insert()
  {
    try
    {
      GetValue();
      if (loHours.Insert() == 0)
      {
        Response.Redirect(clsFunctions.GetSiteRoot() + "/admin/HoursList.aspx");
      }
      else
      {
        Utility.setMessage(lblMessage, "Fail");
      }
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion

  #region Update
  private void Update()
  {
    try
    {
      GetValue();
      if (loHours.Update() == 0)
      {
        Response.Redirect(clsFunctions.GetSiteRoot() + "/admin/HoursList.aspx");
      }
      else
      {
        Utility.setMessage(lblMessage, "Fail");
      }

    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion

}
