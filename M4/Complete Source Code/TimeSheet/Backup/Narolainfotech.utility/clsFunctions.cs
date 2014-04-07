using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Web.Mail;
using System.Security;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;



namespace NarolaInfotech.Utility
{
    public static class clsFunctions
    {
        public const string ZLS = "";


        private static string m_ErrorMessage;

        #region ErrorMessage
        public static string ErrorMessage
        {
            get { return m_ErrorMessage; }
        }
        #endregion

        #region sendMail
        /// <summary>
        /// Method to use to Send an email Message.
        /// </summary>
        /// <param name="fsTo">To List of Sending Mail.</param>
        /// <param name="fsCc">CC List of Sending Mail.</param>
        /// <param name="fsBcc">BCC List of Sending Mail.</param>
        /// <param name="fsSubject">Subject of Sending Mail.</param>
        /// <param name="fsMessage">Message of Sending Mail</param>
        /// <param name="fsUsername">Username of SMTP server of Sending Mail.</param>
        /// <param name="fsPasswrod">Password of SMTP server of Sending Mail.</param>
        /// <param name="fsSmtpServer">Name  of SMTP server of Sending Mail.</param>
        public static void sendMail(string fsTo,
                                    string fsCc,
                                    string fsBcc,
                                    string fsSubject,
                                    string fsMessage,
                                    string fsUsername,
                                    string fsPasswrod,
                                    string fsSmtpServer,
                                    int fiPortNumber)
        {
            try
            {
                int cdoBasic = 0;
                int cdoSendUsingPort = 1;
                string lsUserName = fsUsername;
                string lsPassWord = fsPasswrod;
                string lsSmtpServer = fsSmtpServer;
                string lsHtmlData = fsMessage;

                MailMessage loMailData = new MailMessage();
                loMailData.BodyFormat = MailFormat.Text;
                loMailData.Subject = fsSubject;
                loMailData.From = lsUserName;
                loMailData.Priority = MailPriority.High;
                loMailData.To = fsTo;
                loMailData.Cc = fsCc;
                loMailData.Bcc = fsBcc;

                loMailData.Body = lsHtmlData;
                loMailData.BodyFormat = MailFormat.Html;

                loMailData.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", cdoBasic);
                loMailData.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", lsUserName);
                loMailData.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", lsPassWord);
                loMailData.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", cdoSendUsingPort);
                loMailData.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserver", lsSmtpServer);
                loMailData.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout", 10);
                loMailData.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", fiPortNumber);
                loMailData.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", true);

                SmtpMail.SmtpServer = lsSmtpServer;
                try
                {
                    SmtpMail.Send(loMailData);
                }
                catch (Exception ex)
                {
                }
            }
            catch (Exception foException)
            {
                throw foException;
            }
        }
        #endregion

        #region GetRowCountOfDataSet
        /// <summary>
        ///  Method to Count number of Row in Specify Dataset.
        /// </summary>
        /// <param name="foDataset">DataSet of Data.</param>
        /// <param name="fiTableNumber">TableNumber of Dataset.</param>
        /// <returns>Number of Row of DataSet</returns>
        public static int GetRowCountOfDataSet(DataSet foDataset, int fiTableNumber)
        {
            try
            {
                if (foDataset.Tables.Count > 0)
                    return foDataset.Tables[fiTableNumber].Rows.Count;
                else
                    return 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Cannot read RowCount, " + ex.Message);
            }
        }
        #endregion

        #region GetDataSetValue

        #region GetDataSetValue
        /// <summary>
        /// Method to Return Value of Dataset.
        /// </summary>
        /// <param name="foDataSet">Specify DataSet by which get Value.</param>
        /// <param name="liTableIndex">Specify Table Index of DataSet by which get Value.</param>
        /// <param name="FieldName"></param>
        /// <returns></returns>
        public static object GetDataSetValue(DataSet foDataSet, int liTableIndex, string FieldName)
        {
            // function checks for null status of vItem
            // if it is null vItem is replaced with vAlternative
            try
            {
                return foDataSet.Tables[liTableIndex].Rows[0][FieldName];
            }
            catch (Exception ex)
            {
                m_ErrorMessage = ex.Message;
                throw new Exception("Cannot read from Dataset, " + m_ErrorMessage);
            }
        }
        #endregion

