using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;
using System.Data;
using System.Data.Common;
using NarolaInfotech.Data;
using NarolaInfotech.Utility;
namespace TimeSheet
{
  public class Admin
  {

   DbFunctions dbF = new DbFunctions();
      

    #region Properties
    /// <summary>
    /// Get - Set Properties. 
    /// </summary>
    private string f_szUserName;
    public string szUserName
    {
      get { return f_szUserName; }
      set { f_szUserName = value; }
    }

    private string f_szPassword;
    public string szPassword
    {
      get { return f_szPassword; }
      set { f_szPassword = value; }
    }

    private String m_ErrorMessage;
    public String ErrorMessage
    {
      get { return m_ErrorMessage; }
    }
    #endregion

    //=========================================================================================================================
    //                                                              Fetch Data Block
    //=========================================================================================================================
    #region Load
    public DataSet Load()
    {
      
      	
      DataSet loDataSet = null;

      loDataSet = dbF.Load();

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }
    #endregion

    #region LoadById
    public int LoadById()
    {
      DataSet loDataSet = null;
      try
      {
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        string sqlCommand = "sp_Admin_SelectRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        //Add Parameter.
        db.AddInParameter(dbCommand, "szUserName", DbType.String, this.szUserName);

        loDataSet = db.ExecuteDataSet(dbCommand);

        if (clsFunctions.GetRowCountOfDataSet(loDataSet, 0) == 0) return (int)clsMessage.RETURN_STATUS.NOT_OK;
        Init(loDataSet);
        return (int)clsMessage.RETURN_STATUS.OK;
      }
      catch (Exception ex)
      {
        this.m_ErrorMessage = ex.Message;
        return (int)clsMessage.RETURN_STATUS.NOT_OK;
      }
    }
    #endregion

    #region Login
    public bool Login()
    {       

        if(dbF.AuthenticateUser(f_szUserName,f_szPassword))
          return true;
        else
        return false;

    }
    #endregion

    #region Init
    /// <summary>
    /// Initialization
    /// </summary>
    /// <param name="ds"></param>
    private void Init(DataSet ds)
    {
      this.szUserName = Convert.ToString(clsFunctions.GetDataSetValue(ds, 0, "szUserName", string.Empty));
      this.szPassword = clsSecure.DecryptText(Convert.ToString(clsFunctions.GetDataSetValue(ds, 0, "szPassword", string.Empty)));
    }
    #endregion  

    #region GetTimeSheetByUserwise
    public DataSet GetTimeSheetByUserwise(DateTime dtStartDate, DateTime dtEndDate, int lnUserID)
    {
       DataSet loDataSet = null;
       loDataSet = dbF.GetTimeSheetByUserwise(dtStartDate, dtEndDate, lnUserID);
      // Note: connection was closed by ExecuteDataSet method call 
       return loDataSet;
    }
    #endregion

    #region GetTimeSheetByProjectwise
    public DataSet GetTimeSheetByProjectwise(DateTime dtStartDate, DateTime dtEndDate, int lnProjectID )
    {
     
      // DataSet that will hold the returned results		
      DataSet loDataSet = null;
      loDataSet = dbF.GetTimeSheetByProjectwise(dtStartDate, dtEndDate, lnProjectID);
      // Note: connection was closed by ExecuteDataSet method call 
      return loDataSet;
    }


    public DataSet GetTimeSheetByProjectwise_Without_module(DateTime dtStartDate, DateTime dtEndDate, int lnProjectID ,  int moduleid)
    {
        
        // DataSet that will hold the returned results		
        DataSet loDataSet = null;
        loDataSet = dbF.GetTimeSheetByProjectwise_Without_module(dtStartDate, dtEndDate, lnProjectID, moduleid);

        // Note: connection was closed by ExecuteDataSet method call 

        return loDataSet;
    }



    #endregion

    #region GetTimeSheetByProject_USERwise
    public DataSet GetTimeSheetByProject_USERwise(DateTime dtStartDate, 
                                                  DateTime dtEndDate,
                                                  int lnProjectID,
                                                  int lnUserID)
    {
      	
      DataSet loDataSet = null;

      loDataSet = dbF.GetTimeSheetByProject_USERwise(dtStartDate, dtEndDate, lnProjectID, lnUserID);

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }
    #endregion

