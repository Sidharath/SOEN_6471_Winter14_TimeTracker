using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NarolaInfotech.Utility;
using TimeSheet;
using System.Data;
public partial class Admin_Report : System.Web.UI.Page
{
    public string lsPipeChart = string.Empty, lsChart = string.Empty;

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDropDownlist();
            ManageControl();
            txtStartDate.Text = DateTime.Now.AddMonths(-1).ToString("MM-dd-yyyy");
            txtEndDate.Text = DateTime.Now.ToString("MM-dd-yyyy");
        }
    }
    #endregion

    #region lblGo_Click
    protected void lblGo_Click(object sender, EventArgs e)
    {
        //Manage Go.
        switch (clsFunctions.GetIntParameter("id"))
        {
            case 1:
                if (drdUserList.SelectedValue.Equals("0"))
                {
                    clsFunctions.getMessageFormat(lblMessage, "Please select user", true);
                }
                else
                {
                    clsFunctions.getMessageFormat(lblMessage, "", true);
                    ManageGo();
                }
                break;
            case 2:
                if (drdUserList.SelectedValue.Equals("0"))
                {
                    clsFunctions.getMessageFormat(lblMessage, "Please select user", true);
                }
                else
                {
                    clsFunctions.getMessageFormat(lblMessage, "", true);
                    ManageGo();
                }
                break;
            case 3:
                if (drdProject.SelectedValue.Equals("0"))
                {
                    clsFunctions.getMessageFormat(lblMessage, "Please select project", true);
                }
                else
                {
                    clsFunctions.getMessageFormat(lblMessage, "", true);
                    ManageGo();
                }
                break;
            case 4:
                if (drdProject.SelectedValue.Equals("0"))
                {
                    clsFunctions.getMessageFormat(lblMessage, "Please select project", true);
                }
                else
                {
                    clsFunctions.getMessageFormat(lblMessage, "", true);
                    ManageGo();
                }
                break;
        }  
    }
    #endregion

    #region ManageGo
    private void ManageGo()
    {
        try
        {
            switch (clsFunctions.GetIntParameter("id"))
            {
                case 1:
                    if (!drdUserList.SelectedValue.Equals("0"))
                        GetUserEfficancyReport();

                    break;
                case 2:
                    if (!drdUserList.SelectedValue.Equals("0"))
                        GetUserProjectReport();
                    break;
                case 3:
                    if (!drdProject.SelectedValue.Equals("0"))
                        GetProjectUserwise();
                    break;
                case 4:
                    if (!drdProject.SelectedValue.Equals("0"))
                        GetProjectModulewiseReport();
                    break;
            }
        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion

    #region LoadDropDownlist
    private void LoadDropDownlist()
    {
        UserMaster loMaster = null;
        Project loProject = null;
        DataSet dsValue = null;
        try
        {
            loMaster = new UserMaster();
            loMaster.szArchive = "0";
            dsValue = loMaster.Load();

            drdUserList.DataSource = dsValue;
            drdUserList.DataTextField = "szContactPerson";
            drdUserList.DataValueField = "nmUserID";
            drdUserList.DataBind();

            drdUserList.Items.Add(new ListItem("-- Select -- ", "0"));
            drdUserList.SelectedValue = "0";

            loProject = new Project();
            dsValue = loProject.Load();

            drdProject.DataSource = dsValue;
            drdProject.DataTextField = "szProjectName";
            drdProject.DataValueField = "nmProjectID";
            drdProject.DataBind();

            drdProject.Items.Add(new ListItem("-- Select -- ", "0"));
            drdProject.SelectedValue = "0";

        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion

    #region ManageControl
    private void ManageControl()
    {
        try
        {
            switch (clsFunctions.GetIntParameter("id"))
            {
                case 1:
                    lblTitle.Text = "User Efficiency Report";
                    drdUserList.Visible = true;
                    lblUser.Visible = true;
                    break;
                case 2:
                    lblTitle.Text = "User Projectwise Report";
                    drdUserList.Visible = true;
                    lblUser.Visible = true;
                    break;
                case 3:
                    lblTitle.Text = "Project Userwise Report";
                    drdProject.Visible = true;
                    lblProject.Visible = true;
                    break;
                case 4:
                    lblTitle.Text = "Project Taskwise Report";
                    drdProject.Visible = true;
                    lblProject.Visible = true;
                    break;
            }
        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion

    #region GetUserEfficancyReport
    private void GetUserEfficancyReport()
    {
        Admin loAdmin = null;
        DataSet dsValue = null;
        DateTime endDate;
        string lsValue = string.Empty;
        int lsCount = 0;
        try
        {
            endDate = Convert.ToDateTime(txtEndDate.Text.Trim());
            loAdmin = new Admin();
            dsValue = loAdmin.GetUserEfficacyReoprt(Convert.ToDateTime(txtStartDate.Text.Trim()),
                                                    new DateTime(endDate.Year, endDate.Month, endDate.Day, 23, 59, 59),
                                                    clsFunctions.ToInteger(drdUserList.SelectedValue));

            #region Draw Column Chart

            lsValue = " <script type=\"text/javascript\" src=\"http://www.google.com/jsapi\"></script><script type=\"text/javascript\">var chart=null;google.load(\"visualization\", \"1\"," +
                 " {packages:[\"columnchart\"]});google.setOnLoadCallback(drawChart);function drawChart() {var data = new google.visualization.DataTable();";
            lsValue += "data.addColumn('string', '" + drdUserList.Text + " Efficiency Report '); data.addColumn('number', 'Total Time(hr)');";
            foreach (DataRow dr in dsValue.Tables[0].Rows)
            {
                if (lsCount == 0)
                {
                    lsValue += "data.addRows(" + dsValue.Tables[0].Rows.Count + "); ";
                }
                lsValue += "data.setValue(" + lsCount + ", 0, '" + Convert.ToDateTime(dr["DATE"].ToString()).ToString("dd/MM") + "');  data.setValue(" + lsCount + ", 1, " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + ");    ";
                lsCount++;
            }
            lsValue += "chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));chart.draw(data, { width: 800, height: 350, is3D: true, title: '" + drdUserList.SelectedItem.Text + " Efficiency Report', enableTooltip: true,titleY:'Hours' ,titleX:'Date'})};</script>";
            lsChart = lsValue;
            #endregion


            //#region Draw Pipe Chart

            //lsValue = string.Empty;
            //lsValue = "var data = new google.visualization.DataTable();data.addColumn('string', '" + drdUserList.Text + " Efficacy Report '); data.addColumn('number', 'Total Time(hr)');";
            //lsCount = 0;
            //foreach (DataRow dr in dsValue.Tables[0].Rows)
            //{
            //  if (lsCount == 0)
            //  {
            //    if (dsValue.Tables[0].Rows.Count == 1)
            //    {
            //      lsValue += "data.addRows([['" + dr["DATE"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "]]);";
            //    }
            //    else
            //      lsValue += "data.addRows([['" + dr["DATE"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "],";

            //  }
            //  else if ((lsCount + 1) == dsValue.Tables[0].Rows.Count)
            //  {
            //    lsValue += "['" + dr["DATE"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "]]);";
            //  }
            //  else
            //  {
            //    lsValue += "['" + dr["DATE"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "],";
            //  }
            //  lsCount++;
            //}
            //lsValue += "var chart = new google.visualization.PieChart(document.getElementById('chart_div1')); chart.draw(data, { width: 600, height: 280, is3D: true, title: '" + drdUserList.SelectedItem.Text + " Efficacy Report' }); ";
            //lsPipeChart = lsValue;
            //#endregion


        }
        catch (Exception ex)
        {

            throw;
        }
    }
    #endregion

    #region GetUserProjectReport
    private void GetUserProjectReport()
    {
        Admin loAdmin = null;
        DataSet dsValue = null;
        DateTime endDate;
        string lsValue = string.Empty;
        int lsCount = 0;
        try
        {
            endDate = Convert.ToDateTime(txtEndDate.Text.Trim());
            loAdmin = new Admin();
            dsValue = loAdmin.GetUserProjectReport(Convert.ToDateTime(txtStartDate.Text.Trim()),
                                                    new DateTime(endDate.Year, endDate.Month, endDate.Day, 23, 59, 59),
                                                    clsFunctions.ToInteger(drdUserList.SelectedValue));

            #region Draw Column Chart

            lsValue = " <script type=\"text/javascript\" src=\"http://www.google.com/jsapi\"></script><script type=\"text/javascript\">var chart=null;google.load(\"visualization\", \"1\"," +
              " {packages:[\"columnchart\"]});google.setOnLoadCallback(drawChart);function drawChart() {var data = new google.visualization.DataTable();";
            lsValue += "data.addColumn('string', '" + drdUserList.Text + " Project Report '); data.addColumn('number', 'Total Time(hr)');";
            foreach (DataRow dr in dsValue.Tables[0].Rows)
            {
                if (lsCount == 0)
                {
                    lsValue += "data.addRows(" + dsValue.Tables[0].Rows.Count + "); ";
                }
                lsValue += "data.setValue(" + lsCount + ", 0, '" + dr["szProjectName"].ToString() + "');  data.setValue(" + lsCount + ", 1, " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + ");    ";
                lsCount++;
            }
            lsValue += "chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));chart.draw(data, { width: 800, height: 350, is3D: true, title: '" + drdUserList.SelectedItem.Text + " Project Report', enableTooltip: true ,titleY:'Hours' ,titleX:'Project Name'})};</script>";
            lsChart = lsValue;
            #endregion


            #region Draw Pipe Chart

            lsValue = string.Empty;
            lsValue = "<script type=\"text/javascript\">  google.load('visualization', '1', { 'packages': ['piechart'] });    google.setOnLoadCallback(drawChart1);    function drawChart1() {" +
              "var data = new google.visualization.DataTable();data.addColumn('string', '" + drdUserList.Text + " Project Report '); data.addColumn('number', 'Total Time(hr)');";
            lsCount = 0;
            foreach (DataRow dr in dsValue.Tables[0].Rows)
            {
                if (lsCount == 0)
                {
                    if (dsValue.Tables[0].Rows.Count == 1)
                    {
                        lsValue += "data.addRows([['" + dr["szProjectName"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "]]);";
                    }
                    else
                        lsValue += "data.addRows([['" + dr["szProjectName"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "],";

                }
                else if ((lsCount + 1) == dsValue.Tables[0].Rows.Count)
                {
                    lsValue += "['" + dr["szProjectName"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "]]);";
                }
                else
                {
                    lsValue += "['" + dr["szProjectName"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "],";
                }
                lsCount++;
            }
            lsValue += "var chart = new google.visualization.PieChart(document.getElementById('chart_div1')); chart.draw(data, { width: 600, height: 280, is3D: true, title: '" + drdUserList.SelectedItem.Text + " Project Report' });}</script> ";
            lsPipeChart = lsValue;
            #endregion


        }
        catch (Exception ex)
        {

            throw;
        }
    }
    #endregion

    #region GetProjectUserwise
    private void GetProjectUserwise()
    {
        Admin loAdmin = null;
        DataSet dsValue = null;
        DateTime endDate;
        string lsValue = string.Empty;
        int lsCount = 0;
        try
        {
            endDate = Convert.ToDateTime(txtEndDate.Text.Trim());
            loAdmin = new Admin();
            dsValue = loAdmin.GetProjectUserwise(Convert.ToDateTime(txtStartDate.Text.Trim()),
                                                new DateTime(endDate.Year, endDate.Month, endDate.Day, 23, 59, 59),
                                                clsFunctions.ToInteger(drdProject.SelectedValue));

            #region Draw Column Chart

            lsValue = " <script type=\"text/javascript\" src=\"http://www.google.com/jsapi\"></script><script type=\"text/javascript\">var chart=null;google.load(\"visualization\", \"1\"," +
             " {packages:[\"columnchart\"]});google.setOnLoadCallback(drawChart);function drawChart() {var data = new google.visualization.DataTable();";
            lsValue += "data.addColumn('string', '" + drdProject.Text + " Userwise Report '); data.addColumn('number', 'Total Time(hr)');";
            foreach (DataRow dr in dsValue.Tables[0].Rows)
            {
                if (lsCount == 0)
                {
                    lsValue += "data.addRows(" + dsValue.Tables[0].Rows.Count + "); ";
                }
                lsValue += "data.setValue(" + lsCount + ", 0, '" + dr["szContactPerson"].ToString() + "');  data.setValue(" + lsCount + ", 1, " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + ");    ";
                lsCount++;
            }
            lsValue += "chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));chart.draw(data, { width: 800, height: 350, is3D: true, title: '" + drdProject.SelectedItem.Text + " Userwise Report', enableTooltip: true  ,titleY:'Hours' ,titleX:'Employee Name'})};</script>";
            lsChart = lsValue;
            #endregion


            #region Draw Pipe Chart

            lsValue = string.Empty;
            lsValue = "<script type=\"text/javascript\">  google.load('visualization', '1', { 'packages': ['piechart'] });    google.setOnLoadCallback(drawChart1);    function drawChart1() {" +
              "var data = new google.visualization.DataTable();data.addColumn('string', '" + drdProject.Text + " Userwise Report '); data.addColumn('number', 'Total Time(hr)');";
            lsCount = 0;
            foreach (DataRow dr in dsValue.Tables[0].Rows)
            {
                if (lsCount == 0)
                {
                    if (dsValue.Tables[0].Rows.Count == 1)
                    {
                        lsValue += "data.addRows([['" + dr["szContactPerson"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "]]);";
                    }
                    else
                        lsValue += "data.addRows([['" + dr["szContactPerson"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "],";

                }
                else if ((lsCount + 1) == dsValue.Tables[0].Rows.Count)
                {
                    lsValue += "['" + dr["szContactPerson"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "]]);";
                }
                else
                {
                    lsValue += "['" + dr["szContactPerson"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "],";
                }
                lsCount++;
            }
            lsValue += "var chart = new google.visualization.PieChart(document.getElementById('chart_div1')); chart.draw(data, { width: 600, height: 280, is3D: true, title: '" + drdProject.SelectedItem.Text + " Userwise Report' });}</script> ";
            lsPipeChart = lsValue;
            #endregion


        }
        catch (Exception ex)
        {

            throw;
        }
    }
    #endregion

    #region GetProjectModulewiseReport
    private void GetProjectModulewiseReport()
    {
        Admin loAdmin = null;
        DataSet dsValue = null;
        DateTime endDate;
        string lsValue = string.Empty;
        int lsCount = 0;
        try
        {
            endDate = Convert.ToDateTime(txtEndDate.Text.Trim());
            loAdmin = new Admin();
            dsValue = loAdmin.GetProjectModulewiseReport(Convert.ToDateTime(txtStartDate.Text.Trim()),
                                                        new DateTime(endDate.Year, endDate.Month, endDate.Day, 23, 59, 59),
                                                        clsFunctions.ToInteger(drdProject.SelectedValue));

            #region Draw Column Chart

            lsValue = " <script type=\"text/javascript\" src=\"http://www.google.com/jsapi\"></script><script type=\"text/javascript\">var chart=null;google.load(\"visualization\", \"1\"," +
             " {packages:[\"columnchart\"]});google.setOnLoadCallback(drawChart);function drawChart() {var data = new google.visualization.DataTable();";
            lsValue += "data.addColumn('string', '" + drdProject.Text + " Modulewise Report '); data.addColumn('number', 'Total Time(hr)');";
            foreach (DataRow dr in dsValue.Tables[0].Rows)
            {
                if (lsCount == 0)
                {
                    lsValue += "data.addRows(" + dsValue.Tables[0].Rows.Count + "); ";
                }
                lsValue += "data.setValue(" + lsCount + ", 0, '" + dr["szModuleName"].ToString() + "');  data.setValue(" + lsCount + ", 1, " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + ");    ";
                lsCount++;
            }
            lsValue += "chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));chart.draw(data, { width: 800, height: 350, is3D: true, title: '" + drdProject.SelectedItem.Text + " Modulewise Report', enableTooltip: true  ,titleY:'Hours' ,titleX:'Module Name'})};</script>";
            lsChart = lsValue;
            #endregion


            #region Draw Pipe Chart

            lsValue = string.Empty;
            lsValue = "<script type=\"text/javascript\">  google.load('visualization', '1', { 'packages': ['piechart'] });    google.setOnLoadCallback(drawChart1);    function drawChart1() {" +
                    "var data = new google.visualization.DataTable();data.addColumn('string', '" + drdProject.Text + " Modulewise Report '); data.addColumn('number', 'Total Time(hr)');";
            lsCount = 0;
            foreach (DataRow dr in dsValue.Tables[0].Rows)
            {
                if (lsCount == 0)
                {
                    if (dsValue.Tables[0].Rows.Count == 1)
                    {
                        lsValue += "data.addRows([['" + dr["szModuleName"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "]]);";
                    }
                    else
                        lsValue += "data.addRows([['" + dr["szModuleName"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "],";

                }
                else if ((lsCount + 1) == dsValue.Tables[0].Rows.Count)
                {
                    lsValue += "['" + dr["szModuleName"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "]]);";
                }
                else
                {
                    lsValue += "['" + dr["szModuleName"].ToString() + "',  " + (string.IsNullOrEmpty(dr["Hours"].ToString()) ? "0" : dr["Hours"].ToString()) + "],";
                }
                lsCount++;
            }
            lsValue += "var chart = new google.visualization.PieChart(document.getElementById('chart_div1')); chart.draw(data, { width: 600, height: 280, is3D: true, title: '" + drdProject.SelectedItem.Text + " Modulewise Report' }); }</script> ";
            lsPipeChart = lsValue;
            #endregion
        }
        catch (Exception ex)
        {
            Utility.getMessageFormat(lblMessage, ex.Message, true);
        }
    }
    #endregion
}