        #region GetDataSetValue
        /// <summary>
        /// Method to Return Value of Dataset.
        /// </summary>
        /// <param name="foDataSet">Specify DataSet by which get Value.</param>
        /// <param name="fiRow">Specify Row by which get Value.</param>
        /// <param name="fsFieldName">Specify Field Name by which get Value.</param>
        /// <param name="foAlternativeValueIfNull">Specirfy AlterNave Value.</param>
        /// <returns></returns>
        public static object GetDataSetValue(DataSet foDataSet, int fiRow, string fsFieldName, object foAlternativeValueIfNull)
        {
            // function checks for null status of FieldName, if it is null, it is replaced with AlternativeValueIfNull
            try
            {
                object objValue = foDataSet.Tables[0].Rows[fiRow][fsFieldName];
                return (objValue == DBNull.Value) ? foAlternativeValueIfNull : objValue;
            }
            catch (Exception ex)
            {
                m_ErrorMessage = ex.Message;
                throw new Exception("Cannot read from Dataset, " + m_ErrorMessage);
            }
        }
        #endregion

        #endregion

        #region ThumbnailCallback
        public static bool ThumbnailCallback()
        {
            return true;
        }
        #endregion

        #region ThumbnailImage
        /// <summary>
        /// Method to Use ot Create Small Image.
        /// </summary>
        /// <param name="FileName">Name of Image by which small Image Created.</param>
        /// <param name="Width">Width of small image.</param>
        /// <param name="Height">Height of small image.</param>
        /// <param name="SaveFileName">Name of small file.</param>
        public static void ThumbnailImage(string FileName, int Width, int Height, string SaveFileName)
        {
            // create an image object, using the filename we just retrieved
            System.Drawing.Image image = System.Drawing.Image.FromFile(FileName);

            // create the actual thumbnail image
            System.Drawing.Image thumbnailImage = image.GetThumbnailImage(Width, Height, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);

            //remove existing if file exist
            if (System.IO.File.Exists(SaveFileName))
            {
                System.IO.File.Delete(SaveFileName);
            }

            // put the image into the memory stream
            thumbnailImage.Save(SaveFileName, System.Drawing.Imaging.ImageFormat.Jpeg);
        }
        #endregion

        #region GetTableValue
        /// <summary>
        /// Method To Get Value From Specify Table.
        /// </summary>
        /// <param name="foTable">DataTable of Table by which we can Get Value.</param>
        /// <param name="fiIndex">Index of Specify Table.</param>
        /// <param name="fsFieldName">Specify FieldName of Specify Table.</param>
        /// <param name="foAlternativeValueIfNull">Alternative Value of Specify Table.</param>
        /// <returns></returns>
        public static object GetTableValue(DataTable foTable, int fiIndex, string fsFieldName, object foAlternativeValueIfNull)
        {
            object objValue = foTable.Rows[fiIndex][fsFieldName];
            return (objValue == DBNull.Value) ? foAlternativeValueIfNull : objValue;
        }
        #endregion

        #region GetViewValue
        /// <summary>
        /// Method To Get Value From Specify Data View.
        /// </summary>
        /// <param name="foView">DataView by which we can get Value.</param>
        /// <param name="fiRowIndex">Row Index of Specify DataView.</param>
        /// <param name="fsFieldName">Field Name of Specify DataView.</param>
        /// <param name="foAlternativeValueIfNull">Alternative Value of of Specify DataView.</param>
        /// <returns></returns>
        public static object GetViewValue(DataView foView, int fiRowIndex, string fsFieldName, object foAlternativeValueIfNull)
        {
            object objValue = foView[fiRowIndex].Row[fsFieldName];
            return (objValue == DBNull.Value) ? foAlternativeValueIfNull : objValue;
        }
        #endregion

        #region getIFrame
        /// <summary>
        /// Method To Return IFrame.
        /// </summary>
        /// <param name="stUrl">URL of Current IFrame</param>
        /// <returns></returns>
        public static String getIFrame(String stUrl)
        {
            return @"<iframe src='" + stUrl + "' style='overflow:visible; width:100%;'  height='100%' width='100%' frameborder='0'  scrolling='no' ></iframe>";

        }
        #endregion

