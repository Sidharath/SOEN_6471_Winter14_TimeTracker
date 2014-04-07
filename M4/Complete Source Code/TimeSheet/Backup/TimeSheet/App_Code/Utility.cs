using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.IO;
using System.Web;
using System.Web.Mail;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using NarolaInfotech.Utility;
using TimeSheet;
using System.Globalization;
using System.Web.Configuration;
using System.Xml;
/// <summary>
/// Summary description for Class1
/// </summary>
public static class Utility
{
  #region GetUserName
  public static string GetUserName()
  {
    UserMaster loMaster = null;

    if (System.Web.HttpContext.Current.Session["User"] != null)
    {
      loMaster = (UserMaster)System.Web.HttpContext.Current.Session["User"];
      return loMaster.szUserName;
    }
    else
    {
      return string.Empty;
    }
  }
  #endregion

  #region GetUserId
  public static int GetUserId()
  {
    UserMaster loMaster = null;

    if (System.Web.HttpContext.Current.Session["User"] != null)
    {
      loMaster = (UserMaster)System.Web.HttpContext.Current.Session["User"];
      return loMaster.nmUserID;
    }
    else
    {
      return 0;
    }
  }
  #endregion

  #region GetAdminName
  public static string GetAdminName()
  {
    Admin loAdmin = null;

    if (System.Web.HttpContext.Current.Session["AdminUser"] != null)
    {
      loAdmin = (Admin)System.Web.HttpContext.Current.Session["AdminUser"];
      return loAdmin.szUserName;
    }
    else
    {
      return string.Empty;
    }
  }
  #endregion

  #region setMessage
  public static void setMessage(Label plblErrorMessage, String fstFor)
  {
    switch (fstFor)
    {
      case "Add":
        plblErrorMessage.Text = "<div width=\"90%\" style=\"" + getCSS("successmsg") + "\"><table align='center'><tr><td><img src='" +  clsFunctions.GetSiteRoot() + "/images/sucess.png'/></td><td style=\"" + getCSS("TdCss") + "\">&nbsp;Record Added Successfully !</td></tr></table></div>";
        break;
      case "Edit":
        plblErrorMessage.Text = "<div width=\"90%\" style=\"" + getCSS("successmsg") + "\"><table align='center'><tr><td><img src='" + clsFunctions.GetSiteRoot() + "/images/sucess.png'/></td><td style=\"" + getCSS("TdCss") + "\">&nbsp;Record Updated Successfully !</td></tr></table></div>";
        break;
      case "Delete":
        plblErrorMessage.Text = "<div width=\"90%\" style=\"" + getCSS("successmsg") + "\"><table align='center'><tr><td><img src='" + clsFunctions.GetSiteRoot() + "/images/sucess.png'/></td><td style=\"" + getCSS("TdCss") + "\">&nbsp;Record Deleted Successfully !</td></tr></table></div>";
        break;
      case "Fail":
        plblErrorMessage.Text = "<div width=\"90%\" style=\"" + getCSS("errormsg") + "\"><table align='center'><tr><td><img src='" + clsFunctions.GetSiteRoot() + "/images/error.png'/></td><td style=\"" + getCSS("TdCss") + "\">&nbsp;Operation Failed !</td></tr></table></div>";
        break;
      default:
        plblErrorMessage.Text = "";
        break;
    }
  }
  #endregion

  #region getMessageFormat
  public static void getMessageFormat(Label plblErrorMessage, String pstMessage, Boolean pblIsError)
  {
    if (pblIsError)
      plblErrorMessage.Text = "<div width=\"100%\" style=\"" + getCSS("errormsg") + "\"><table align='center'><tr><td><img src='" + clsFunctions.GetSiteRoot() + "/images/error.png'/></td><td style=\"" + getCSS("TdCss") + "\">&nbsp;" + pstMessage + "</td></tr></table></div>";
    else
      plblErrorMessage.Text = "<div width=\"100%\" style=\"" + getCSS("successmsg") + "\"><table align='center'><tr><td><img src='" + clsFunctions.GetSiteRoot() + "/images/sucess.png'/></td><td style=\"" + getCSS("TdCss") + "\">&nbsp;" + pstMessage + "</td></tr></table></div>";
  }


  #endregion

  #region getCss
  public static String getCSS(String pstCssClass)
  {
    switch (pstCssClass)
    {
      case "TdCss":
        return "font-size: 11px; font-family:Arial; font-weight:bold;";
        break;
      case "errormsg":
        return "background-color: #8F071F; border:1px solid #000; text-align: center; font-size: 5px; font-family:Arial; font-weight:bold; line-height: 30px; color: #FFF;";
        break;
      case "successmsg":
        return "background-color: #668F53; border:1px solid #000; text-align: center; font-size: 5px; font-family:georgia; font-weight:bold; line-height: 30px; color: #fff;";
        break;
      default:
        return "";
        break;
    }
  }
  #endregion

