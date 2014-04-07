using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TimeSheet;
using NarolaInfotech.Utility;
using System.Data;
public partial class Admin_UserModuleList : System.Web.UI.Page
{
  Module loModule = new Module();
  public string msRootPath;

  #region Page_Load
  protected void Page_Load(object sender, EventArgs e)
  {
    msRootPath = clsFunctions.GetSiteRoot();
    if (!IsPostBack)
    {
      fillGrid();
    }
  } 
  #endregion

  #region lblGo_Click
  protected void lblGo_Click(object sender, EventArgs e)
  {
    fillGrid();
  } 
  #endregion

  #region btnReset_Click
  protected void btnReset_Click(object sender, EventArgs e)
  {
    txtSearch.Text = string.Empty;
    fillGrid();
  } 
  #endregion

  #region btnAdd_Click
  protected void btnAdd_Click(object sender, EventArgs e)
  {
    Response.Redirect(clsFunctions.GetSiteRoot() + "/UserModuleDetail.aspx");
  } 
  #endregion

  #region gvPlanList_Sorting
  protected void gvPlanList_Sorting(object sender, GridViewSortEventArgs e)
  {
    DataSet loDataSet = loModule.Load(txtSearch.Text.Trim());
    if (loDataSet != null)
    {
      DataTable loDataTable = loDataSet.Tables[0];
      GridViewSortExpression = e.SortExpression;
      //get the pageindex of the grid.
      int pageIndex = gvPlanList.PageIndex;
      gvPlanList.DataSource = SortDataTable(loDataTable, false);
      gvPlanList.DataBind();
      gvPlanList.PageIndex = pageIndex;
    }
  }
  #endregion

  #region gvPlanList_PageIndexChanging
  protected void gvPlanList_PageIndexChanging(object sender, GridViewPageEventArgs e)
  {
    DataSet loDataSet = loModule.Load(txtSearch.Text.Trim());
    if (loDataSet != null)
    {
      DataTable loDataTable = loDataSet.Tables[0];
      //get the pageindex of the grid.
      gvPlanList.PageIndex = e.NewPageIndex;
      gvPlanList.DataSource = SortDataTable(loDataTable, true);
      gvPlanList.DataBind();
    }
  } 
  #endregion

  #region gvPlanList_RowCreated
  protected void gvPlanList_RowCreated(object sender, GridViewRowEventArgs e)
  {
    if (e.Row.RowType == DataControlRowType.Header)
    {
      int sortColumnIndex = GetSortColumnIndex(gvPlanList);
      if (sortColumnIndex != -1)
      {
        AddSortImage(sortColumnIndex, e.Row);
      }
    }
  } 
  #endregion

  #region gvPlanList_RowDeleting
  protected void gvPlanList_RowDeleting(object sender, GridViewDeleteEventArgs e)
  {

    int liRowIndex = e.RowIndex;
    String lsProjectID = gvPlanList.DataKeys[liRowIndex].Values[0].ToString();

    loModule.nmModule = clsFunctions.ToInteger(lsProjectID);

    if (string.IsNullOrEmpty(loModule.Delete()))
    {
      Utility.setMessage(lblMessage, "Delete");
      fillGrid();
    }
    else
    {
      Utility.getMessageFormat(lblMessage, Message.PROJECT_DELETE, true);
    }

  } 
  #endregion

  #region fillGrid
  public void fillGrid()
  {
    DataSet dsValue = null;
    try
    {
      dsValue = loModule.Load(txtSearch.Text.Trim());
      gvPlanList.DataSource = dsValue;
      gvPlanList.DataBind();
    }
    catch (Exception)
    {
    }
  } 
  #endregion

  #region GetSortColumnIndex
  private int GetSortColumnIndex(GridView dvValue)
  {
    foreach (DataControlField field in dvValue.Columns)
    {
      if (field.SortExpression ==
                   (string)ViewState["SortExpression"])
      {
        return dvValue.Columns.IndexOf(field);
      }
    }
    return -1;
  }
  #endregion

  #region AddSortImage
  private void AddSortImage(int columnIndex, GridViewRow headerRow)
  {
    // Create the sorting image based on the sort direction.
    Image sortImage = new Image();
    if (GridViewSortDirection.Equals("ASC"))
    {
      sortImage.ImageUrl = clsFunctions.GetSiteRoot() + "/Images/downsimple.png";
      sortImage.AlternateText = "Ascending Order";
    }
    else
    {
      sortImage.ImageUrl = clsFunctions.GetSiteRoot() + "/Images/upsimple.png";
      sortImage.AlternateText = "Descending Order";
    }
    // Add the image to the appropriate header cell.
    headerRow.Cells[columnIndex].Controls.Add(sortImage);
  }
  #endregion

  #region GridViewSortDirection
  private string GridViewSortDirection
  {
    get
    {
      return ViewState["SortDirection"] as string ?? "ASC";
    }
    set
    {
      ViewState["SortDirection"] = value;
    }
  }
  #endregion

  #region GridViewSortExpression
  /// Gets or Sets the gridview sortexpression property
  private string GridViewSortExpression
  {
    get
    {
      return ViewState["SortExpression"] as string ?? string.Empty;
    }
    set
    {
      ViewState["SortExpression"] = value;
    }
  }
  #endregion

  #region GetSortDirection
  /// Returns the direction of the sorting
  private string GetSortDirection()
  {
    switch (GridViewSortDirection)
    {
      case "ASC":
        GridViewSortDirection = "DESC";
        break;
      case "DESC":
        GridViewSortDirection = "ASC";
        break;
    }
    return GridViewSortDirection;
  }
  #endregion

  #region SortDataTable
  /// <summary>
  /// Method Mamage Sorting of DataTable.
  /// </summary>
  /// <param name="dataTable"></param>
  /// <param name="isPageIndexChanging"></param>
  /// <returns></returns>
  protected DataView SortDataTable(DataTable dataTable, bool isPageIndexChanging)
  {
    if (dataTable != null)
    {
      //Get Dataview.
      DataView dataView = new DataView(dataTable);
      if (GridViewSortExpression != string.Empty)
      {
        if (isPageIndexChanging)
        {
          dataView.Sort = string.Format("{0} {1}",
          GridViewSortExpression, GridViewSortDirection);
        }
        else
        {
          dataView.Sort = string.Format("{0} {1}",
         GridViewSortExpression, GetSortDirection());
        }
      }
      return dataView;
    }
    else
    {
      return new DataView();
    }
  }
  #endregion
}