        #region copyDirectory
        /// <summary>
        ///  Method to Copy Directory with Specify Path.
        /// </summary>
        /// <param name="fsSourcePath">Source Path By which Directory is Copy.</param>
        /// <param name="fsDestinationPath">Destination Patho in which Dicrectory is Copy.</param>
        public static void CopyDirectory(string fsSourcePath, string fsDestinationPath)
        {
            String[] Files;

            if (fsDestinationPath[fsDestinationPath.Length - 1] != Path.DirectorySeparatorChar)
                fsDestinationPath += Path.DirectorySeparatorChar;
            if (!Directory.Exists(fsDestinationPath)) Directory.CreateDirectory(fsDestinationPath);
            Files = Directory.GetFileSystemEntries(fsSourcePath);
            foreach (string Element in Files)
            {
                // Sub directories
                if (Directory.Exists(Element))
                    CopyDirectory(Element, fsDestinationPath + Path.GetFileName(Element));
                // Files in directory
                else
                    File.Copy(Element, fsDestinationPath + Path.GetFileName(Element), true);
            }
        }
        #endregion

        #region searchResourceFile
        /// <summary>
        /// Method to Search Any File in Specify Directory  Path.
        /// </summary>
        /// <param name="fsiSearchPath">Path of Specify Directory.</param>
        /// <param name="fiRecursionLevel">Reccursion Level.</param>
        public static void searchResourceFile(String fsiSearchPath, int fiRecursionLevel)
        {

            DirectoryInfo ThisLevel = new DirectoryInfo(fsiSearchPath);
            DirectoryInfo[] ChildLevel = ThisLevel.GetDirectories();

            if (fiRecursionLevel != 1)
            {
                foreach (DirectoryInfo Child in ChildLevel)
                {

                    searchResourceFile(Child.FullName, fiRecursionLevel - 1);
                }
            }
            FileInfo[] ChildFiles = ThisLevel.GetFiles("*.aspx.resx");
            foreach (FileInfo ChildFile in ChildFiles)
            {
                //readWriteResourceFile(ChildFile.FullName);

            }
        }
        #endregion

        #region GetFileText
        /// <summary>
        /// Method to Read Text For Specify File Path.
        /// </summary>
        /// <param name="fsvirtualPath">Path of Specify path.</param>
        /// <returns></returns>
        public static string GetFileText(string fsvirtualPath)
        {
            //Read from file
            StreamReader sr = null;
            try
            {
                sr = new StreamReader(System.Web.HttpContext.Current.Server.MapPath(fsvirtualPath));
            }
            catch
            {
                sr = new StreamReader(fsvirtualPath);

            }
            string strOut = sr.ReadToEnd();
            sr.Close();
            return strOut;
        }
        #endregion

        #region UpdateFileText
        /// <summary>
        /// Updates the text in a file with the passed in values
        /// </summary>
        /// <param name="fsAbsoluteFilePath"></param>
        /// <param name="fsLookFor"></param>
        /// <param name="fsReplaceWith"></param>
        public static void UpdateFileText(string fsAbsoluteFilePath, string fsLookFor, string fsReplaceWith)
        {
            string sIn = GetFileText(fsAbsoluteFilePath);
            string sOut = sIn.Replace(fsLookFor, fsReplaceWith);
            WriteToFile(fsAbsoluteFilePath, sOut);
        }
        #endregion

        #region WriteToFile
        /// <summary>
        /// Writes out a file
        /// </summary>
        /// <param name="fsAbsoluteFilePath"></param>
        /// <param name="fsfileText"></param>
        public static void WriteToFile(string fsAbsoluteFilePath, string fsfileText)
        {
            StreamWriter sw = new StreamWriter(fsAbsoluteFilePath, false);
            sw.Write(fsfileText);
            sw.Close();
        }
        #endregion

