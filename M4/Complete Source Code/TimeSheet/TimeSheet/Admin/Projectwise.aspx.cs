//using System;
//using System.Collections;
//using System.Configuration;
//using System.Data;
//using System.Web;
//using System.Web.Security;
//using System.Web.UI;
//using System.Web.UI.HtmlControls;
//using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NarolaInfotech.Utility;
using TimeSheet;
using System.Data;
using System.Text;
using System.IO;
using System.Globalization;

public partial class Admin_Projectwise : System.Web.UI.Page
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDropDownlist();
            txtStartDate.Text = DateTime.Now.AddMonths(-1).ToString("dd-MMM-yy");
            txtEndDate.Text = DateTime.Now.ToString("dd-MMM-yy");
        }
    }
    #endregion

    #region lblGo_Click
    protected void lblGo_Click(object sender, EventArgs e)
    {
        lblMessage.Text = string.Empty;
        DateTime date1 = Convert.ToDateTime((txtStartDate.Text));
        DateTime date2 = Convert.ToDateTime((txtEndDate.Text));
        int result = DateTime.Compare(date1, date2);
        if (result >= 0)
        {
            //clsFunctions.getMessageFormat(lblMessage, "From date should be later than to date", true);
            clsFunctions.getMessageFormat(lblMessage, "To date should be greater than From date", true);
            return;
        }
        ManageGo();
    }
    #endregion

    #region ManageGo
    private void ManageGo()
    {
        DateTime strtdate;
        DateTime endDate;
        Admin loAdmin = null;
        DataSet dsValue = null;
        DataView dvValue = null;
        try
        {
           // endDate = Convert.ToDateTime(txtEndDate.Text.Trim());
            string[] endar = txtEndDate.Text.Trim().Split('-');

            string month = endar[1];
            string year = endar[2];

            //  int x1 = DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year;

            endDate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(endar[0]));
      

            //endDate = new DateTime(Convert.ToInt32(endar[2]), Convert.ToInt32(endar[0]), Convert.ToInt32(endar[1]));

            if (drdProject.SelectedValue.Equals("0"))
            {
                clsFunctions.getMessageFormat(lblMessage, Message.SELECT_PROJECT_MODULE, true);
                return;
            }
            else if (!drdProject.SelectedValue.Equals("0"))
            {
                string[] strtd = txtStartDate.Text.Trim().Split('-');

                 month = strtd[1];
                 year = strtd[2];

             //   strtdate = new DateTime(Convert.ToInt32(strtd[2]), Convert.ToInt32(strtd[0]), Convert.ToInt32(strtd[1]));
                 strtdate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(strtd[0]));
      
                loAdmin = new Admin();
                if (drdModule.SelectedItem.Value.Equals("0"))
                {
                    // Only Module [ Column ] Will be Display 
                    dsValue = loAdmin.GetTimeSheetByProjectwise(strtdate,
                                                            new DateTime(endDate.Year, endDate.Month, endDate.Day, 23, 59, 59),
                                                            clsFunctions.ToInteger(drdProject.SelectedValue));

                }
                else
                {
                   // 
                    dsValue = loAdmin.GetTimeSheetByProjectwise_Without_module(strtdate,
                                                                               new DateTime(endDate.Year, endDate.Month, endDate.Day, 23, 59, 59),
                                                                               clsFunctions.ToInteger(drdProject.SelectedValue) , Convert.ToInt32(drdModule.SelectedItem.Value));


                }

                
                dvValue = new DataView(dsValue.Tables[0]);
                //Filter Record.
                //if (!drdModule.SelectedValue.Equals("0"))
                //{
                //    dvValue.RowFilter = "Module='" + drdModule.SelectedItem.Text + "'";
                //}

            }

            if (dvValue != null)
            {
                if (dvValue.Count > 0)
                {
                    lblDetail.Visible = true;
                    if (drdModule.SelectedItem.Value.Equals("0"))
                    {
                        
                        lblDetail.Text = "Time Sheet Detail For Project <b>" + drdProject.SelectedItem.Text + "</b>";
                    }
                    else
                    {

                        lblDetail.Text = "Time Sheet Detail For Project <b>" + drdProject.SelectedItem.Text + "</b> & Task <b>" +drdModule.SelectedItem.Text +"</b>";
 
                    }
                    
                }
                else
                {
                    lblDetail.Visible = false ;
                }
                
                
                gvPlanList.DataSource = dvValue;
                gvPlanList.DataBind();
            }
        }
        catch (Exception ex)
        {
            clsFunctions.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion

    #region LoadDropDownlist
    private void LoadDropDownlist()
    {
        UserMaster loMaster = null;
        Project loProject = null;
        DataSet dsValue = null;
        Module loModule = null;
        try
        {
            //Get All Project List.
            loProject = new Project();
            dsValue = loProject.Load();

            drdProject.DataSource = dsValue;
            drdProject.DataTextField = "szProjectName";
            drdProject.DataValueField = "nmProjectID";
            drdProject.DataBind();

            drdProject.Items.Insert(0,new ListItem("-- Select -- ", "0"));
            drdProject.SelectedValue = "0";

            //Get ModuleList by project wise.
            loModule = new Module();
            loModule.nmProjectID = clsFunctions.ToInteger(drdProject.SelectedValue);
            dsValue = loModule.LoadByProjectID();

            drdModule.DataSource = dsValue;
            drdModule.DataTextField = "szModuleName";
            drdModule.DataValueField = "nmModule";
            drdModule.DataBind();

            drdModule.Items.Insert (0,new ListItem("-- Select -- ", "0"));
            drdModule.SelectedValue = "0";
        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion

    #region ReturnExtension
    private string ReturnExtension(string fileExtension)
    {
        switch (fileExtension)
        {
            case ".htm":
            case ".html":
            case ".log":
                return "text/HTML";
            case ".txt":
                return "text/plain";
            case ".doc":
                return "application/ms-word";
            case ".tiff":
            case ".tif":
                return "image/tiff";
            case ".asf":
                return "video/x-ms-asf";
            case ".avi":
                return "video/avi";
            case ".zip":
                return "application/zip";
            case ".xls":
            case ".csv":
                return "application/vnd.ms-excel";
            case ".gif":
                return "image/gif";
            case ".jpg":
            case "jpeg":
                return "image/jpeg";
            case ".bmp":
                return "image/bmp";
            case ".wav":
                return "audio/wav";
            case ".mp3":
                return "audio/mpeg3";
            case ".mpg":
            case "mpeg":
                return "video/mpeg";
            case ".rtf":
                return "application/rtf";
            case ".asp":
                return "text/asp";
            case ".pdf":
                return "application/pdf";
            case ".fdf":
                return "application/vnd.fdf";
            case ".ppt":
                return "application/mspowerpoint";
            case ".dwg":
                return "image/vnd.dwg";
            case ".msg":
                return "application/msoutlook";
            case ".xml":
            case ".sdxl":
                return "application/xml";
            case ".xdp":
                return "application/vnd.adobe.xdp+xml";
            default:
                return "application/octet-stream";
        }
    }
    #endregion

    #region DownloadingFile
    private void DownloadingFile(string filepath)
    {
        // Create New instance of FileInfo class to get the properties of the file being downloaded
        FileInfo file = new FileInfo(filepath);

        // Checking if file exists
        if (file.Exists)
        {
            // Clear the content of the response
            Response.ClearContent();

            // LINE1: Add the file name and attachment, which will force the open/cance/save dialog to show, to the header
            Response.AddHeader("Content-Disposition", "inline; filename=" + file.Name);

            // Add the file size into the response header
            Response.AddHeader("Content-Length", file.Length.ToString());

            // Set the ContentType
            Response.ContentType = ReturnExtension(file.Extension.ToLower());

            // Write the file into the response (TransmitFile is for ASP.NET 2.0. In ASP.NET 1.1 you have to use WriteFile instead)
            Response.TransmitFile(file.FullName);

            // End the response
            Response.End();
        }
    }
    #endregion

    #region CreateExcelFile
    private bool CreateExcelFile(DataTable dt, string filename)
    {
        try
        {
            decimal val = 0;
            string sTableStart = @"<HTML><BODY><TABLE Border=1>";
            string sTableEnd = @"</TABLE></BODY></HTML>";
            string sTHead = "<TR>";
            StringBuilder sTableData = new StringBuilder();
            foreach (DataColumn col in dt.Columns)
            {
                sTHead += @"<TH>" + col.ColumnName + @"</TH>";
            }
            sTHead += @"</TR>";
            foreach (DataRow row in dt.Rows)
            {
                sTableData.Append(@"<TR>");
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    if (dt.Columns[i].ToString().Equals("PriceDifference"))
                    {
                        sTableData.Append(@"<TD>" + row[i].ToString() + @"</TD>");
                    }
                    else
                    {
                        sTableData.Append(@"<TD>" + row[i].ToString() + @"</TD>");
                    }
                }
                sTableData.Append(@"</TR>");
            }
            string sTable = sTableStart + sTHead + sTableData.ToString() + sTableEnd;
            System.IO.StreamWriter oExcelWriter = System.IO.File.CreateText(filename);
            oExcelWriter.WriteLine(sTable);
            oExcelWriter.Close();
            return true;
        }
        catch
        {
            return false;
        }
    }
    #endregion

    #region btnExportTimeSheet_Click
    protected void btnExportTimeSheet_Click(object sender, EventArgs e)
    {
        lblMessage.Text = string.Empty;
        ManageExportSheet();
    }
    #endregion

        #region ManageExportSheet
    private void ManageExportSheet()
    {
        DateTime endDate;
        DateTime strtdate;
        Admin loAdmin = null;
        DataSet dsValue = null;
        string lsFilePath = null;
        try
        {
           // endDate = Convert.ToDateTime(txtEndDate.Text.Trim());
            string[] endar = txtEndDate.Text.Trim().Split('-');

            string month = endar[1];
            string year = endar[2];

            //  int x1 = DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year;

            endDate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(endar[0]));
      
            //endDate = new DateTime(Convert.ToInt32(endar[2]), Convert.ToInt32(endar[0]), Convert.ToInt32(endar[1]));

            if (drdModule.SelectedItem.Value.Equals("0"))
            {
                //lsFilePath = Request.PhysicalApplicationPath + @"/Export/download.xls";
                lsFilePath = Request.PhysicalApplicationPath + @"/Export/" + drdProject.SelectedItem.Text.Replace(" ", "_").ToString() + "_" + txtStartDate.Text.Trim() + "_" + txtEndDate.Text.Trim() + ".xls";
            }
            else
            {
                lsFilePath = Request.PhysicalApplicationPath + @"/Export/" + drdProject.SelectedItem.Text.Replace(" ", "_").ToString() + "-"+drdModule.SelectedItem.Text.Replace(" ","_").ToString()+ "_" + txtStartDate.Text.Trim() + "_" + txtEndDate.Text.Trim() + ".xls";
 
            }
           // lsFilePath = Request.PhysicalApplicationPath + @"/Export/download.xls";
            
            if (drdProject.SelectedValue.Equals("0"))
            {
                clsFunctions.getMessageFormat(lblMessage, Message.SELECT_EXPORT, true);
                return;
            }
            else if (!drdProject.SelectedValue.Equals("0"))
            {
                string[] strtd = txtStartDate.Text.Trim().Split('-');

            
                 month = strtd[1];
                 year = strtd[2];

             //   strtdate = new DateTime(Convert.ToInt32(strtd[2]), Convert.ToInt32(strtd[0]), Convert.ToInt32(strtd[1]));
                 strtdate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(strtd[0]));
      
              //  strtdate = new DateTime(Convert.ToInt32(strtd[2]), Convert.ToInt32(strtd[0]), Convert.ToInt32(strtd[1]));


                loAdmin = new Admin();

                if (drdModule.SelectedItem.Value.Equals("0"))
                {
                    // Only Module [ Column ] Will be Display 
                    dsValue = loAdmin.GetTimeSheetByProjectwise(strtdate,
                                                            new DateTime(endDate.Year, endDate.Month, endDate.Day, 23, 59, 59),
                                                            clsFunctions.ToInteger(drdProject.SelectedValue));

                }
                else
                {
                    // 
                    dsValue = loAdmin.GetTimeSheetByProjectwise_Without_module(strtdate,
                                                                               new DateTime(endDate.Year, endDate.Month, endDate.Day, 23, 59, 59),
                                                                               clsFunctions.ToInteger(drdProject.SelectedValue), Convert.ToInt32(drdModule.SelectedItem.Value));


                }
            }
                       
            if (CreateExcelFile(dsValue.Tables[0], lsFilePath))
            {
                DownloadingFile(lsFilePath);
            }
        }
        catch (Exception ex)
        {
            clsFunctions.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion

    #region drdProject_SelectedIndexChanged
    protected void drdProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dsValue = null;
        Module loModule = null;
        try
        {
            //Get ModuleList by project wise.
            loModule = new Module();
            loModule.nmProjectID = clsFunctions.ToInteger(drdProject.SelectedValue);
            dsValue = loModule.LoadByProjectID();

            drdModule.DataSource = dsValue;
            drdModule.DataTextField = "szModuleName";
            drdModule.DataValueField = "nmModule";
            drdModule.DataBind();

            drdModule.Items.Insert(0,new ListItem("-- Select -- ", "0"));
            drdModule.SelectedValue = "0";
        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion
}
