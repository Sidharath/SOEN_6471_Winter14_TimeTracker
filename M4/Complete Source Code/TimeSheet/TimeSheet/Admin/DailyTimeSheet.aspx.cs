 using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using AjaxControlToolkit;
using TimeSheet;
using NarolaInfotech.Data;
using System.Globalization;
using NarolaInfotech.Utility;
using NPOI.HSSF.UserModel;
using System.IO;

public partial class Admin_DailyTimeSheet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
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
    protected void lblGo_Click(object sender, EventArgs e)
    {
        try
        {
            clsTimeSheet objclsTimeSheet = new clsTimeSheet();
            string[] strtd = txtStartDate.Text.Trim().Split('-');
            string month = strtd[1];
            string year = strtd[2];
            DateTime strtdate;

            strtdate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(strtd[0]));
            DataSet ds = objclsTimeSheet.DailyTimeSheet(strtdate);
            grvDailyTimeSheet.Columns[6].Visible = true;
            grvDailyTimeSheet.DataSource = ds.Tables[0];
            grvDailyTimeSheet.DataBind();
         grvDailyTimeSheet.Columns[6].Visible = false;

          
        }

        catch (Exception ex)
        {
            clsFunctions.getMessageFormat(lblMessage, ex.Message, true);
        }

    }


    public void AddImageSToExcel(String imgpath, HSSFWorkbook workbook, NPOI.SS.UserModel.Sheet sheet, DataSet DistinctValuesDataSetForEmp ,
        ArrayList aryrownum
        )
    {
        int rownum = 1;
        NPOI.SS.UserModel.Picture signaturePicture;
        NPOI.SS.UserModel.Drawing patriarch = sheet.CreateDrawingPatriarch();
        NPOI.SS.UserModel.ClientAnchor anchor = new HSSFClientAnchor(20, 0, 40, 20, 3, 10, 5, 12);
        int irow = 0;
        foreach (DataRow item_EMP in DistinctValuesDataSetForEmp.Tables[0].Rows)
        {
       
            int z = 0;
            string tempimgpath = Server.MapPath("");
            tempimgpath = tempimgpath.Substring(0, tempimgpath.ToLower().IndexOf("admin"));

            string imagesPath = "";
            imagesPath = tempimgpath + "Images\\"+item_EMP["UserIMGPath"];
            System.Drawing.Image image = System.Drawing.Image.FromFile(imagesPath);
            MemoryStream ms = new MemoryStream();
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
           // patriarch = sheet.CreateDrawingPatriarch();
            anchor = new HSSFClientAnchor(20, 0, 40, 20, 3, 10, 5, 12);


            anchor.AnchorType = 3;
            //int index = hssfworkbook.AddPicture(ms.ToArray(), HSSFPicture.PICTURE_TYPE_PNG);
          //  z = workbook.AddPicture(ms.ToArray(), NPOI.SS.UserModel.PictureType.JPEG);
            signaturePicture = patriarch.CreatePicture(anchor, z);
            //NPOI.SS.UserModel.Picture signaturePicture1 ;
            anchor.Col1 = 0;
            anchor.Col2 = 1;
            anchor.Dx1 = 0;
            anchor.Dx2 = 0;
            anchor.Dy1 = 0;
            anchor.Dy2 = 20;
            anchor.Row1 = Convert.ToInt32(aryrownum[irow].ToString())+1;
            anchor.Row2 = Convert.ToInt32(aryrownum[irow].ToString()) + 6;
           
                AddMultiPleIMG(ms, workbook, signaturePicture, patriarch, anchor, z);
                irow++;

        }
      
       
    }

    public void AddMultiPleIMG(MemoryStream ms, HSSFWorkbook workbook, NPOI.SS.UserModel.Picture signaturePicture
        , NPOI.SS.UserModel.Drawing patriarch, NPOI.SS.UserModel.ClientAnchor anchor, int z)
    {
        z = workbook.AddPicture(ms.ToArray(), NPOI.SS.UserModel.PictureType.JPEG);
        signaturePicture = patriarch.CreatePicture(anchor, z);
    }

    protected void btnExportTimeSheet_Click(object sender, EventArgs e)
    {
        try
        {
            clsTimeSheet objclsTimeSheet = new clsTimeSheet();
            string[] strtd = txtStartDate.Text.Trim().Split('-');
            string month = strtd[1];
            string year = strtd[2];
            DateTime strtdate;

            strtdate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(strtd[0]));
            DataSet ds = objclsTimeSheet.DailyTimeSheet(strtdate);
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataTable DistinctValuesDataTableForEmp = ds.Tables[0].DefaultView.ToTable(true, "UserID", "UserName", "UserIMGPath");
                DataSet DistinctValuesDataSetForEmp = new DataSet();
                DistinctValuesDataSetForEmp.Tables.Add(DistinctValuesDataTableForEmp);

                //Create new Excel Workbook
                var workbook = new HSSFWorkbook();

                //Create new Excel Sheet
                var sheet = workbook.CreateSheet();

                //(Optional) set the width of the columns
                sheet.AddMergedRegion(new NPOI.SS.Util.CellRangeAddress(0, 0, 0, 5));


                sheet.SetColumnWidth(0, 20 * 256);//Emp IMG
                sheet.SetColumnWidth(1, 20 * 256);//Project
                sheet.SetColumnWidth(2, 20 * 256);//Task
                sheet.SetColumnWidth(3, 20 * 256);//Hour
                sheet.SetColumnWidth(4, 20 * 256);//Notes

                var titlerow = sheet.CreateRow(0);
                titlerow.CreateCell(0).SetCellValue("Daily TimeSheet");
                titlerow.Height = (short)850;

                NPOI.SS.UserModel.CellStyle cellStyle = workbook.CreateCellStyle();
                NPOI.SS.UserModel.Font f = workbook.CreateFont();

                f.FontHeightInPoints = (short)20;
                cellStyle.SetFont(f);
                cellStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
                titlerow.GetCell(0).CellStyle = cellStyle;

                //titlerow.RowStyle.f
                //Create a header row
                var headerRow = sheet.CreateRow(2);


                headerRow.CreateCell(0).SetCellValue("");
                headerRow.CreateCell(1).SetCellValue("Project");
                headerRow.CreateCell(2).SetCellValue("Task");
                headerRow.CreateCell(3).SetCellValue("Hour");
                headerRow.CreateCell(4).SetCellValue("Notes");

                NPOI.SS.UserModel.CellStyle cellStyle_title = workbook.CreateCellStyle();
                NPOI.SS.UserModel.Font f1 = workbook.CreateFont();
                f1.FontHeightInPoints = (short)12;
                f1.Boldweight = (short)1000;
                cellStyle_title.Alignment = NPOI.SS.UserModel.HorizontalAlignment.LEFT;
                cellStyle_title.SetFont(f1);

                headerRow.GetCell(0).CellStyle = cellStyle_title;
                headerRow.GetCell(1).CellStyle = cellStyle_title;
                headerRow.GetCell(2).CellStyle = cellStyle_title;
                headerRow.GetCell(3).CellStyle = cellStyle_title;
                headerRow.GetCell(4).CellStyle = cellStyle_title;


                // headerRow.Height = 50;
                // headerRow.RowStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;

                //(Optional) freeze the header row so it is not scrolled
                //sheet.CreateFreezePane(0, 1, 0, 1);
                int rowNumber = 3;

                ArrayList aryrownum = new ArrayList();
                int arraycount = 0;
                Boolean isfirstrowforuser = true;
                foreach (DataRow item_EMP in DistinctValuesDataSetForEmp.Tables[0].Rows)
                {
                    isfirstrowforuser = true;

                    string emp_id = item_EMP["UserID"].ToString();
                    if (rowNumber != 3)
                    {

                        rowNumber = rowNumber + 10;
                        aryrownum.Insert(arraycount, rowNumber);
                        arraycount++;
                    }
                    else
                    {
                        aryrownum.Insert(arraycount, rowNumber);
                        arraycount++;
                    }
                    foreach (DataRow item in ds.Tables[0].Rows)
                    {
                        if (emp_id.Equals(item["UserID"].ToString()))
                        {

                            var row = sheet.CreateRow(rowNumber++);


                            //aryrownum[arraycount] = rowNumber;
                            //Set the Values for Cells
                            if (isfirstrowforuser == true)
                            {
                                row.CreateCell(0).SetCellValue(item["UserName"].ToString());
                                isfirstrowforuser = false;
                            }
                            else
                            {
                                row.CreateCell(0).SetCellValue("");
                            }

                            row.CreateCell(1).SetCellValue(item["Project"].ToString());
                            row.CreateCell(2).SetCellValue(item["Task"].ToString());
                            row.CreateCell(3).SetCellValue(item["Hours"].ToString());
                            row.CreateCell(4).SetCellValue(item["Notes"].ToString());
                        }


                    }
                }
                //System.Drawing.Image image;
                //MemoryStream ms;



                //rowNumber = 1;

                //foreach (DataRow item_EMP in DistinctValuesDataSetForEmp.Tables[0].Rows)
                //{

                //var newrw =  sheet.GetRow(2);

                //   newrw.GetCell(0).SetCellValue("Employee Image");
                //  newrw.GetCell(1).SetCellValue("Project");
                //  newrw.GetCell(2).SetCellValue("Task");
                // newrw.GetCell(3).SetCellValue("Hour");
                //  newrw.GetCell(4).SetCellValue("Notes");


                AddImageSToExcel("", workbook, sheet, DistinctValuesDataSetForEmp, aryrownum);


                //  }



                //string tempimgpath = Server.MapPath("");
                //tempimgpath = tempimgpath.Substring(0, tempimgpath.ToLower().IndexOf("admin"));

                //string imagesPath = "";
                //imagesPath = tempimgpath + "Images\\090909031542.jpg";
                //System.Drawing.Image image = System.Drawing.Image.FromFile(imagesPath);
                //MemoryStream ms = new MemoryStream();
                //image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                //NPOI.SS.UserModel.Drawing patriarch = sheet.CreateDrawingPatriarch();
                //NPOI.SS.UserModel.ClientAnchor anchor = new HSSFClientAnchor(20, 0, 40, 20, 3, 10, 5, 12);

                //NPOI.SS.UserModel.ClientAnchor anchor1 = new HSSFClientAnchor(50, 5, 40, 20, 0, 10, 1, 12);
                //anchor1.AnchorType = 0;

                //anchor.AnchorType = 3;
                ////int index = hssfworkbook.AddPicture(ms.ToArray(), HSSFPicture.PICTURE_TYPE_PNG);
                //int z = workbook.AddPicture(ms.ToArray(), NPOI.SS.UserModel.PictureType.JPEG);
                //NPOI.SS.UserModel.Picture signaturePicture = patriarch.CreatePicture(anchor, z);
                ////NPOI.SS.UserModel.Picture signaturePicture1 ;
                //anchor.Col1 = 0;
                //anchor.Col2 = 1;
                //anchor.Dx1 = 50;
                //anchor.Dx2 = 40;
                //anchor.Dy1 = 5;
                //anchor.Dy2 = 20;
                //anchor.Row1 = 10;
                //anchor.Row2 = 12;
                //z = workbook.AddPicture(ms.ToArray(), NPOI.SS.UserModel.PictureType.JPEG);
                //signaturePicture = patriarch.CreatePicture(anchor, z);



                string lsFilePath = Request.PhysicalApplicationPath + @"/Export/DailyTimeSheet" + txtStartDate.Text.Trim() + ".xls";

                MemoryStream output = new MemoryStream();
                workbook.Write(output);
                using (FileStream fs = File.Create(lsFilePath))
                using (BinaryWriter bw = new BinaryWriter(fs))
                    bw.Write(output.ToArray());
                DownloadingFile(lsFilePath);
            }
            else
            {
                clsFunctions.getMessageFormat(lblMessage, "No matching results found for the search criteria.", true);
            }
        }
        catch (Exception ex)
        {
            clsFunctions.getMessageFormat(lblMessage, ex.Message, true);
        }

    }
    protected void grvDailyTimeSheet_DataBound(object sender, EventArgs e)
    {
        //for (int rowIndex = GridView1.Rows.Count - 2;
        //                             rowIndex >= 0; rowIndex--)
        //{
        //    GridViewRow gvRow = GridView1.Rows[rowIndex];
        //    GridViewRow gvPreviousRow = GridView1.Rows[rowIndex + 1];
        //    for (int cellCount = 0; cellCount < gvRow.Cells.Count;
        //                                                  cellCount++)
        //    {
        //        if (gvRow.Cells[cellCount].Text ==
        //                               gvPreviousRow.Cells[cellCount].Text)
        //        {
        //            if (gvPreviousRow.Cells[cellCount].RowSpan < 2)
        //            {
        //                gvRow.Cells[cellCount].RowSpan = 2;
        //            }
        //            else
        //            {
        //                gvRow.Cells[cellCount].RowSpan =
        //                    gvPreviousRow.Cells[cellCount].RowSpan + 1;
        //            }
        //            gvPreviousRow.Cells[cellCount].Visible = false;
        //        }
        //    }
        //}


        //for (int i = 0; i < grvDailyTimeSheet.Rows.Count - 1; i++)
        //{

        //    TableCell gvRow = grvDailyTimeSheet.Rows[i].Cells[0];
            
        //}

        
    }
    
    
    
    string previousCat = "";
    int firstRow = 0;

   


    protected void grvDailyTimeSheet_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        

        if (e.Row.RowType == DataControlRowType.DataRow)
        {   //We're only interested in Rows that contain data
            //get a reference to the data used to databound the row
            DataRowView drv = ((DataRowView)e.Row.DataItem);

            if (previousCat == drv["UserName"].ToString())
            {
                //If it's the same category as the previous one
                //Increment the rowspan

                if (grvDailyTimeSheet.Rows[firstRow].Cells[1].RowSpan == 0 || grvDailyTimeSheet.Rows[firstRow].Cells[0].RowSpan == 0)
                {
                    grvDailyTimeSheet.Rows[firstRow].Cells[0].RowSpan = 2;
                    grvDailyTimeSheet.Rows[firstRow].Cells[1].RowSpan = 2;
                }
                else
                {   grvDailyTimeSheet.Rows[firstRow].Cells[0].RowSpan += 1;
                    grvDailyTimeSheet.Rows[firstRow].Cells[1].RowSpan += 1;
                    }
                //Remove the cell
                
                e.Row.Cells.RemoveAt(0);
                e.Row.Cells.RemoveAt(0);
            }
            else //It's a new category
            {
                string lsFilePath = Request.Url.AbsoluteUri.ToString();
           

                //string tempimgpath = Server.MapPath("");
                lsFilePath = lsFilePath.Substring(0, lsFilePath.ToLower().IndexOf("admin"));

                string imagesPath = "";
                imagesPath = lsFilePath + "Images/" + e.Row.Cells[6].Text; 


                Image img;
                img = (Image)e.Row.Cells[0].FindControl("imgEmp");
                img.ImageUrl = imagesPath;
                img.Width = 80;
                img.Height = 80;
                e.Row.Cells[0].Attributes.Add("align", "center");

                //Set the vertical alignment to top
                e.Row.VerticalAlign = VerticalAlign.Top;
                //Maintain the category in memory
                previousCat = drv["UserName"].ToString();
                firstRow = e.Row.RowIndex;
            }
            


        }
    }
}