        #region GetSiteRoot
        /// <summary>
        /// Method to Get Current Site Root.
        /// </summary>
        /// <returns></returns>
        public static string GetSiteRoot()
        {
            string Port = System.Web.HttpContext.Current.Request.ServerVariables["SERVER_PORT"];
            if (Port == null || Port == "80" || Port == "443")
                Port = "";
            else
                Port = ":" + Port;

            string Protocol = System.Web.HttpContext.Current.Request.ServerVariables["SERVER_PORT_SECURE"];
            if (Protocol == null || Protocol == "0")
                Protocol = "http://";
            else
                Protocol = "https://";

            string appPath = System.Web.HttpContext.Current.Request.ApplicationPath;
            if (appPath == "/")
                appPath = "";

            string sOut = Protocol + System.Web.HttpContext.Current.Request.ServerVariables["SERVER_NAME"] + Port + appPath;
            return sOut;
        }
        #endregion

        #region GetSiteRootAfter
        /// <summary>
        /// Method to Return Url of After Root.
        /// </summary>
        /// <returns></returns>
        public static string GetSiteRootAfter()
        {
            string Port = System.Web.HttpContext.Current.Request.ServerVariables["SERVER_PORT"];
            if (Port == null || Port == "80" || Port == "443")
                Port = "";
            else
                Port = ":" + Port;

            string Protocol = System.Web.HttpContext.Current.Request.ServerVariables["SERVER_PORT_SECURE"];
            if (Protocol == null || Protocol == "0")
                Protocol = "http://";
            else
                Protocol = "https://";

            string appPath = System.Web.HttpContext.Current.Request.ApplicationPath;
            if (appPath == "/")
                appPath = "?Pay=yes";

            string sOut = Protocol + System.Web.HttpContext.Current.Request.ServerVariables["SERVER_NAME"] + Port + appPath;
            return sOut;
        }
        #endregion

        #region GetParameter
        public static string GetParameter(string sParam)
        {
            if (System.Web.HttpContext.Current.Request.QueryString[sParam] != null)
            {
                return System.Web.HttpContext.Current.Request[sParam].ToString();
            }
            else
            {
                return "";
            }
        }
        #endregion

        #region SetParameter
        //foId == pass the parameter name which you want to add
        //foIdValue =pass the value of the parameter 
        public static string SetParameter(string sParam, string sParamValue)
        {
            //sParam == pass the parameter name which you want to add
            //sParamValue =pass the value of the parameter 
            String moValue = string.Empty;
            String QueryString = System.Web.HttpContext.Current.Request.QueryString.ToString();
            string Result;
            if (clsFunctions.GetParameter(sParam) != "")
            {
                moValue = GetParameter(sParam.ToString()) + " ";
                Result = QueryString.Replace(moValue.Trim(), sParamValue.Trim());
            }
            else
            {
                Result = QueryString + "&" + sParam + "=" + sParamValue;
            }
            return Result;
        }

        //to set multiple parameters
        public static string SetParameter(String[] sParam, String[] sParamValue)
        {
            //sParam == pass the parameter name which you want to add
            //sParamValue =pass the value of the parameter 
            String moValue = string.Empty;
            String QueryString = System.Web.HttpContext.Current.Request.QueryString.ToString();
            string Result = string.Empty; ;
            for (int i = 0; i < sParam.Length; i++)
            {
                if (clsFunctions.GetParameter(sParam[i]) != "")
                {
                    moValue = GetParameter(sParam[i].ToString()) + " ";
                    Result = QueryString = QueryString.Replace(moValue.Trim(), sParamValue[i].Trim());
                }
                else
                {
                    Result = QueryString = QueryString + "&" + sParam[i] + "=" + sParamValue[i];
                }
            }
            return Result;
        }
        public static string SetParameter(string sQueryString, String sParam, String sParamValue)
        {
            //sQueryString == pass the query string to set param
            //sParam == pass the parameter name which you want to add
            //sParamValue =pass the value of the parameter 
            String moValue = string.Empty;
            string Result = string.Empty; ;
             if (clsFunctions.GetParameter(sParam) != "")
                {
                    moValue = GetParameter(sParam.ToString()) + " ";
                    Result = sQueryString.Replace(moValue.Trim(), sParamValue.Trim());
                }
                else
                {
                    Result = sQueryString + "&" + sParam + "=" + sParamValue;
                }
            
            return Result;
        }
        public static string SetParameter(string sQueryString,String[] sParam, String[] sParamValue)
        {
            //sQueryString == pass the query string to set param
            //sParam == pass the parameter name which you want to add
            //sParamValue =pass the value of the parameter 
            String moValue = string.Empty;
            string Result = string.Empty; ;
            for (int i = 0; i < sParam.Length; i++)
            {
                if (clsFunctions.GetParameter(sParam[i]) != "")
                {
                    moValue = GetParameter(sParam[i].ToString()) + " ";
                    Result = sQueryString = sQueryString.Replace(moValue.Trim(), sParamValue[i].Trim());
                }
                else
                {
                    Result = sQueryString = sQueryString + "&" + sParam[i] + "=" + sParamValue[i];
                }
            }
            return Result;
        }
        #endregion

