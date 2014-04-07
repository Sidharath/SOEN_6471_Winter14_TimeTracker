using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using NarolaInfotech.Data;
using NarolaInfotech.Utility;
namespace TimeSheet
{
  public class UserMaster
  {
    #region Properties
    /// <summary>
    /// Get - Set Properties. 
    /// </summary>
    private int f_nmUserID;
    public int nmUserID
    {
      get { return f_nmUserID; }
      set { f_nmUserID = value; }
    }

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

    private string f_szContactPerson;
    public string szContactPerson
    {
      get { return f_szContactPerson; }
      set { f_szContactPerson = value; }
    }

    private string f_szPhotoPath;
    public string szPhotoPath
    {
      get { return f_szPhotoPath; }
      set { f_szPhotoPath = value; }
    }

    private string f_szArchive;
    public string szArchive
    {
      get { return f_szArchive; }
      set { f_szArchive = value; }
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
    public DataSet Load(params string[] stParam)
    {
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "sp_UserMaster_SelectAll";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

      ////Add Parameter.
      db.AddInParameter(dbCommand, "Search", DbType.String, (stParam.Length == 1) ? stParam[0] : string.Empty);
      db.AddInParameter(dbCommand, "szArchive", DbType.String, this.szArchive);

    //  DbCommand dbCommand = db.GetStoredProcCommand(Queries.sp_UserMaster_SelectAll(this.szArchive,(stParam.Length == 1) ? stParam[0] : string.Empty));

      // DataSet that will hold the returned results		
      DataSet loDataSet = null;
     // dbCommand.CommandType = CommandType.StoredProcedure;
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

        string sqlCommand = "sp_UserMaster_SelectRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        //Add Parameter.
        db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);

          
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

        string sqlCommand = "sp_UserMaster_Login";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        //Add Parameter.
        db.AddInParameter(dbCommand, "szUserName", DbType.String, this.szUserName);
        db.AddInParameter(dbCommand, "szPassword", DbType.String, clsSecure.EncryptText(this.szPassword));

        loDataSet = db.ExecuteDataSet(dbCommand);

        if (clsFunctions.GetRowCountOfDataSet(loDataSet, 0) == 0) return false;
        Init(loDataSet);

        return true;
      }
      catch (Exception ex)
      {
        this.m_ErrorMessage = ex.Message;
        return false;
      }
    }
    #endregion

    #region GetUserIDByEamilID 
    public void GetUserIDByEamilID()
    {
      DataSet loDataSet = null;
      try
      {
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        string sqlCommand = "sp_UserMaster_GetUserIDByEamilID";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        //Add Parameter.
        db.AddInParameter(dbCommand, "szUserName", DbType.String, this.szUserName);

        loDataSet = db.ExecuteDataSet(dbCommand);

        Init(loDataSet);

        LoadById();

      }
      catch (Exception ex)
      {
        this.m_ErrorMessage = ex.Message;
      }
    }
    #endregion

    #region Init
    /// <summary>
    /// Initialization
    /// </summary>
    /// <param name="ds"></param>
    private void Init(DataSet ds)
    {
      this.nmUserID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmUserID", 0));
      this.szUserName = Convert.ToString(clsFunctions.GetDataSetValue(ds, 0, "szUserName", string.Empty));
      this.szPassword = clsSecure.DecryptText(Convert.ToString(clsFunctions.GetDataSetValue(ds, 0, "szPassword", string.Empty)));
      this.szPhotoPath = Convert.ToString(clsFunctions.GetDataSetValue(ds, 0, "szPhotoPath", string.Empty));
      this.szContactPerson = Convert.ToString(clsFunctions.GetDataSetValue(ds, 0, "szContactPerson", string.Empty));
      this.szArchive = Convert.ToString(clsFunctions.GetDataSetValue(ds,0,"szArchive",string.Empty));
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
        string sqlCommand = "sp_UserMaster_Insert";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "szUserName", DbType.String, this.szUserName);
        db.AddInParameter(dbCommand, "szPassword", DbType.String, clsSecure.EncryptText(this.szPassword));
        db.AddInParameter(dbCommand, "szPhotoPath", DbType.String, this.szPhotoPath);
        db.AddInParameter(dbCommand, "szContactPerson", DbType.String, this.szContactPerson);
        db.AddInParameter(dbCommand, "szArchive", DbType.String, this.szArchive);

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
        string sqlCommand = "sp_UserMaster_Update";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);


        // Set Parameters.
        db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);
        db.AddInParameter(dbCommand, "szUserName", DbType.String, this.szUserName);
        db.AddInParameter(dbCommand, "szPassword", DbType.String, clsSecure.EncryptText(this.szPassword));
        db.AddInParameter(dbCommand, "szPhotoPath", DbType.String, this.szPhotoPath);
        db.AddInParameter(dbCommand, "szContactPerson", DbType.String, this.szContactPerson);

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
        string sqlCommand = "sp_UserMaster_ChangePassword";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);
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

    #region ChangeArchive

    /// <summary>
    /// Inser Into Customer Table .
    /// </summary>
    /// <returns>1/0</returns>
    public int ChangeArchive()
    {
      try
      {
        // Create the Database object, using the default database service. The
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        //create command
        string sqlCommand = "sp_UserMaster_ChangeArchive";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);
        db.AddInParameter(dbCommand, "szArchive", DbType.String, this.szArchive);

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
        string sqlCommand = "sp_UserMaster_DeleteRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);

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

    #region Delete Operation

    /// <summary>
    /// Delete From Customer Table.
    /// </summary>
    /// <returns>1/0</returns>
    public int Delete_All_User_Record(Int32 nmUserID)
    {
        string lsMessage = string.Empty;
        try
        {
            // default database service is determined through configuration.
            Database db = DatabaseFactory.CreateDatabase();

            //create command
            string sqlCommand = "sp_UserMaster_DeleteRow_All_Record";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

            // Set Parameters.
            db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, nmUserID);

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
  }
}
