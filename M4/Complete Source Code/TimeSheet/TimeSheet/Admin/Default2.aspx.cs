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
using System.IO;
using NPOI.HSSF.UserModel;


public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
          if (!IsPostBack)
            {


                DataTable dt = new DataTable();
                // define the table's schema
                dt.Columns.Add(new DataColumn("Name", typeof(string)));
                dt.Columns.Add(new DataColumn("Points", typeof(string)));
                dt.Columns.Add(new DataColumn("Imagesaa", typeof(string)));





                DataRow dr1 = dt.NewRow();
                dr1[0] = "Vulpes";
                dr1[1] = 235;
                dr1[2] = "http://192.168.0.70:1234/images/090909031542.jpg";

                DataRow dr2 = dt.NewRow();
                dr2[0] = "SP Nayak";
                dr2[1] = 135;
                dr2[2] = "http://192.168.0.70:1234/images/090909031542.jpg";

                DataRow dr3 = dt.NewRow();
                dr3[0] = "Krishna";
                dr3[1] = 40;
                dr3[2] = "http://192.168.0.70:1234/images/090909031542.jpg";

                //DataRow imgdr = dt.NewRow();
                //imgdr[0] = "<img src='http://192.168.0.70:1234/images/090909031542.jpg' />";
                //imgdr[1] = 405;
                //imgdr[2] = "http://192.168.0.70:1234/images/090909031542.jpg";

                dt.Rows.Add(dr1);
                dt.Rows.Add(dr2);
                dt.Rows.Add(dr3);

                GridView1.DataSource = dt;
                GridView1.DataBind();

            }

       
        ////get the byte array of the string writer
        ////dynamically
        //byte[] bytes = GetImageData();

        ////values to use the response object
        //string contentType = "application/ms-excel";
        //string fileName = "Image.xls";

        ////storing the byte array for using
        ////in the http handler
        //Session["AttachedFile"] = bytes;
        //Response.Redirect(@"~\FileHandler.ashx?fileName=" + fileName + "&contentType=" + contentType);

    }
    private byte[] GetImageData()
    {

        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);

        //create a html image dynamically
        HtmlImage image = new HtmlImage();

        //assign the image to the hetml Image
        image.Src = string.Format("http://{0}{1}", Request.Url.Host, base.ResolveUrl("Images/090909031542.jpg"));


        //render the html text writer
        image.RenderControl(htw);

        //get the final byte array of the panel
        return System.Text.Encoding.ASCII.GetBytes(sw.ToString());
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Articles_Export_ToExcel();
    }
    public void Articles_Export_ToExcel()
    {
        //var tempArticles = objRepository.MyArticles_DisplayRecords();
        //Create new Excel Workbook
        var workbook = new HSSFWorkbook();


        //Create new Excel Sheet
        var sheet = workbook.CreateSheet();

        //(Optional) set the width of the columns
        sheet.SetColumnWidth(0, 20 * 256);//Title
        sheet.SetColumnWidth(1, 20 * 256);//Section
        sheet.SetColumnWidth(2, 20 * 256);//Views
        sheet.SetColumnWidth(3, 20 * 256);//Downloads
        sheet.SetColumnWidth(4, 20 * 256);//Status


        //Create a header row
        var headerRow = sheet.CreateRow(0);

        headerRow.CreateCell(0).SetCellValue("Title");
        headerRow.CreateCell(1).SetCellValue("Section");
        headerRow.CreateCell(2).SetCellValue("Views");
        headerRow.CreateCell(3).SetCellValue("Downloads");
        headerRow.CreateCell(4).SetCellValue("Status");

        //(Optional) freeze the header row so it is not scrolled
        // sheet.CreateFreezePane(0, 1, 0, 1);

        int rowNumber = 1;

        //Populate the sheet with values from the grid data

        foreach (GridViewRow objArticles in GridView1.Rows)
        {
            if (objArticles.RowIndex == 0)
            { }
            else
            {
                //Create a new Row
                var row = sheet.CreateRow(rowNumber++);

                //Set the Values for Cells
                row.CreateCell(0).SetCellValue(objArticles.Cells[0].Text);
                row.CreateCell(1).SetCellValue(objArticles.Cells[0].Text);
                row.CreateCell(2).SetCellValue(objArticles.Cells[1].Text);
                row.CreateCell(3).SetCellValue(objArticles.Cells[1].Text);
                row.CreateCell(4).SetCellValue(objArticles.Cells[1].Text);

            }
        }


        string tempimgpath = Server.MapPath("");
        tempimgpath = tempimgpath.Substring(0, tempimgpath.IndexOf("Admin"));

        string imagesPath = "";
        imagesPath = tempimgpath + "Images\\090812025623.jpg";
       
        System.Drawing.Image image = System.Drawing.Image.FromFile(imagesPath);
        MemoryStream ms = new MemoryStream();
        image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
        NPOI.SS.UserModel.Drawing patriarch = sheet.CreateDrawingPatriarch();
        NPOI.SS.UserModel.ClientAnchor anchor = new HSSFClientAnchor(20, 0, 40, 20, 3, 10, 5, 12);
        anchor.AnchorType = 0;
        //int index = hssfworkbook.AddPicture(ms.ToArray(), HSSFPicture.PICTURE_TYPE_PNG);
        int z = workbook.AddPicture(ms.ToArray(), NPOI.SS.UserModel.PictureType.JPEG);
        NPOI.SS.UserModel.Picture signaturePicture = patriarch.CreatePicture(anchor, z);

        //Write the Workbook to a memory stream
        MemoryStream output = new MemoryStream();
        workbook.Write(output);

        using (FileStream fs = File.Create("d:\\asd.xls"))
        using (BinaryWriter bw = new BinaryWriter(fs))
            bw.Write(output.ToArray());



        //HttpResponse response = HttpContext.Current.Response;
        //response.Clear();
        //response.Charset = "utf-8";
        //response.ContentType = "application/vnd.ms-excel";
        //response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "asd.xls"));
        ////response.BinaryWrite(File.ReadAllBytes(Server.MapPath("Excel_Document" + "\\" + filename)));
        //string xsave = ConfigurationSettings.AppSettings["ExcelSavePath"].ToString();
        // string xsave = System.Configuration.ConfigurationManager.AppSettings["ExcelSavePath"].ToString();




        //        response.End();

        // //Return the result to the end user
        //File(output.ToArray(),   //The binary data of the XLS file
        //  "application/vnd.ms-excel", //MIME type of Excel files
        //  "ArticleList.xls");
        //context.Response.ContentType = "application/vnd.ms-excel";
        //context.Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0};", fileName));
        //outputStream.Write(file, 0, file.Length);

        //Suggested file name in the "Save as" dialog which will be displayed to the end user
    }
}
