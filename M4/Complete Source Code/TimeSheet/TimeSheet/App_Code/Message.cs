using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for Message
/// </summary>
public static class Message
{
  public const string LOGIN_FAIL = "Invalid username or password, please try again.";
  public const string DUP_USER = "User name is already exist!";
  public const string FORGOT_PASSWORD_ERROR = "The E-Mail Address was not found in our records, please try again.";
  public const string FORGOT_PASSWORD_SUCESS = "A password has been sent to your e-mail address.";
  public const string PROJECT_DELETE = "Record can not be deleted because related record exist.";
  public const string MODULE_DELETE = "Record can not be deleted because related record exist.";
  public const string TIME_DELETE = "Record can not be deleted because related record exist.";
  public const string USER_DELETE = "Record can not be deleted because related record exist.";
  public const string SELECT_PROJECT = "No matching project found!";
  public const string SELECT_MODULE = "No matching task found!";
  public const string OLD_PASSWORD = "Entered old password is wrong. Please try again.";
  public const string DUP_ModuleName = "Entered task is already exist for this project.";
  public const string SELECT_EXPORT = "Please select either user or project to export time sheet.";
  public const string SELECT_TIME_DETAIL = "Please select either user or project to view time sheet detail.";
  public const string SELECT_PROJECT_MODULE = "Please select project to view time sheet detail.";
  public const string SELECT_REPORT_USER = "Please select  user to view time sheet detail.";
}
