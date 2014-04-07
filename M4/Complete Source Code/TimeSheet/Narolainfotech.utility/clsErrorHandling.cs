using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Collections;
using System.IO;

namespace NarolaInfotech.Utility
{
  public static class clsErrorHandling
  {
    #region LogError
    /// <summary>
    /// Method to Manage Log Error State.
    /// </summary>
    /// <param name="e">e object of Exception.</param>
    public static void LogError(Exception e)
    {
      LogError(e, "");
    } 
    #endregion

    #region LogError
    /// <summary>
    /// /// Method to Manage Log Error State.
    /// </summary>
    /// <param name="ex">ex object of Exception.</param>
    /// <param name="msg">Message of Exception.</param>
    public static void LogError(Exception ex, string msg)
    {
      StreamWriter sw = null;
      try
      {
        string text = DateTime.Now + " : ";
        if (msg.Length > 0)
          text += "\n(My Message : " + msg + ")\n";

        text += ex.ToString();


        //System.Web.HttpServerUtility oHttp = new System.Web.HttpServerUtility();
        //string ErrFile = oHttp.MapPath(@"Log\errLog.txt");  

        string ErrFile = ConfigurationSettings.AppSettings["SysDir"] + ConfigurationSettings.AppSettings["ErrLogFile"];
        FileInfo ferr = new FileInfo(ErrFile);
        sw = ferr.AppendText();
        sw.WriteLine(text);
        sw.WriteLine("====================================================");
      }
      catch
      {
      }
      finally
      {
        if (sw != null)
          sw.Close();
      }
    } 
    #endregion

    #region LogMsg
    /// <summary>
    /// Method to Manage Log Error State.
    /// </summary>
    /// <param name="msg">Message of Excetion.</param>
    public static void LogMsg(string msg)
    {
      StreamWriter sw = null;
      try
      {

        string ErrFile = ConfigurationSettings.AppSettings["SysDir"] + ConfigurationSettings.AppSettings["ErrLogFile"];


        ErrFile += ".log";
        FileInfo ferr = new FileInfo(ErrFile);
        sw = ferr.AppendText();
        sw.WriteLine(msg);
        sw.WriteLine("====================================================");
      }
      catch
      {
      }
      finally
      {
        if (sw != null)
          sw.Close();
      }
    } 
    #endregion
  }
}