    #region GetUserEfficacyReoprt
    public DataSet GetUserEfficacyReoprt(DateTime dtStartDate,
                                        DateTime dtEndDate,
                                        int lnUserID)
    {
     
      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = dbF.GetUserEfficacyReoprt(dtStartDate, dtEndDate, lnUserID);

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }
    #endregion

    #region GetUserProjectReport
    public DataSet GetUserProjectReport(DateTime dtStartDate,
                                        DateTime dtEndDate,
                                        int lnUserID)
    {
      	
      DataSet loDataSet = null;
      loDataSet = dbF.GetUserProjectReport(dtStartDate, dtEndDate, lnUserID);
      // Note: connection was closed by ExecuteDataSet method call 
      return loDataSet;
    }
    #endregion

    #region GetProjectUserwise
    public DataSet GetProjectUserwise(DateTime dtStartDate,
                                        DateTime dtEndDate,
                                        int lnProjectID)
    {
      
      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = dbF.GetProjectUserwise(dtStartDate, dtEndDate, lnProjectID);

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }
    #endregion

    #region GetProjectModulewiseReport
    public DataSet GetProjectModulewiseReport(DateTime dtStartDate,
                                              DateTime dtEndDate,
                                              int lnProjectID)
    {    

      // DataSet that will hold the returned results		
      DataSet loDataSet = null;
      loDataSet = dbF.GetProjectModulewiseReport(dtStartDate, dtEndDate, lnProjectID);
      // Note: connection was closed by ExecuteDataSet method call 
      return loDataSet;
    }
    #endregion

    //============================================================End - Fetch Data Block=======================================




    //=========================================================================================================================
    //                                                            Modification Data Block
    //=========================================================================================================================

    #region Insert Operation

    /// <summary>
    /// Inser Into Customer Table.
    /// </summary>
    /// <returns>1/0</returns>
    public int Insert()
    {
      try
      {       
        return dbF.Insert(this.f_szUserName,this.f_szPassword);           
      }
      catch (Exception ex)
      {
        m_ErrorMessage = ex.Message;
        return (int)clsMessage.RETURN_STATUS.NOT_OK;
      }
    }

    #endregion

    #region Update Operation

    /// <summary>
    /// Inser Into Customer Table .
    /// </summary>
    /// <returns>1/0</returns>
    public int Update()
    {
      try
      {
          return dbF.Update(this.f_szUserName, this.f_szPassword);
      }
      catch (Exception ex)
      {
        m_ErrorMessage = ex.Message;
        return (int)clsMessage.RETURN_STATUS.NOT_OK;
      }
    }

    #endregion

    #region Delete Operation

    /// <summary>
    /// Delete From Customer Table.
    /// </summary>
    /// <returns>1/0</returns>
    public string Delete()
    {
      string lsMessage = string.Empty;
      try
      {
          return dbF.Delete(this.f_szUserName);
      }
      catch (Exception ex)
      {
        lsMessage = ex.Message;
        return lsMessage;
      }
    }

    #endregion

    #region ChangePassword

    /// <summary>
    /// Inser Into Customer Table .
    /// </summary>
    /// <returns>1/0</returns>
    public int ChangePassword()
    {
      try
      {
          return dbF.ChangePassword(this.f_szUserName, this.f_szPassword);
      }
      catch (Exception ex)
      {
        m_ErrorMessage = ex.Message;
        return (int)clsMessage.RETURN_STATUS.NOT_OK;
      }
    }

    #endregion

    //=========================================================End - Modification Data Block===================================








    //===nmAddressBookID======================================================================================================================
    //                                                            Implementation Logic Block
    //=========================================================================================================================

    //=========================================================End - Implementation Logic Block================================

    public string Decrypt(string cipherString, bool useHashing)
    {
      byte[] keyArray;
      byte[] toEncryptArray = Convert.FromBase64String(cipherString);

      System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
      //Get your key from config file to open the lock!
      //   string key = (string)settingsReader.GetValue("SecurityKey", typeof(String));

      if (useHashing)
      {
        MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
        keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes("!@#$%^*()"));
        hashmd5.Clear();
      }
      else
        keyArray = UTF8Encoding.UTF8.GetBytes("!@#$%^*()");

      TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
      tdes.Key = keyArray;
      tdes.Mode = CipherMode.ECB;
      tdes.Padding = PaddingMode.PKCS7;

      ICryptoTransform cTransform = tdes.CreateDecryptor();
      byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);

      tdes.Clear();
      return UTF8Encoding.UTF8.GetString(resultArray);
    }
    
  }
}
