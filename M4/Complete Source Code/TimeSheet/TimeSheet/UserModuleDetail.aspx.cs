using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NarolaInfotech.Utility;
using TimeSheet;
using System.Data;

public partial class Admin_UserModuleDetail : System.Web.UI.Page
{
  Module loModule = null;

  #region Page_Load
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      SetDropDownList();
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

  #region SetDropDownList
  private void SetDropDownList()
  {
    Project loProject = null;
    DataSet dsProject = null;
    try
    {
      loProject = new Project();
      dsProject = loProject.Load();

      drdProjectName.DataSource = dsProject;

      drdProjectName.DataTextField = "szProjectName";
      drdProjectName.DataValueField = "nmProjectID";
      drdProjectName.DataBind();
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion

  #region SetValue
  private void SetValue()
  {
    try
    {
      if (!string.IsNullOrEmpty(Request["id"]))
      {
        loModule = new Module();
        loModule.nmModule = clsFunctions.ToInteger(Request["id"]);
        loModule.LoadById();

        hddID.Value = loModule.nmModule.ToString();
        txtModuleName.Text = loModule.szModuleName;
        drdProjectName.SelectedValue = loModule.nmProjectID.ToString();
        lblTitle.Text = "Edit Task";
      }
      else
        lblTitle.Text = "Add Task";
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
      loModule = new Module();
      loModule.szModuleName = txtModuleName.Text.Trim();
      loModule.nmProjectID = clsFunctions.ToInteger(drdProjectName.SelectedValue);
      if (!string.IsNullOrEmpty(hddID.Value))
      {
        loModule.nmModule = clsFunctions.ToInteger(hddID.Value);
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
      loModule = new Module();
      loModule.nmProjectID = clsFunctions.ToInteger(drdProjectName.SelectedValue);
      loModule.nmModule = clsFunctions.ToInteger(hddID.Value);
      loModule.szModuleName = txtModuleName.Text.Trim();

      if (!string.IsNullOrEmpty(loModule.szModuleName))
      {
          if (!string.IsNullOrEmpty(hddID.Value))
          {
              if (loModule.CheckForDuplicateName())
              {
                  Update();
              }
              else
              { Utility.getMessageFormat(lblMessage, Message.DUP_ModuleName, true); }
          }
          else
          {
              if (loModule.CheckForDuplicateNameForInsert())
              {
                  Insert();
              }
              else
              { Utility.getMessageFormat(lblMessage, Message.DUP_ModuleName, true); }
          }
      }
      else
      {
          Utility.getMessageFormat(lblMessage, "Task name required", true);
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
      if (loModule.Insert() == 0)
      {
        Response.Redirect(clsFunctions.GetSiteRoot() + "/UserModuleList.aspx");
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
      if (loModule.Update() == 0)
      {
        Response.Redirect(clsFunctions.GetSiteRoot() + "/UserModuleList.aspx");
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