        #region RemoveParameter
        public static string RemoveParameter(string foParam)
        {
            String[] parameters = System.Web.HttpContext.Current.Request.QueryString.ToString().Split('&');
            String result = "";
            for (int i = 0; i < parameters.Length; i++)
            {
                if (parameters[i].Substring(0, parameters[i].IndexOf("=")) != foParam)
                {
                    result += parameters[i] + "&";
                }
            }
            return result.TrimEnd('&'); ;
        }
        public static string RemoveParameter(string sQueryString, string foParam)
        {
            String[] parameters = sQueryString.Split('&');
            String result = "";
            for (int i = 0; i < parameters.Length; i++)
            {
                if (parameters[i].Substring(0, parameters[i].IndexOf("=")) != foParam)
                {
                    result += parameters[i] + "&";
                }
            }
            return result.TrimEnd('&'); ;
        }
        #endregion

        #region GetIntParameter
        public static int GetIntParameter(string sParam)
        {
            int iOut = 0;
            if (System.Web.HttpContext.Current.Request.QueryString[sParam] != null)
            {
                string sOut = System.Web.HttpContext.Current.Request[sParam].ToString();
                if (!String.IsNullOrEmpty(sOut))
                    int.TryParse(sOut, out iOut);
            }
            return iOut;
        }
        #endregion

        #region IsNumeric
        public static bool IsNumeric(string Argument)
        {
            try
            {
                double tmp = Convert.ToDouble(Argument);
                return true;
            }
            catch
            { return false; }
        }
        #endregion

        #region getRandomNumber
        /// <summary>
        ///  Method to return a random integer
        /// </summary>
        /// <returns>Number of RandomNumber</returns>
        public static int getRandomNumber()
        {
            try
            {
                Random autoRand = new Random();
                return autoRand.Next(int.MaxValue);
            }
            catch (Exception ex)
            {
                m_ErrorMessage = ex.Message;
                throw new Exception("Error creating Random Integer " + m_ErrorMessage);
            }
        }
        #endregion

        //###########################  STRING FUNCTION #######################

        #region String Function

        #region TrimLower
        public static string TrimLower(string Argument)
        {
            return Argument.Trim().ToLower();
        }
        #endregion

        #region TrimUpper
        public static string TrimUpper(string Argument)
        {
            return Argument.Trim().ToUpper();
        }
        #endregion

        #endregion

        //###########################  CONVERTER FUNCTION ####################

        #region Converter Function

        #region ParseInteger
        public static object ParseInteger(string fsArgument)
        {
            try
            {
                int Result = Convert.ToInt32(fsArgument);
                return Result;
            }
            catch
            { return null; }
        }
        #endregion

        #region ParseLong
        public static object ParseLong(string fsArgument)
        {
            try
            {
                long Result = Convert.ToInt64(fsArgument);
                return Result;
            }
            catch
            { return null; }
        }
        #endregion

        #region ParseSingle
        public static object ParseSingle(string fsArgument)
        {
            try
            {
                float Result = Convert.ToSingle(fsArgument);
                return Result;
            }
            catch
            { return null; }
        }
        #endregion

        #region ParseDouble
        public static object ParseDouble(string fsArgument)
        {
            try
            {
                double Result = Convert.ToDouble(fsArgument);
                return Result;
            }
            catch
            { return null; }
        }
        #endregion

        #region ParseCurrency
        public static object ParseCurrency(string fsArgument)
        {
            return ParseDouble(fsArgument);
        }
        #endregion

