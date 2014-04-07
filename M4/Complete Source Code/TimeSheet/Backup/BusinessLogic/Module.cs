using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using NarolaInfotech.Data;
using NarolaInfotech.Utility;
using System.Data.Odbc;
namespace TimeSheet
{
  public class Module
  {
    #region Properties
    /// <summary>
    /// Get - Set Properties. 
    /// </summary>
    private int f_nmModule;
    public int nmModule
    {
      get { return f_nmModule; }
      set { f_nmModule = value; }
    }

    private string f_szModuleName;
    public string szModuleName
    {
      get { return f_szModuleName; }
      set { f_szModuleName = value; }
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
    public DataSet Load(params string[] stParam)
    {
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "sp_Module_SelectAll";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

      //Add Parameter.
      db.AddInParameter(dbCommand, "szSearch", DbType.String, (stParam.Length == 1) ? stParam[0] : string.Empty);

      //DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_Module_SelectAll((stParam.Length == 1) ? stParam[0] : string.Empty));
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

        string sqlCommand = "sp_Module_SelectRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
        ////Add Parameter.
        db.AddInParameter(dbCommand, "nmModule", DbType.Int32, this.nmModule);

        //DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_Module_SelectRow(this.nmModule));
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

    #region GetProjectIDByName
    public void GetProjectIDByName()
    {
      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "sp_Module_GetMoudleIDByName";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

      //Add Parameter.
      db.AddInParameter(dbCommand, "szModuleName", DbType.String, this.szModuleName);
      db.AddInParameter(dbCommand, "nmProjectID", DbType.Int32, this.nmProjectID);

      // DataSet that will hold the returned results		
      DataSet loDataSet = null;

      loDataSet = db.ExecuteDataSet(dbCommand);

      Init(loDataSet);
      // Note: connection was closed by ExecuteDataSet method call 

    }
    #endregion

    #region LoadByProjectID
    public DataSet LoadByProjectID()
    {

        //return DotProjectDatabase.LoadModuleByProjectId(this.nmProjectID);

      // Create the Database object, using the default database service. The
      // default database service is determined through configuration.
      Database db = DatabaseFactory.CreateDatabase();

      string sqlCommand = "sp_Module_AllByProjectID";
      DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

      //Add Parameter.
      db.AddInParameter(dbCommand, "nmProjectID", DbType.Int32, this.nmProjectID);


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
      this.nmModule = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmModule", 0));
      this.szModuleName = Convert.ToString(clsFunctions.GetDataSetValue(ds, 0, "szModuleName", string.Empty));
      this.nmProjectID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmProjectID", 0));
    }
    #endregion

    #region CheckForDuplicateName
    public bool CheckForDuplicateName()
    {
      DataSet loDataSet = null;
      try
      {
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        string sqlCommand = "sp_Module_CheckForDuplicateModuleName";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        //Add Parameter.
        db.AddInParameter(dbCommand, "nmModule", DbType.Int32, this.nmModule);
        db.AddInParameter(dbCommand, "szModuleName", DbType.String, this.szModuleName);
        db.AddInParameter(dbCommand, "nmProjectID", DbType.Int32, this.nmProjectID);

        loDataSet = db.ExecuteDataSet(dbCommand);

        if (clsFunctions.GetRowCountOfDataSet(loDataSet, 0) == 0) return true;
        return false;
       
      }
      catch (Exception ex)
      {
        this.m_ErrorMessage = ex.Message;
        return false;
      }
    }
    #endregion

    #region CheckForDuplicateNameForInsert
    public bool CheckForDuplicateNameForInsert()
    {
      DataSet loDataSet = null;
      try
      {
        // default database service is determined through configuration.
        Database db = DatabaseFactory.CreateDatabase();

        string sqlCommand = "sp_Module_CheckForDuplicateModuleNameForInsert";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        //Add Parameter.
        db.AddInParameter(dbCommand, "szModuleName", DbType.String, this.szModuleName);
        db.AddInParameter(dbCommand, "nmProjectID", DbType.Int32, this.nmProjectID);

        loDataSet = db.ExecuteDataSet(dbCommand);

        if (clsFunctions.GetRowCountOfDataSet(loDataSet, 0) == 0) return true;
        return false;

      }
      catch (Exception ex)
      {
        this.m_ErrorMessage = ex.Message;
        return false;
      }
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
        string sqlCommand = "sp_Module_Insert";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "szModuleName", DbType.String, this.szModuleName);
        db.AddInParameter(dbCommand, "nmProjectID", DbType.Int32, this.nmProjectID);

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
        string sqlCommand = "sp_Module_Update";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmModule", DbType.Int32, this.nmModule);
        db.AddInParameter(dbCommand, "szModuleName", DbType.String, this.szModuleName);
        db.AddInParameter(dbCommand, "nmProjectID", DbType.Int32, this.nmProjectID);

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
        string sqlCommand = "sp_Module_DeleteRow";
        DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

        // Set Parameters.
        db.AddInParameter(dbCommand, "nmModule", DbType.Int32, this.nmModule);

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
    public DataView getAllModulesFromDotProjectDB()
    {
        return DotProjectDatabase.getAllModules();
    }

    public DataView getAllProjectsWithModules(string search)
    {
        return DotProjectDatabase.getAllProjectsWithModules(search);
    }
  }
}

