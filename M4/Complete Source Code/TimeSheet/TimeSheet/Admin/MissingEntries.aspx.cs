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
using NarolaInfotech.Data;
using TimeSheet;
using System.Globalization;


public partial class Admin_MissingEntery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Application["EmailNotification"].ToString().Equals("False"))
        //{
        //    lblMessage.Text = "&nbsp; Email Notification NOT Working &nbsp;";
        //    lblMessage.ForeColor = System.Drawing.Color.White;
        //    lblMessage.BackColor = System.Drawing.Color.Red;
        //}
        //else
        //{
        //    lblMessage.Text = "&nbsp; Email Notification IS Working &nbsp;";
        //    lblMessage.ForeColor = System.Drawing.Color.White;
        //    lblMessage.BackColor = System.Drawing.Color.Green;
        //}

    }
    protected void lblGo_Click(object sender, EventArgs e)
    {
        clsTimeSheet objclsTimeSheet = new clsTimeSheet();

        string[] endar = txtEndDate.Text.Trim().Split('-');

        string month = endar[1];
        string year = endar[2];

        //  int x1 = DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year;
        DateTime endDate;
        endDate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(endar[0]));
      

        string[] strtd = txtStartDate.Text.Trim().Split('-');
         month = strtd[1];
         year = strtd[2];
        DateTime strtdate;
        
        strtdate = new DateTime(DateTime.ParseExact(year, "yy", CultureInfo.CurrentCulture).Year, DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month, Convert.ToInt32(strtd[0]));

        int totalday = endDate.Subtract(strtdate).Days + 1;
        DateTime tempdt = strtdate;
        //for (int i = 1; i <= totalday; i++)
        //{
            
        //    if (tempdt.DayOfWeek.ToString().Equals("Sunday"))
        //    {
        //        //Response.Write(tempdt.ToLongDateString()+"<br>");
        //    }
        //    else
        //    {
        //        Response.Write(tempdt.ToLongDateString()+"<br>");
        //    }
        //   tempdt =  strtdate.AddDays(i);
            
        //}

        DataSet ds = objclsTimeSheet.MissingEntery(strtdate, endDate);
        DataSet ds1;

        HtmlGenericControl dtHader;
        //foreach (DataRow totaldate in ds.Tables[0].Rows)
        for (int i = 1; i <= totalday; i++)
        {
            if (tempdt.DayOfWeek.ToString().ToLower().Equals("sunday"))
            { }
            else
            {
                // strtd = totaldate["dt"].ToString().Split('-');
                strtd = tempdt.ToString("dd-MMM-yy").Split('-');
                month = strtd[1];
                year = strtd[2];

                dtHader = new HtmlGenericControl("div");
                dtHader.Attributes.Add("class", "panel");


                tempdt = new DateTime(DateTime.ParseExact(year, "yy",
                    CultureInfo.CurrentCulture).Year,
                    DateTime.ParseExact(month, "MMM", CultureInfo.CurrentCulture).Month,
                    Convert.ToInt32(strtd[0]));

                ds1 = objclsTimeSheet.MissingEntery(strtdate, endDate);
                if (ds1.Tables[1].Rows.Count > 1)
                {
                    btndiv.Visible = true;
                    Table tb_Emp = new Table();
                    TableCell cell_emp_img;
                    TableCell cell_emp_name;
                    TableRow tr_img = new TableRow();
                    TableRow tr_emp_name = new TableRow();



                    // set <h1> for display header 
                    HtmlGenericControl dtDisplay = new HtmlGenericControl("h1");
                    dtDisplay.Attributes.Add("cursor", "pointer");
                    dtDisplay.InnerText = tempdt.ToString("dd-MMM-yy");

                    MainPanel.Controls.Add(dtDisplay);
                    MainPanel.Controls.Add(dtHader);

                    HtmlImage img_emp;
                    HtmlGenericControl maincontent = new HtmlGenericControl();
                    MainPanel.Controls.Add(dtDisplay);
                    int total_rows = 1;
                    foreach (DataRow total_user in ds1.Tables[1].Rows)
                    {


                        tb_Emp = new Table();
                        img_emp = new HtmlImage();
                        img_emp.Src = "~/Images/" + total_user["szPhotoPath"].ToString();
                        img_emp.Width = 100;
                        img_emp.Height = 100;

                        cell_emp_img = new TableCell();
                        cell_emp_img.Controls.Add(img_emp);

                        cell_emp_name = new TableCell();
                        cell_emp_name.Text = total_user["szContactPerson"].ToString();


                        tr_img.Controls.Add(cell_emp_img);


                        tr_emp_name.Controls.Add(cell_emp_name);


                        total_rows++;
                        if (total_rows > 8)
                        {
                            tb_Emp.Rows.Add(tr_img);
                            tr_emp_name.Attributes.Add("align", "center");
                            tb_Emp.Rows.Add(tr_emp_name);
                           
                            maincontent.Controls.Add(tb_Emp);
                            tr_img = new TableRow();
                            tr_emp_name = new TableRow();
                            total_rows = 1;
                        }


                    }
                    tb_Emp.Rows.Add(tr_img);
                    tr_emp_name.Attributes.Add("align", "center");
                    tb_Emp.Rows.Add(tr_emp_name);
                    dtHader.Controls.Add(dtDisplay);
                    dtHader.Controls.Add(maincontent);
                    maincontent.Controls.Add(tb_Emp);
                    maincontent.Attributes.Add("class", "content");

                }
            }
           
            tempdt = strtdate.AddDays(i);
        }



        //Table tbq = new Table();

        //HtmlImage imgq = new HtmlImage();
        //imgq.Src = "~/Images/090909031440.jpeg";

        //HtmlImage img1q = new HtmlImage();
        //img1q.Src = "~/Images/090909031354.jpeg";


        //TableCell tdq = new TableCell();
        ////td.Text = "Employee Image";
        //tdq.Controls.Add(imgq);


        //TableCell tdimgq = new TableCell();
        ////td.Text = "Employee Image";
        //tdimgq.Controls.Add(img1q);



        //TableCell tdimgtxtq = new TableCell();
        //tdimgtxtq.Text = "Employee Image";





        //TableCell td1q = new TableCell();
        //td1q.Text = "Employee Name";


        //TableRow trq = new TableRow();
        //TableRow tr1q = new TableRow();
        //trq.Cells.Add(tdq);
        //trq.Cells.Add(tdimgq);
        //tr1q.Cells.Add(td1q);
        //tr1q.Cells.Add(tdimgtxtq);
        //tbq.Rows.Add(trq);
        //tbq.Rows.Add(tr1q);

        //HtmlGenericControl ch1q = new HtmlGenericControl("div");
        //ch1q.Attributes.Add("class", "panel");



        //HtmlGenericControl h1q = new HtmlGenericControl("h1");
        //h1q.InnerText = " Date 01-Nov-12 ";



        //MainPanel.Controls.Add(h1q);

        //HtmlGenericControl p1q = new HtmlGenericControl();
        //p1q.Controls.Add(tbq);
        //p1q.Attributes.Add("class", "content");


        //ch1q.Controls.Add(h1q);
        //ch1q.Controls.Add(p1q);




        //MainPanel.Controls.Add(ch1q);
        


    }
    protected void btnGo01_Click(object sender, EventArgs e)
    {

    }
}