        #region ParseDate
        public static object ParseDate(string fsDD_MMM_YYYY_Date)	//Argument should be in DD-MMM-YYYY date format
        {
            try
            {
                DateTime objDateTime = Convert.ToDateTime(fsDD_MMM_YYYY_Date);
                return objDateTime;
            }
            catch
            { return null; }
        }
        #endregion

        #region ParseBoolean
        public static object ParseBoolean(string fsArgument)
        {
            try
            {
                bool Result = Convert.ToBoolean(fsArgument);
                return Result;
            }
            catch
            { return null; }
        }
        #endregion

        #region getDateFormat
        public static string getDateFormat(DateTime foDate)
        {
            return foDate.ToString("dd/MM/yyyy");
        }
        #endregion

        #region Int2Bool
        public static bool Int2Bool(int fiFlag)
        {
            return (fiFlag == 0) ? false : true;
        }
        #endregion

        #region BoolToInt
        public static int BoolToInt(bool fiFlag)
        {
            return (fiFlag) ? 1 : 0;
        }
        #endregion

        #region StrToGuid
        public static Guid StrToGuid(string fsValue)
        {
            Guid loGuid = Guid.Empty;
            try
            {
                loGuid = new Guid(fsValue);
            }
            catch (Exception ex)
            {
                return loGuid;
            }
            return loGuid;
        }
        #endregion

        #region GuidToStr
        public static string GuidToStr(Guid foGuid)
        {
            string loValue = string.Empty;
            try
            {
                loValue = foGuid.ToString();
            }
            catch (Exception ex)
            {
                return loValue;
            }
            return loValue;
        }
        #endregion

        #region StrToBool
        public static bool StrToBool(string lsValue)
        {
            bool loValue = false;
            if (lsValue.Equals("1"))
            {
                loValue = true;
            }
            else
            {
                loValue = false;
            }
            return loValue;
        }
        #endregion

        #region BoolToStr
        public static string BoolToStr(bool lbValue)
        {
            string lsValue = string.Empty;
            if (lbValue == true)
            {
                lsValue = "1";
            }
            else
            {
                lsValue = "0";
            }
            return lsValue;
        }
        #endregion

        #region ToDecimal
        public static decimal ToDecimal(object Argument)
        {
            if (Argument == null) return 0;
            try
            { return Convert.ToDecimal(Argument); }
            catch
            { return 0; }
        }
        #endregion

        #region ToDecimal
        public static decimal ToDecimal(string Argument)
        {
            if (Argument == null) return 0;
            try
            { return Convert.ToDecimal(Argument); }
            catch
            { return 0; }
        }
        #endregion

        #region ToBoolean
        public static bool ToBoolean(object Argument)
        {
            if (Argument == null) return false;
            try
            { return Convert.ToBoolean(Argument); }
            catch
            { return false; }
        }
        #endregion

        #region ToBoolean
        public static bool ToBoolean(int Argument)
        {
            try
            { return Convert.ToBoolean(Argument); }
            catch
            { return false; }
        }
        #endregion

        #region ToInteger
        public static int ToInteger(string Argument)
        {
            if (Argument == null) return 0;
            try
            { return Convert.ToInt32(Argument); }
            catch
            { return 0; }
        }
        #endregion

        #region ToInteger
        public static int ToInteger(object Argument)
        {
            if (Argument == null) return 0;
            try
            { return Convert.ToInt32(Argument); }
            catch
            { return 0; }
        }
        #endregion

        #region ToInteger
        public static Int64 ToInt64(string Argument)
        {
          if (Argument == null) return 0;
          try
          { return Int64.Parse(Argument); }
          catch
          { return 0; }
        }
        #endregion

        #region ToInteger
        public static Int64 ToInt64(object Argument)
        {
          if (Argument == null) return 0;
          try
          { return Int64.Parse(Argument.ToString()); }
          catch
          { return 0; }
        }
        #endregion

        #region ToDouble
        public static double ToDouble(string Argument)
        {
            if (Argument == null) return 0;
            try
            { return Convert.ToDouble(Argument); }
            catch
            { return 0; }
        }
        #endregion

        #region ToDouble
        public static double ToDouble(object Argument)
        {
            if (Argument == null) return 0;
            try
            { return Convert.ToDouble(Argument); }
            catch
            { return 0; }
        }
        #endregion

