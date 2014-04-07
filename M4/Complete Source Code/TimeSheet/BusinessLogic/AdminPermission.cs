using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using NarolaInfotech.Data;
using NarolaInfotech.Utility;

namespace TimeSheet
{
  public class AdminPermission
  {
    #region Properties
    /// <summary>
    /// Get - Set Properties. 
    /// </summary>
    private int f_nmAdminPermission;
    public int nmAdminPermission
    {
      get { return f_nmAdminPermission; }
      set { f_nmAdminPermission = value; }
    }

    private DateTime f_dtPermissionDate;
    public DateTime dtPermissionDate
    {
      get { return f_dtPermissionDate; }
      set { f_dtPermissionDate = value; }
    }

    private DateTime f_dtCreationDate;
    public DateTime dtCreationDate
    {
      get { return f_dtCreationDate; }
      set { f_dtCreationDate = value; }
    }

    private int f_nmUserID;
    public int nmUserID
    {
      get { return f_nmUserID; }
      set { f_nmUserID = value; }
    }

    private string f_szPermission;
    public string szPermission
    {
      get { return f_szPermission; }
      set { f_szPermission = value; }
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

      string sqlCommand = "sp_AdminPermission_SelectAll";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.TimeSheetExecuteDataSet(dbCommand);

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }
    #endregion

    #region GetAllPermisionForMonth
    public DataSet GetAllPermisionForMonth(DateTime dtStartDate, DateTime dtEndDate)
    {
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "sp_AdminPermission_Select_Month";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

      //// Set Parameters.
      db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, dtStartDate);
      db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);

      //DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_AdminPermission_Select_Month(dtStartDate, dtEndDate));
      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.TimeSheetExecuteDataSet(dbCommand);

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

        string sqlCommand = "sp_AdminPermission_SelectRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        //Add Parameter.
        db.AddInParameter(dbCommand, "nmAdminPermission", DbType.Int32, this.nmAdminPermission);

        loDataSet = db.TimeSheetExecuteDataSet(dbCommand);

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

    #region Init
    /// <summary>
    /// Initialization
    /// </summary>
    /// <param name="ds"></param>
    private void Init(DataSet ds)
    {
      this.nmAdminPermission = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmAdminPermission", 0));
      this.dtCreationDate = Convert.ToDateTime(clsFunctions.GetDataSetValue(ds, 0, "dtCreationDate", clsConst.DATETIME_NULL));
      this.dtPermissionDate = Convert.ToDateTime(clsFunctions.GetDataSetValue(ds, 0, "dtPermissionDate", clsConst.DATETIME_NULL));
      this.nmUserID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmUserID", 0));
      this.szPermission = Convert.ToString(clsFunctions.GetDataSetValue(ds, 0, "szPermission", string.Empty));
    }
    #endregion

    #region GetAllPermisionForUserWise
    public DataSet GetAllPermisionForUserWise()
    {
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "sp_AdminPermission_Select_UserWise";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

      // Set Parameters.
      db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);

      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.TimeSheetExecuteDataSet(dbCommand);

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
        string sqlCommand = "sp_AdminPermission_Insert";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        //Add Parameter.
        db.AddInParameter(dbCommand, "dtPermissionDate", DbType.DateTime, this.dtPermissionDate);
        db.AddInParameter(dbCommand, "dtCreationDate", DbType.Date, this.dtCreationDate);
        db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);
        db.AddInParameter(dbCommand, "szPermission", DbType.String, this.szPermission);
        
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
        string sqlCommand = "sp_AdminPermission_Update";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        //Add Parameter.
        db.AddInParameter(dbCommand, "nmAdminPermission", DbType.Int32, this.nmAdminPermission);
        db.AddInParameter(dbCommand, "dtPermissionDate", DbType.DateTime, this.dtPermissionDate);
        db.AddInParameter(dbCommand, "dtCreationDate", DbType.Date, this.dtCreationDate);
        db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);
        db.AddInParameter(dbCommand, "szPermission", DbType.String, this.szPermission);


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
        string sqlCommand = "sp_AdminPermission_DeleteRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmAdminPermission", DbType.Int32, this.nmAdminPermission);

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

    #region DeleteAllMonthRecord

    /// <summary>
    /// Delete From Customer Table.
    /// </summary>
    /// <returns>1/0</returns>
    public string DeleteAllMonthRecord(DateTime dtStartDate, DateTime dtEndDate)
    {
      string lsMessage = string.Empty;
      try
      {
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        //create command
        string sqlCommand = "sp_AdminPermission_Month";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, dtStartDate);
        db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);

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

    #region Delete24Hours

    /// <summary>
    /// Delete From Customer Table.
    /// </summary>
    /// <returns>1/0</returns>
    public string Delete24Hours(DateTime dtEndDate)
    {
      string lsMessage = string.Empty;
      try
      {
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        //create command
        //string sqlCommand = "sp_AdminPermission_Delete_24Hours";//Pawan
        //DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        //DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_AdminPermission_Delete_24Hours);
        // Set Parameters.
        //db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);
        DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_AdminPermission_Delete_24Hours(dtEndDate));
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
