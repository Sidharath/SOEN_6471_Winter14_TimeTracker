
using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.Services;
using System.Data;

using TimeSheet;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class AutoComplete : WebService
{
  public AutoComplete()
  {
  }

  [System.Web.Services.WebMethod(EnableSession = true)]
  public string[] GetProjectName(string prefixText, int count)
  {

    Project loProject = new Project();
    DataSet ds = loProject.Load();
    DataView dv = ds.Tables[0].DefaultView;
    if (!string.IsNullOrEmpty(prefixText))
    {
      dv.RowFilter = "szProjectName like '" + prefixText + "%'";
    }
    string[] lsValue = new string[dv.ToTable().Rows.Count];

    int count1 = 0;

    foreach (DataRow dr in dv.ToTable().Rows)
    {
      lsValue[count1] = dr["szProjectName"].ToString();
      count1++;
    }

    return lsValue;
  }

  [System.Web.Services.WebMethod(EnableSession = true)]
  public string[] GetModuleName(string prefixText, int count)
  {
    String ProjectID = "0";
    if(System.Web.HttpContext.Current.Session["ProjectID"] != null)
    {
      ProjectID = System.Web.HttpContext.Current.Session["ProjectID"].ToString();
    }

    Module loModule = new Module();
    DataSet ds = loModule.Load();
    DataView dv = ds.Tables[0].DefaultView;
    if (!string.IsNullOrEmpty(prefixText))
    {
      dv.RowFilter = "szModuleName like '%" + prefixText + "%' AND nmProjectID=" + ProjectID;
    }
    string[] lsValue = new string[dv.ToTable().Rows.Count];

    int count1 = 0;

    foreach (DataRow dr in dv.ToTable().Rows)
    {
      lsValue[count1] = dr["szModuleName"].ToString();
      count1++;
    }

    return lsValue;
  }
}