        #region ToString
        public static string ToString(string Argument)
        {
            return (Argument == null) ? ZLS : Argument.Trim();
        }
        #endregion

        #region ToString
        public static string ToString(object Argument)
        {
            return (Argument == null) ? ZLS : Argument.ToString().Trim();
        }
        #endregion


        #region Convert Html To Simple Text
        public static String htmlToText(String HTML)
        {
            // Removes tags from passed HTML            
            System.Text.RegularExpressions.Regex objRegEx = new System.Text.RegularExpressions.Regex("<[^>]*>");
            return objRegEx.Replace(HTML, "");
        }
        #endregion

        #endregion


        #region enableDisable
        /// <summary>
        /// 
        /// </summary>
        /// <param name="pblIsEnable"></param>
        /// <param name="pImgBtn"></param>
        public static void enableDisable(Boolean pblIsEnable, params ImageButton[] pImgBtn)
        {
            foreach (ImageButton button in pImgBtn)
            {
                if (pblIsEnable)
                {
                    if (!button.Enabled)
                    {
                        button.ImageUrl = button.ImageUrl.Replace("_d.png", ".png");
                        button.Enabled = true;
                    }
                }
                else
                {
                    if (button.Enabled)
                    {
                        button.ImageUrl = button.ImageUrl.Replace(".png", "_d.png");
                        button.Enabled = false;
                    }
                }
            }

        }
        #endregion

        #region setMessage
        /// <summary>
        /// Author : kuldeep D. shah 
        /// Created :1 - 10 -2008
        /// Message Code : Add,Edit,Delete,Fail
        /// </summary>
        /// <param name="plblErrorMessage"></param>
        /// <param name="fstFor"></param>
        public static void setMessage(Label plblErrorMessage, String fstFor)
        {
            switch (fstFor)
            {
                case "Add":
                    plblErrorMessage.Text = "<div width=\"100%\" style=\"" + getCSS("successmsg") + "\">Record Added Successfully !</div>";
                    break;
                case "Edit":
                    plblErrorMessage.Text = "<div width=\"100%\" style=\"" + getCSS("successmsg") + "\">Record Updated Successfully !</div>";
                    break;
                case "Delete":
                    plblErrorMessage.Text = "<div width=\"100%\" style=\"" + getCSS("successmsg") + "\">Record Deleted Successfully !</div>";
                    break;
                case "Fail":
                    plblErrorMessage.Text = "<div width=\"100%\" style=\"" + getCSS("errormsg") + "\">Operation Failed !</div>";
                    break;
                default:
                    plblErrorMessage.Text = "";
                    break;
            }

        }
        #endregion

        #region getMessageFormat
        /// <summary>
        /// Author : kuldeep D. shah 
        /// Created :1 - 10 -2008
        /// Return Message Format
        /// </summary>
        /// <param name="plblErrorMessage"></param>
        /// <param name="pstMessage"></param>
        /// <param name="pblIsError"></param>
        public static void getMessageFormat(Label plblErrorMessage, String pstMessage, Boolean pblIsError)
        {
            if (pblIsError)
                plblErrorMessage.Text = "<div width=\"100%\" style=\"" + getCSS("errormsg") + "\">" + pstMessage + "</div>";
            else
                plblErrorMessage.Text = "<div width=\"100%\" style=\"" + getCSS("successmsg") + "\">" + pstMessage + "</div>";
        }


        #endregion

        #region getCss
        /// <summary>
        /// Author : kuldeep D. shah 
        /// Created :1 - 10 -2008
        /// </summary>
        /// <param name="pstCssClass"></param>
        /// <returns></returns>
        public static String getCSS(String pstCssClass)
        {
            switch (pstCssClass)
            {
                case "errormsg":
                    return "background-color: rgb(204, 0, 0); text-align: center; font-size: 12px; font-weight: bold; line-height: 30px; color: rgb(255, 255, 255);";
                    break;
                case "successmsg":
                    return "background-color: #A5CD39; text-align: center; font-size: 12px; font-weight: bold; line-height: 30px; color: rgb(255, 255, 255);";
                    break;
                default:
                    return "";
                    break;
            }
        }
        #endregion

    }
}

