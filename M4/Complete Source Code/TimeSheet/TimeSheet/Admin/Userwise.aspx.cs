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
using NPOI.HSSF.UserModel;

public partial class Admin_Userwise : System.Web.UI.Page
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDropDownlist();
            txtStartDate.Text = DateTime.Now.AddMonths(-1).ToString("dd-MMM-yy");
            txtEndDate.Text = DateTime.Now.ToString("dd-MMM-yy");

            //BindData(); 
        }
    }
    #endregion


    GridView GridView = new GridView();
    #region lblGo_Click
    protected void lblGo_Click(object sender, EventArgs e)
    {
        lblMessage.Text = string.Empty;
        // lblMessage.Text = "OK";

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
        DateTime endDate;
        DateTime strtdate;
        DataTable dt1 = null;
        Admin loAdmin = null;
        DataSet dsValue = null;
        DataView dvValue = null;


        try
        {
            //  endDate = Convert.ToDateTime(txtEndDate.Text.Trim());

            string[] endar = txtEndDate.Text.Trim().Split('-');

            string month = endar[1];
            string year = endar[2];

            //  int x1 = DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year;

            endDate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(endar[0]));


            // endDate = new DateTime(Convert.ToInt32(endar[2]), Convert.ToInt32(endar[0]), Convert.ToInt32(endar[1]));


            if (drdUserList.SelectedValue.Equals("0"))
            {
                clsFunctions.getMessageFormat(lblMessage, Message.SELECT_REPORT_USER, true);
                return;
            }

            else if (!drdUserList.SelectedValue.Equals("0"))
            {
                string[] strtd = txtStartDate.Text.Trim().Split('-');
                month = strtd[1];
                year = strtd[2];

                // strtdate = new DateTime(Convert.ToInt32(strtd[2]), Convert.ToInt32(strtd[0]), Convert.ToInt32(strtd[1]));
                strtdate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(strtd[0]));


                loAdmin = new Admin();
                dsValue = loAdmin.GetTimeSheetByUserwise(strtdate,
                                                         new DateTime(endDate.Year, endDate.Month, endDate.Day, 23, 59, 59),
                                                         clsFunctions.ToInteger(drdUserList.SelectedValue));
                dvValue = dsValue.Tables[0].DefaultView;


                // DataView dvData = new DataView(dtData);
                //dvValue1.Sort = "Date";
                //dt1 = dvValue1.Table;


                //gvPlanList.DataSource = dt1;
                //gvPlanList.DataBind();

            }
            if (dsValue != null)
            {
                if (dsValue.Tables[0].Rows.Count > 0)
                {
                    lblDetail.Visible = true;
                    //string temptext = lblDetail.Text;
                    lblDetail.Text = "Time Sheet Detail For <b>" + drdUserList.SelectedItem.Text + "</b>";
                }
                else
                { lblDetail.Visible = false; }
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
            //Get All User List.
            loMaster = new UserMaster();
            loMaster.szArchive = "0";
            dsValue = loMaster.Load();

            drdUserList.DataSource = dsValue;
            drdUserList.DataTextField = "szContactPerson";
            drdUserList.DataValueField = "nmUserID";
            drdUserList.DataBind();

            drdUserList.Items.Add(new ListItem("-- Select -- ", "0"));
            drdUserList.SelectedValue = "0";

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
            #region Old_Logic_To_Export_Execl
            /*
            decimal val = 0;
            string sTableStart = @"<HTML><BODY><TABLE Border=1>";
            string sTableEnd = @"</TABLE></BODY></HTML>";
            string sTHead = "<TR style='width:200px;'>";
            StringBuilder sTableData = new StringBuilder();
            foreach (DataColumn col in dt.Columns)
            {
                sTHead += @"<TH>" + col.ColumnName + @"</TH>";
            }
            sTHead += @"</TR>";
            foreach (DataRow row in dt.Rows)
            {
                sTableData.Append(@"<TR style='width:200px;'>");
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    /*
                    if (dt.Columns[i].ToString().Equals("PriceDifference"))
                    {
                        sTableData.Append(@"<TD>" + row[i].ToString() + @"</TD>");
                    }
                    else
                    {
                        sTableData.Append(@"<TD style='height:200px; width:200px;'>" + row[i].ToString() + @"<img style='height:10px; width:10px;' src='http://192.168.0.70:1234/images/090909031542.jpg'/></TD>");
                    }
                    sTableData.Append(@"<TD>" + row[i].ToString() + @"</TD>");
                }
                sTableData.Append(@"</TR>");
            }
            string sTable = sTableStart + sTHead + sTableData.ToString() + sTableEnd;
            System.IO.StreamWriter oExcelWriter = System.IO.File.CreateText(filename);
            oExcelWriter.WriteLine(sTable);
            oExcelWriter.Close();
            */
            #endregion

            //Create new Excel Workbook
            var workbook = new HSSFWorkbook();

            //Create new Excel Sheet
            var sheet = workbook.CreateSheet();

            //(Optional) set the width of the columns
            sheet.AddMergedRegion(new NPOI.SS.Util.CellRangeAddress(0, 0, 0, 5));

            int ColumnCount = 0;
            foreach (DataColumn col in dt.Columns)
            {
                sheet.SetColumnWidth(ColumnCount, 20 * 256);//Emp IMG
                ColumnCount++;
            }

            var titlerow = sheet.CreateRow(0);
            titlerow.CreateCell(0).SetCellValue("User Wise");
            titlerow.Height = (short)850;

            NPOI.SS.UserModel.CellStyle cellStyle = workbook.CreateCellStyle();
            NPOI.SS.UserModel.Font f = workbook.CreateFont();

            f.FontHeightInPoints = (short)20;
            cellStyle.SetFont(f);
            cellStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
            titlerow.GetCell(0).CellStyle = cellStyle;

            var headerRow = sheet.CreateRow(1);

            NPOI.SS.UserModel.CellStyle cellStyle_title = workbook.CreateCellStyle();
            NPOI.SS.UserModel.Font f1 = workbook.CreateFont();
            f1.FontHeightInPoints = (short)12;
            f1.Boldweight = (short)1000;
            cellStyle_title.Alignment = NPOI.SS.UserModel.HorizontalAlignment.LEFT;
            cellStyle_title.SetFont(f1);

            int HeaderCount = 0;
            foreach (DataColumn col in dt.Columns)
            {
                headerRow.CreateCell(HeaderCount).SetCellValue(col.ColumnName);
                headerRow.GetCell(HeaderCount).CellStyle = cellStyle_title;
                HeaderCount++;
            }

            int RowCount = 2;
            foreach (DataRow item in dt.Rows)
            {
                var row = sheet.CreateRow(RowCount);
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    row.CreateCell(i).SetCellValue(item[i].ToString());
                }
                RowCount++;
            }
            //string lsFilePath = Request.PhysicalApplicationPath + @"/Export/Userwise" + txtStartDate.Text.Trim() + ".xls";

            MemoryStream output = new MemoryStream();
            workbook.Write(output);
            using (FileStream fs = File.Create(filename))
            using (BinaryWriter bw = new BinaryWriter(fs))
                bw.Write(output.ToArray());
            DownloadingFile(filename);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    #endregion

    #region btnExportTimeSheet_Click
    protected void btnExportTimeSheet_Click(object sender, EventArgs e)
    {
        lblMessage.Text = string.Empty;
        DateTime date1 = Convert.ToDateTime(txtStartDate.Text);
        DateTime date2 = Convert.ToDateTime(txtEndDate.Text);
        int result = DateTime.Compare(date1, date2);
        if (result >= 0)
        {
            clsFunctions.getMessageFormat(lblMessage, "To date should be greater than From date", true);
            return;
        }
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
            //endDate = Convert.ToDateTime(txtEndDate.Text.Trim());
            string[] endar = txtEndDate.Text.Trim().Split('-');

            string month = endar[1];
            string year = endar[2];

            //  int x1 = DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year;

            endDate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(endar[0]));




            // endDate = new DateTime(Convert.ToInt32(endar[2]), Convert.ToInt32(endar[0]), Convert.ToInt32(endar[1]));


            lsFilePath = Request.PhysicalApplicationPath + @"/Export/" + drdUserList.SelectedItem.Text.Replace(" ", "_").ToString() + "_" + txtStartDate.Text.Trim() + "_" + txtEndDate.Text.Trim() + ".xls";
            if (drdUserList.SelectedValue.Equals("0"))
            {
                clsFunctions.getMessageFormat(lblMessage, Message.SELECT_EXPORT, true);
                return;
            }

            else if (!drdUserList.SelectedValue.Equals("0"))
            {
                loAdmin = new Admin();

                string[] strtd = txtStartDate.Text.Trim().Split('-');

                month = strtd[1];
                year = strtd[2];

                // strtdate = new DateTime(Convert.ToInt32(strtd[2]), Convert.ToInt32(strtd[0]), Convert.ToInt32(strtd[1]));
                strtdate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(strtd[0]));


                //  strtdate = new DateTime(Convert.ToInt32(strtd[2]), Convert.ToInt32(strtd[0]), Convert.ToInt32(strtd[1]));


                dsValue = loAdmin.GetTimeSheetByUserwise(strtdate,
                                                         new DateTime(endDate.Year, endDate.Month, endDate.Day, 23, 59, 59),
                                                         clsFunctions.ToInteger(drdUserList.SelectedValue));

            }
            //else if (!drdUserList.SelectedValue.Equals("0") && !drdProject.SelectedValue.Equals("0"))
            //{
            //    loAdmin = new Admin();
            //    dsValue = loAdmin.GetTimeSheetByProject_USERwise(Convert.ToDateTime(txtStartDate.Text.Trim()),
            //                                                     new DateTime(endDate.Year, endDate.Month, endDate.Day, 23, 59, 59),
            //                                                     clsFunctions.ToInteger(drdProject.SelectedValue),
            //                                                     clsFunctions.ToInteger(drdUserList.SelectedValue));
            //}
            CreateExcelFile(dsValue.Tables[0], lsFilePath);
            /*
        if (CreateExcelFile(dsValue.Tables[0], lsFilePath))
        {
            DownloadingFile(lsFilePath);
        }
             * */
        }
        catch (Exception ex)
        {
            clsFunctions.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion


}
