using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TimeSheet;
using NarolaInfotech.Utility;
using System.Data;
public partial class Setting : System.Web.UI.Page
{
  public string msRootPath;

  #region Page_Load
  protected void Page_Load(object sender, EventArgs e)
  {
    msRootPath = clsFunctions.GetSiteRoot();
    if (!IsPostBack)
    {
      LoadDropDownList();
      GetValue();
    }
  } 
  #endregion

  #region drdProject_SelectedIndexChanged
  protected void drdProject_SelectedIndexChanged(object sender, EventArgs e)
  {
    LoadModuleList();
  }
  #endregion

  #region btnSave_Click
  protected void btnSave_Click(object sender, EventArgs e)
  {
    SaveProjectSetting();
  } 
  #endregion

  #region btnSave1_Click
  protected void btnSave1_Click(object sender, EventArgs e)
  {
    ChangePassword();
  } 
  #endregion

  #region btnSave2_Click
  protected void btnSave2_Click(object sender, EventArgs e)
  {
    SaveImageValue();
  } 
  #endregion

  #region SaveImageValue
  private void SaveImageValue()
  {
    //UserMaster loMaster = null;
    //try
    //{
    //  loMaster = new UserMaster();
    //  loMaster.nmUserID = Utility.GetUserId();
    //  loMaster.LoadById();

    //  //Upload New Image.
    //  if (fuImageUpload.HasFile)
    //  {
    //    String lsExtension = fuImageUpload.FileName.Substring(fuImageUpload.FileName.LastIndexOf('.'));
    //    String lsFile = DateTime.Now.ToString("yyMMddhhmmss") + lsExtension;
    //    fuImageUpload.SaveAs(Request.PhysicalApplicationPath + "\\Images\\" + lsFile);
    //    loMaster.szPhotoPath = lsFile;
    //    loMaster.Update();
    //    imgPer.ImageUrl = clsFunctions.GetSiteRoot() + "/Images/" + loMaster.szPhotoPath;
    //  }
    //}
    //catch (Exception ex)
    //{
    //  Utility.getMessageFormat(lblMessage, ex.Message, true);
    //}
  }
  #endregion

  #region GetValue
  private void GetValue()
  {
    UserProjectSetting loSetting = null;
    UserMaster loMaster = null;
    try
    {
      //Get Project Setting Value.
      loSetting = new UserProjectSetting();
      loSetting.nmUserID = Utility.GetUserId();
      if (loSetting.GetValueByUSerID() == 0)
      {
        drdProject.SelectedValue = loSetting.nmProjectID.ToString();
        LoadModuleList();
        drdModule.SelectedValue = loSetting.nmModule.ToString();
        hddid.Value = loSetting.nmUserProjectSettingID.ToString();
      }
      loMaster = new UserMaster();
      loMaster.nmUserID = Utility.GetUserId();
      loMaster.LoadById();
      lblOldPassword.Text = loMaster.szPassword;
      //if (!string.IsNullOrEmpty(loMaster.szPhotoPath))
      //{
      //  imgPer.ImageUrl = clsFunctions.GetSiteRoot() + "/Images/" + loMaster.szPhotoPath;
      //  hddImage.Value = loMaster.szPhotoPath;
      //}
      //else
      //{
      //  imgPer.ImageUrl = clsFunctions.GetSiteRoot() + "/Images/NoImage.jpg";
      //}

    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion

  #region ChangePassword
  private void ChangePassword()
  {
    UserMaster loMaster = null;
    try
    {
      if (txtOldPassword.Text.Trim().Equals(lblOldPassword.Text.Trim()))
      {
        loMaster = new UserMaster();
        loMaster.nmUserID = Utility.GetUserId();
        loMaster.szPassword = txtNewPassword.Text.Trim();
        loMaster.ChangePassword();
        Utility.setMessage(lblMessage, "Edit");
      }
      else
      {
        Utility.getMessageFormat(lblMessage, Message.OLD_PASSWORD, true);
      }
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  
  #endregion

  #region LoadDropDownList
  private void LoadDropDownList()
  {
    Project loProject = null;
    DataSet dsProject = null;
    try
    {
      loProject = new Project();
      dsProject = loProject.Load();

      drdProject.DataSource = dsProject;

      drdProject.DataTextField = "szProjectName";
      drdProject.DataValueField = "nmProjectID";
      drdProject.DataBind();

      LoadModuleList();
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion

  #region LoadModuleList
  private void LoadModuleList()
  {
    Module loModule = null;
    DataSet dsProject = null;
    try
    {
      loModule = new Module();
      loModule.nmProjectID = clsFunctions.ToInteger(drdProject.SelectedValue);

      dsProject = loModule.LoadByProjectID();

      drdModule.DataSource = dsProject;

      drdModule.DataTextField = "szModuleName";
      drdModule.DataValueField = "nmModule";
      drdModule.DataBind();
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion  

  #region SaveProjectSetting
  private void SaveProjectSetting()
  {
    UserProjectSetting loSettion = null;
    try
    {
      loSettion = new UserProjectSetting();

      loSettion.nmModule = clsFunctions.ToInteger(drdModule.SelectedValue);
      loSettion.nmUserID = Utility.GetUserId();
      loSettion.nmProjectID = clsFunctions.ToInteger(drdProject.SelectedValue);

      if (string.IsNullOrEmpty(hddid.Value))
      {
        loSettion.Insert();  
      }
      else
      {
        loSettion.nmUserProjectSettingID = clsFunctions.ToInteger(hddid.Value);
        loSettion.Update();
      }
      Utility.setMessage(lblMessage, "Edit");
    }
    catch (Exception ex)
    {
      Utility.getMessageFormat(lblMessage, ex.Message, true);
    }
  }
  #endregion
}
