using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NarolaInfotech.Utility;
using TimeSheet;

public partial class Admin_ProjectDetail : System.Web.UI.Page
{
  Project loProject = null;

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
        loProject = new Project();
        loProject.nmProjectID = clsFunctions.ToInteger(Request["id"]);
        loProject.LoadById();

        hddID.Value = loProject.nmProjectID.ToString();
        txtProjectName.Text = loProject.szProjectName;
        lblTitle.Text = "Edit Project";
      }
      else
        lblTitle.Text = "Add Project";
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
      loProject = new Project();
      loProject.szProjectName = txtProjectName.Text.Trim();
      if (!string.IsNullOrEmpty(hddID.Value))
      {
        loProject.nmProjectID = clsFunctions.ToInteger(hddID.Value);
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
        if (!string.IsNullOrEmpty(txtProjectName.Text.Trim()))
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
        else
        {
            Utility.getMessageFormat(lblMessage, "Project name required", true);
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
      if (loProject.Insert() == 0)
      {
        Response.Redirect(clsFunctions.GetSiteRoot() + "/admin/ProjectList.aspx");
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
      if (loProject.Update() == 0)
      {
        Response.Redirect(clsFunctions.GetSiteRoot() + "/admin/ProjectList.aspx");
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
