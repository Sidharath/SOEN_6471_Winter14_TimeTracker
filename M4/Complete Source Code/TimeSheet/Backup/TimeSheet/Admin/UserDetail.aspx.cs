using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TimeSheet;
using NarolaInfotech.Utility;
using System.Data;

public partial class Admin_UserDetail : System.Web.UI.Page
{
  UserMaster loMaster = null;

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
        lblTitle.Text = "Edit Employee ";
        loMaster = new UserMaster();
        loMaster.nmUserID = clsFunctions.ToInteger(Request["id"]);
        loMaster.LoadById();

        hddID.Value = loMaster.nmUserID.ToString();
        txtu.Text = loMaster.szUserName;
          
        txtp.Text = loMaster.szPassword.ToString();
        txtPersonName.Text = loMaster.szContactPerson;
        txtu.Attributes.Add("ReadOnly", "ReadOnly");
        if (!string.IsNullOrEmpty(loMaster.szPhotoPath))
        {
          imgPer.ImageUrl = clsFunctions.GetSiteRoot() + "/Images/" + loMaster.szPhotoPath;
          hddImage.Value = loMaster.szPhotoPath;
        }
        else
        {
          imgPer.ImageUrl = clsFunctions.GetSiteRoot() + "/Images/NoImage.jpg";
        }
      }
      else
      {
        imgPer.ImageUrl = clsFunctions.GetSiteRoot() + "/Images/NoImage.jpg";
        lblTitle.Text = "Add Employee ";
      }
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
      loMaster = new UserMaster();
      loMaster.szUserName = txtu.Text.Trim();
      loMaster.szPassword = txtp.Text.Trim();
      loMaster.szContactPerson = txtPersonName.Text.Trim();
      loMaster.szPhotoPath = hddImage.Value;
      if (!string.IsNullOrEmpty(hddID.Value))
      {
        loMaster.nmUserID = clsFunctions.ToInteger(hddID.Value);
      }
      else
        loMaster.szArchive = "0";
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
      //Upload New Image.
      if (fuImageUpload.HasFile)
      {
        String lsExtension = fuImageUpload.FileName.Substring(fuImageUpload.FileName.LastIndexOf('.'));
        String lsFile = DateTime.Now.ToString("yyMMddhhmmss") + lsExtension;
        fuImageUpload.SaveAs(Request.PhysicalApplicationPath + "\\Images\\" + lsFile);
        hddImage.Value = lsFile;
      }      

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
      if (!string.IsNullOrEmpty(txtu.Text) && (!string.IsNullOrEmpty(txtp.Text)))
      {
          if (loMaster.Insert() == 0)
          {
              Response.Redirect(clsFunctions.GetSiteRoot() + "/admin/UserList.aspx");
          }
          else
          {
              Utility.setMessage(lblMessage, "Fail");
          }
      }
      else
      {
          Utility.getMessageFormat(lblMessage, "Username or Password required", true);
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
      if (loMaster.Update() == 0)
      {
        Response.Redirect(clsFunctions.GetSiteRoot() + "/admin/UserList.aspx");
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
