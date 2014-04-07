using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using NarolaInfotech.Data;
using NarolaInfotech.Utility;
namespace TimeSheet
{
  public class Hours
  {
    #region Properties
    /// <summary>
    /// Get - Set Properties. 
    /// </summary>
    private int f_nmHourID;
    public int nmHourID
    {
      get { return f_nmHourID; }
      set { f_nmHourID = value; }
    }

    private decimal f_nmHourValue;
    public decimal nmHourValue
    {
      get { return f_nmHourValue; }
      set { f_nmHourValue = value; }
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
      
      string sqlCommand = "sp_Hours_SelectAll";
      //DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

      ////Add Parameter.
      //db.AddInParameter(dbCommand, "Search", DbType.String, (stParam.Length == 1) ? stParam[0] : string.Empty);
      DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_Hours_SelectAll((stParam.Length == 1) ? stParam[0] : string.Empty));
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

        string sqlCommand = "sp_Hours_SelectRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        //Add Parameter.
        db.AddInParameter(dbCommand, "nmHourID", DbType.Int32, this.nmHourID);

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

    #region Init
    /// <summary>
    /// Initialization
    /// </summary>
    /// <param name="ds"></param>
    private void Init(DataSet ds)
    {
      this.nmHourID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmHourID", 0));
      this.nmHourValue = Convert.ToDecimal(clsFunctions.GetDataSetValue(ds, 0, "nmHourValue", 0));
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
        string sqlCommand = "sp_Hours_Insert";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmHourValue", DbType.Decimal, this.nmHourValue);

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
        string sqlCommand = "sp_Hours_Update";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmHourID", DbType.Decimal, this.nmHourID);
        db.AddInParameter(dbCommand, "nmHourValue", DbType.Decimal, this.nmHourValue);

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
        string sqlCommand = "sp_Hours_DeleteRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmHourID", DbType.Int32, this.nmHourID);

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
