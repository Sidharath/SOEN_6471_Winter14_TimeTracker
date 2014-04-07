using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using NarolaInfotech.Data;
using NarolaInfotech.Utility;

namespace TimeSheet
{
  public class UserProjectSetting
  {
    #region Properties
    /// <summary>
    /// Get - Set Properties. 
    /// </summary>
    private int f_nmUserProjectSettingID;
    public int nmUserProjectSettingID
    {
      get { return f_nmUserProjectSettingID; }
      set { f_nmUserProjectSettingID = value; }
    }

    private int f_nmProjectID;
    public int nmProjectID
    {
      get { return f_nmProjectID; }
      set { f_nmProjectID = value; }
    }

    private int f_nmModule;
    public int nmModule
    {
      get { return f_nmModule; }
      set { f_nmModule = value; }
    }

    private int f_nmUserID;
    public int nmUserID
    {
      get { return f_nmUserID; }
      set { f_nmUserID = value; }
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

      string sqlCommand = "sp_UserProjectSetting_SelectAll";
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

        string sqlCommand = "sp_UserProjectSetting_SelectRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        //Add Parameter.
        db.AddInParameter(dbCommand, "nmUserProjectSettingID", DbType.Int32, this.nmUserProjectSettingID);

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

    #region GetValueByUSerID
    public int GetValueByUSerID()
    {
      DataSet loDataSet = null;
      try
      {
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        string sqlCommand = "sp_UserProjectSetting_ByUserID";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        //Add Parameter.
        db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);

        loDataSet = db.ExecuteDataSet(dbCommand);

        if (clsFunctions.GetRowCountOfDataSet(loDataSet, 0) == 0) return (int)clsMessage.RETURN_STATUS.NOT_OK;
        Init(loDataSet);
        return 0;
      }
      catch (Exception ex)
      {
        this.m_ErrorMessage = ex.Message;
        return 0;
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
      this.nmUserProjectSettingID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmUserProjectSettingID", 0));
      this.nmProjectID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmProjectID", 0));
      this.nmModule = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmModule", 0));
      this.nmUserID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmUserID", 0));
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
        string sqlCommand = "sp_UserProjectSetting_Insert";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmProjectID", DbType.Int32, this.nmProjectID);
        db.AddInParameter(dbCommand, "nmModule", DbType.Int32, this.nmModule);
        db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);
    
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
        string sqlCommand = "sp_UserProjectSetting_Update";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmProjectID", DbType.Int32, this.nmProjectID);
        db.AddInParameter(dbCommand, "nmModule", DbType.Int32, this.nmModule);
        db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);
        db.AddInParameter(dbCommand, "nmUserProjectSettingID", DbType.Int32, this.nmUserProjectSettingID);


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
        string sqlCommand = "sp_UserProjectSetting_DeleteRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmUserProjectSettingID", DbType.Int32, this.nmUserProjectSettingID);

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

    //=========================================================End - Modification Data Block===================================








    //===nmAddressBookID======================================================================================================================
    //                                                            Implementation Logic Block
    //=========================================================================================================================

    //=========================================================End - Implementation Logic Block================================
  }
}
