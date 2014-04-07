using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;
using System.Data;
using System.Data.Common;
using NarolaInfotech.Data;
using NarolaInfotech.Utility;
using System.Reflection;
namespace TimeSheet
{
  public class Admin
  {
      
     
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
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "sp_Admin_SelectAll";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.ExecuteDataSet(dbCommand);

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
        DataSet loDataSet = null;
        try
        {
            // default database service is determined through configuration.
            Database db = DatabaseFactory.CreateDatabase();

            string sqlCommand = "sp_Admin_Login";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
            //Add Parameter.
            db.AddInParameter(dbCommand, "szUserName", DbType.String, this.szUserName);
            db.AddInParameter(dbCommand, "szPassword", DbType.String, clsSecure.EncryptText(this.szPassword));

            //DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_Admin_Login(this.szUserName,clsSecure.EncryptText(this.szPassword)));
            loDataSet = db.ExecuteDataSet(dbCommand);

            if (clsFunctions.GetRowCountOfDataSet(loDataSet, 0) == 0) return false;

            return true;
        }
        catch (Exception ex)
        {
            this.m_ErrorMessage = ex.Message;
            return false;
        }
    }
    
    #endregion

    public DbCommand getDatabaseObject(string sqlCommand)
      {
          Database db = DatabaseFactory.CreateDatabase();
          DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);


          return dbCommand;
      }

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
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "GetTimeSheetByUserwise";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
      db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, dtStartDate);
      db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);
      db.AddInParameter(dbCommand, "UserID", DbType.Int32, lnUserID);
      //DbCommand dbCommand = db.GetSqlStringCommand(Queries.GetTimeSheetByUserwise(dtStartDate, dtStartDate, lnUserID));
      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.ExecuteDataSet(dbCommand);

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }
    #endregion

    #region GetTimeSheetByProjectwise
    public DataSet GetTimeSheetByProjectwise(DateTime dtStartDate, DateTime dtEndDate, int lnProjectID )
    {
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "GetTimeSheetByProjectwise";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
      db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, dtStartDate);
      db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);
      db.AddInParameter(dbCommand, "ProjectID", DbType.Int32, lnProjectID);


      //DbCommand dbCommand = db.GetSqlStringCommand(Queries.GetTimeSheetByProjectwise(dtStartDate,dtEndDate,lnProjectID));
      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.ExecuteDataSet(dbCommand);

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }


    public DataSet GetTimeSheetByProjectwise_Without_module(DateTime dtStartDate, DateTime dtEndDate, int lnProjectID ,  int moduleid)
    {
        // Create the Database object, using the default database service. The
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        string sqlCommand = "GetTimeSheetByProjectwiseWithoutModule";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, dtStartDate);
        db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);
        db.AddInParameter(dbCommand, "ProjectID", DbType.Int32, lnProjectID);
        db.AddInParameter(dbCommand, "ModuleID", DbType.Int32, moduleid);

        //DbCommand dbCommand = db.GetSqlStringCommand(Queries.GetTimeSheetByProjectwise(dtStartDate,dtEndDate,lnProjectID));
        // DataSet that will hold the returned results		
        DataSet loDataSet = null;

        loDataSet = db.ExecuteDataSet(dbCommand);

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
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      //string sqlCommand = "GetTimeSheetByProject_USERwise";
      //DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
      //db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, dtStartDate);
      //db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);
      //db.AddInParameter(dbCommand, "ProjectID", DbType.Int32, lnProjectID);
      //db.AddInParameter(dbCommand, "UserID", DbType.Int32, lnUserID);

      DbCommand dbCommand = db.GetSqlStringCommand(Queries.GetTimeSheetByProject_USERwise(dtStartDate,dtEndDate,lnProjectID,lnUserID));
      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.ExecuteDataSet(dbCommand);

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }
    #endregion

    #region GetUserEfficacyReoprt
    public DataSet GetUserEfficacyReoprt(DateTime dtStartDate,
                                        DateTime dtEndDate,
                                        int lnUserID)
    {
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      //string sqlCommand = "GetUserEfficacyReport";
      //DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
      //db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, dtStartDate);
      //db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);
      //db.AddInParameter(dbCommand, "UserID", DbType.Int32, lnUserID);
      DbCommand dbCommand = db.GetSqlStringCommand(Queries.GetUserEfficacyReoprt(dtStartDate, dtEndDate, lnUserID));
      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.ExecuteDataSet(dbCommand);

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }
    #endregion

    #region GetUserProjectReport
    public DataSet GetUserProjectReport(DateTime dtStartDate,
                                        DateTime dtEndDate,
                                        int lnUserID)
    {
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      //string sqlCommand = "GetUserProjectReport";
      //DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
      //db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, dtStartDate);
      //db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);
      //db.AddInParameter(dbCommand, "UserID", DbType.Int32, lnUserID);
      DbCommand dbCommand = db.GetSqlStringCommand(Queries.GetUserProjectReport(dtStartDate, dtEndDate, lnUserID));
      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.ExecuteDataSet(dbCommand);

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }
    #endregion

    #region GetProjectUserwise
    public DataSet GetProjectUserwise(DateTime dtStartDate,
                                        DateTime dtEndDate,
                                        int lnProjectID)
    {
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "GetProjectUserwise";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
      db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, dtStartDate);
      db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);
      db.AddInParameter(dbCommand, "ProjectID", DbType.Int32, lnProjectID);

      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.ExecuteDataSet(dbCommand);

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }
    #endregion

    #region GetProjectModulewiseReport
    public DataSet GetProjectModulewiseReport(DateTime dtStartDate,
                                              DateTime dtEndDate,
                                              int lnProjectID)
    {
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "GetProjectModulewiseReport";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
      db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, dtStartDate);
      db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);
      db.AddInParameter(dbCommand, "ProjectID", DbType.Int32, lnProjectID);

      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.ExecuteDataSet(dbCommand);

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
        // Create the Database object, using the default database service. The
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        //create command
        string sqlCommand = "sp_Admin_Insert";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "szUserName", DbType.String, this.szUserName);
        db.AddInParameter(dbCommand, "szPassword", DbType.String, clsSecure.EncryptText(this.szPassword));

        //Execute NonQuery.
        db.ExecuteNonQuery(dbCommand);
        return (int)clsMessage.RETURN_STATUS.OK;

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
        // Create the Database object, using the default database service. The
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        //create command
        string sqlCommand = "sp_Admin_Update";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "szUserName", DbType.String, this.szUserName);
        db.AddInParameter(dbCommand, "szPassword", DbType.String, clsSecure.EncryptText(this.szPassword));

        //Execute NonQuery.
        db.ExecuteNonQuery(dbCommand);
        return (int)clsMessage.RETURN_STATUS.OK;

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
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        //create command
        string sqlCommand = "sp_Admin_DeleteRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "szUserName", DbType.String, this.szUserName);

        //Execute NonQuery.
        db.ExecuteNonQuery(dbCommand);

        return lsMessage;
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
        // Create the Database object, using the default database service. The
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        //create command
        string sqlCommand = "sp_Admin_ChangePassword";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "szUserName", DbType.String, this.szUserName);
        db.AddInParameter(dbCommand, "szPassword", DbType.String, clsSecure.EncryptText(this.szPassword));

        //Execute NonQuery.
        db.ExecuteNonQuery(dbCommand);
        return (int)clsMessage.RETURN_STATUS.OK;

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
