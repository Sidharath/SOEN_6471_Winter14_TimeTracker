using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using NarolaInfotech.Data;
using NarolaInfotech.Utility;
namespace NarolaInfotech.Data
{
  public class TimeSeetDetail
  {
    #region Properties
    /// <summary>
    /// Get - Set Properties. 
    /// </summary>
    private int f_nmTimeSheetDetail;
    public int nmTimeSheetDetail
    {
      get { return f_nmTimeSheetDetail; }
      set { f_nmTimeSheetDetail = value; }
    }

    private string f_szDetail;
    public string szDetail
    {
      get { return f_szDetail; }
      set { f_szDetail = value; }
    }

    private string f_nmHourID;
    public string nmHourID
    {
      get { return f_nmHourID; }
      set { f_nmHourID = value; }
    }
    private int f_nmTimeSheetID;
    public int nmTimeSheetID
    {
      get { return f_nmTimeSheetID; }
      set { f_nmTimeSheetID = value; }
    }
    private int f_nmModule;
    public int nmModule
    {
      get { return f_nmModule; }
      set { f_nmModule = value; }
    }
    private int f_nmProjectID;
    public int nmProjectID
    {
      get { return f_nmProjectID; }
      set { f_nmProjectID = value; }
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

      string sqlCommand = "sp_TimeSheetDetail_SelectAll";
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

        string sqlCommand = "sp_TimeSheetDetail_SelectRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        //Add Parameter.
        db.AddInParameter(dbCommand, "nmTimeSheetDetail", DbType.Int32, this.nmTimeSheetDetail);

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

    #region GetAllDetailByID
    public DataSet GetAllDetailByID()
    {
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "sp_TimeSheetDetail_By_TimeSheetID";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

      ////Add Parameter.
      db.AddInParameter(dbCommand, "nmTimeSheetID", DbType.Int32, this.nmTimeSheetID);

      //  DbCommand dbCommand=db.GetSqlStringCommand(Queries.sp_TimeSheetDetail_By_TimeSheetID(this.nmTimeSheetID));
      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.ExecuteDataSet(dbCommand);

      // Note: connection was closed by ExecuteDataSet method call 

      return loDataSet;
    }
    #endregion

    #region Init
    /// <summary>
    /// Initialization
    /// </summary>
    /// <param name="ds"></param>
    private void Init(DataSet ds)
    {
      this.nmTimeSheetDetail = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmTimeSheetDetail", 0));
      this.szDetail = Convert.ToString(clsFunctions.GetDataSetValue(ds, 0, "szDetail", string.Empty));
      //this.nmHourID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmHourID", 0));
      this.nmHourID = clsFunctions.GetDataSetValue(ds, 0, "nmHourID", 0).ToString();
      this.nmTimeSheetID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmTimeSheetID", 0));
      this.nmModule = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmModule", 0));
      this.nmProjectID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmProjectID", 0));
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
        string sqlCommand = "sp_TimeSheetDetail_Insert";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        //// Set Parameters.
        db.AddInParameter(dbCommand, "szDetail", DbType.String, this.szDetail);
        db.AddInParameter(dbCommand, "nmHourID", DbType.String, this.nmHourID);
        db.AddInParameter(dbCommand, "nmTimeSheetID", DbType.Int32, this.nmTimeSheetID);
        db.AddInParameter(dbCommand, "nmModule", DbType.Int32, this.nmModule);
        db.AddInParameter(dbCommand, "nmProjectID", DbType.Int32, this.nmProjectID);
       // DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_TimeSheetDetail_Insert(this));
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
        string sqlCommand = "sp_TimeSheetDetail_Update";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "szDetail", DbType.String, this.szDetail);
        db.AddInParameter(dbCommand, "nmHourID", DbType.String, this.nmHourID);
        db.AddInParameter(dbCommand, "nmTimeSheetID", DbType.Int32, this.nmTimeSheetID);
        db.AddInParameter(dbCommand, "nmModule", DbType.Int32, this.nmModule);
        db.AddInParameter(dbCommand, "nmProjectID", DbType.Int32, this.nmProjectID);
        db.AddInParameter(dbCommand, "nmTimeSheetDetail", DbType.Int32, this.nmTimeSheetDetail);

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
        string sqlCommand = "sp_TimeSheetDetail_DeleteRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmTimeSheetDetail", DbType.Int32, this.nmTimeSheetDetail);

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
