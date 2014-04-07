<%@ Application Language="C#" %>

<script RunAt="server">

    System.Timers.Timer appTimer = new System.Timers.Timer(1000 * 15);    // One minute.
    public static System.ComponentModel.BackgroundWorker objBackgroundWorker;
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        #region Background Process
        objBackgroundWorker = new System.ComponentModel.BackgroundWorker();
        objBackgroundWorker.DoWork += new System.ComponentModel.DoWorkEventHandler(objBackgroundWorker_DoWork);

        objBackgroundWorker.WorkerReportsProgress = false;
        objBackgroundWorker.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(objBackgroundWorker_RunWorkerCompleted);

        objBackgroundWorker.RunWorkerAsync();
        #endregion

    }

    void objBackgroundWorker_RunWorkerCompleted(object sender, System.ComponentModel.RunWorkerCompletedEventArgs e)
    {
        objBackgroundWorker = sender as System.ComponentModel.BackgroundWorker;
        if (objBackgroundWorker != null)
        {
            //System.Threading.Thread.Sleep(10000);
            System.Threading.Thread.Sleep(900000);
            objBackgroundWorker.RunWorkerAsync();
        }

    }

    void objBackgroundWorker_DoWork(object sender, System.ComponentModel.DoWorkEventArgs e)
    {

        int comparetime = DateTime.Now.TimeOfDay.Hours;
        if ((DateTime.Now.TimeOfDay.Hours == 22 && DateTime.Now.TimeOfDay.Minutes <= 59)
            && (DateTime.Now.TimeOfDay.Hours == 22 && DateTime.Now.TimeOfDay.Minutes > 45) && DateTime.Now.DayOfWeek.ToString().ToLower() != "sunday")
        {
            //if (comparetime > 22 && DateTime.Now.DayOfWeek.ToString().ToLower()!= "sunday")
            //{
            string strConnection = ConfigurationSettings.AppSettings["ConnectionString"];
            System.Data.SqlClient.SqlConnection MyConnection = new System.Data.SqlClient.SqlConnection(strConnection);
            MyConnection.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
            cmd.Connection = MyConnection;
            cmd.CommandText = "USP_SEND_EMAIL_NOTIFICATION";
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            System.Data.SqlClient.SqlDataAdapter adp = new System.Data.SqlClient.SqlDataAdapter(cmd);
            System.Data.DataSet ds = new System.Data.DataSet();
            adp.Fill(ds);

            System.Net.Mail.MailMessage objMail = new System.Net.Mail.MailMessage();
            string emailFrom = System.Configuration.ConfigurationManager.AppSettings["system_email_sender"].ToString();
            string admin_email_paswd = System.Configuration.ConfigurationManager.AppSettings["system_email_sender_password"].ToString();
            string Host_name = System.Configuration.ConfigurationManager.AppSettings["MailServerIP"].ToString();
            string OUT_PORT = System.Configuration.ConfigurationManager.AppSettings["OUT_PORT"].ToString();
            // string admin_email = System.Configuration.ConfigurationManager.AppSettings["Admin_Email"].ToString();
            // string email_subject = System.Configuration.ConfigurationManager.AppSettings["Email_subject"].ToString();
            if (ds.Tables[0].Rows.Count > 0)
            {
                //string emailformatpath = System.Configuration.ConfigurationManager.AppSettings["EmailFormatFile"].ToString();
                //string filedata = System.IO.File.ReadAllText(emailformatpath);

                string date = DateTime.Now.ToString("dd-MMM-yy");
                foreach (System.Data.DataRow item in ds.Tables[0].Rows)
                {
                    string EmailBody = @"<html>
<body>
<br>
Hey {0},
<br><br>
It seems you did not enter timesheet for {1}. Kindly do the needful. It is necessary to fill time sheet daily. So kindly take care of it in the future.
<br><br>
P.S. If you were absent on {1}, you may ignore this email.
<br><br>
Note: It is auto generated email. Do not reply this email.

</body>
</html>";

                    string email_subject = System.Configuration.ConfigurationManager.AppSettings["Email_subject"].ToString();
                    string AdminCC = System.Configuration.ConfigurationManager.AppSettings["Admin_EmailCC"].ToString();
                    email_subject = string.Format(email_subject, item["szContactPerson"].ToString(), date);

                    EmailBody = string.Format(EmailBody, item["szContactPerson"].ToString(), date);
                    objMail.From = new System.Net.Mail.MailAddress(emailFrom);
                    objMail.To.Add(new System.Net.Mail.MailAddress(item["szUserName"].ToString()));
                    objMail.CC.Add(new System.Net.Mail.MailAddress(AdminCC));
                    objMail.Body = EmailBody;

                    objMail.IsBodyHtml = true;
                    objMail.Subject = email_subject;
                    objMail.Priority = System.Net.Mail.MailPriority.Normal;

                    System.Net.Mail.SmtpClient smtpcli = new System.Net.Mail.SmtpClient(Host_name, 587);
                    smtpcli.EnableSsl = true;
                    smtpcli.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtpcli.Credentials = new System.Net.NetworkCredential(emailFrom, admin_email_paswd);
                    smtpcli.Send(objMail);
                    objMail.To.Remove(new System.Net.Mail.MailAddress(item["szUserName"].ToString()));

                    objMail.CC.Remove(new System.Net.Mail.MailAddress(AdminCC));

                }

            }
            else
            {

            }

        }


    }


    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    void Application_BeginRequest(Object Sender, EventArgs e)
    {
        if (objBackgroundWorker == null)
        {
            Application["EmailNotification"] = "False";
            #region Background
            objBackgroundWorker = new System.ComponentModel.BackgroundWorker();
            objBackgroundWorker.DoWork += new System.ComponentModel.DoWorkEventHandler(objBackgroundWorker_DoWork);

            objBackgroundWorker.WorkerReportsProgress = false;
            objBackgroundWorker.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(objBackgroundWorker_RunWorkerCompleted);
            objBackgroundWorker.RunWorkerAsync();
            #endregion

        }
        else
        {
            Application["EmailNotification"] = "True";
        }
    }
       
</script>