  #region WriteLogFile
  public static void WriteLogFile(string lsValue)
  {
    String lsFilePath = string.Empty;

    StreamWriter loFileWriter = null;
    try
    {
      lsFilePath = System.Web.HttpContext.Current.Request.PhysicalApplicationPath;
      lsFilePath += @"\log\" + DateTime.Now.ToString("MM-dd-yyyy") + ".txt";
      FileInfo loInfo = new FileInfo(lsFilePath);
      if (loInfo.Exists)
      { }
      else
      {
        loInfo.Create();
      }
      loFileWriter = new StreamWriter(lsFilePath, true);
      loFileWriter.Write(DateTime.Now + " :- " + lsValue + "\r\n");

    }
    catch (Exception ex)
    {

    }
    finally
    {
      loFileWriter.Close();
    }
  }
  #endregion

  #region sendMail
  public static void sendMail(string fsTo, string fsCc, string fsBcc, string fsSubject, string fsMessage)
  {
    try
    {
      System.Web.Mail.MailMessage Email = new System.Web.Mail.MailMessage();//Creating the Mail Message object.
      Email.To = fsTo;
      if (!string.IsNullOrEmpty(fsCc))
      {
        Email.Cc = fsCc;
      }
      Email.From = ConfigurationManager.AppSettings["UserID"];
      Email.Subject = fsSubject;
      Email.Body = fsMessage;
      Email.Priority = System.Web.Mail.MailPriority.High;//Setting priority to the mail as high,low,or normal
      Email.BodyFormat = System.Web.Mail.MailFormat.Html;//Formatting the mail as html or text. 

      Email.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", 1);
      Email.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", ConfigurationManager.AppSettings["UserID"]);
      Email.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", ConfigurationManager.AppSettings["Password"]);
      Email.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", 2);
      Email.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserver", ConfigurationManager.AppSettings["MailServer"]);
      Email.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout", 10);
      Email.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", 25);
      Email.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", false);

      try
      {

        System.Web.Mail.SmtpMail.SmtpServer = ConfigurationManager.AppSettings["MailServer"];
        System.Web.Mail.SmtpMail.Send(Email);//Sending the mail.

      }
      catch (Exception ex)
      {
        Email.Fields.Remove("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate");
        Email.Fields.Remove("http://schemas.microsoft.com/cdo/configuration/sendusing");
        Email.Fields.Remove("http://schemas.microsoft.com/cdo/configuration/smtpusessl");

        Email.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", 0);
        Email.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", 1);
        Email.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", true);

        System.Web.Mail.SmtpMail.SmtpServer = ConfigurationManager.AppSettings["MailServer"];
        System.Web.Mail.SmtpMail.Send(Email);//Sending the mail.
      }

    }
    catch (Exception foException)
    {

    }
  }
  #endregion

  #region WriteErrorLog
  public static void WriteErrorLog(String fstext)
  {
    CultureInfo ci = new CultureInfo("en-us");
    StreamWriter sw = new StreamWriter(HttpContext.Current.Request.PhysicalApplicationPath + "\\" + "E-Log.txt", true, System.Text.Encoding.ASCII);
    sw.Write(DateTime.Now.ToString(ci));
    sw.Write(": ");
    sw.Write(fstext); //Request.PhysicalApplicationPath
    sw.Write(Environment.NewLine);
    sw.Close();
  }
  #endregion

  public static bool CheckLic()
  {
    Admin loAdmin = new Admin();

    ExeConfigurationFileMap map = new ExeConfigurationFileMap();
    //map.ExeConfigFilename = Path.Combine(MapPath("~"), "web.config"); // the root web.config  
    map.ExeConfigFilename = System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath + "web.config";
    string webConfigContents = File.ReadAllText(map.ExeConfigFilename);


    XmlTextReader reader = new XmlTextReader(map.ExeConfigFilename);
    reader.WhitespaceHandling = WhitespaceHandling.None;
    XmlDocument xmlDoc = new XmlDocument();
    xmlDoc.Load(reader);
    reader.Close();


    string lastdate = xmlDoc.GetElementsByTagName("appSettings").Item(0).ChildNodes[3].Attributes[1].Value;

      if (lastdate.Trim().Length > 0 )
      {
          try
          {
              string lsValue = loAdmin.Decrypt(lastdate, true);
              if (DateTime.Now <= Convert.ToDateTime(lsValue))
              {
                  return true;
              }
              else
                  return false;
          }
          catch (Exception ex)
          {
              return false;
          }
      }

    //Read infomation From WebConfig.
    //System.Configuration.Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
    //AppSettingsSection objAppsettings = (AppSettingsSection)config.GetSection("appSettings");

    //if (objAppsettings != null)
    //{
    //  try
    //  {
    //    string lsValue = loAdmin.Decrypt(objAppsettings.Settings["lastDate"].Value, true);
    //    if (DateTime.Now <= Convert.ToDateTime(lsValue))
    //    {
    //      return true;
    //    }
    //    else
    //      return false;
    //  }
    //  catch (Exception ex)
    //  {
    //    return false;
    //  }
    //}
    return false;
  }
}
