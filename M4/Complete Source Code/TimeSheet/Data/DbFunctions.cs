using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using NarolaInfotech.Utility;


namespace NarolaInfotech.Data
{
    /// <summary>
    /// Contains DB Functions methods for interacting DB
    /// </summary>
    public class DbFunctions
    {

        #region Load

        /// <summary>
        /// Method for Load /// 
        /// </summary>
        /// <example>
        /// <code>
        /// Database dbSvc = DatabaseFactory.CreateDatabase();
        /// </code>
        /// </example>
        /// <returns>Database</returns>
        /// <exception cref="System.Configuration.ConfigurationException">
        /// <para>An error occured while reading the configuration.</para>
        /// </exception>
       
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
        
        #region AuthenticateUser
        /// <summary>
        /// Method for Authenticate User        /// 
        /// </summary>
        /// <example>
        /// <code>
        /// Database dbSvc = DatabaseFactory.CreateDatabase();
        /// </code>
        /// </example>
        /// <returns>Database</returns>
        /// <exception cref="System.Configuration.ConfigurationException">
        /// <para>An error occured while reading the configuration.</para>
        /// </exception>
       
        public bool AuthenticateUser(string UserName, string Password)
       {
           DataSet loDataSet = null;
           try
           {
               // default database service is determined through configuration.
               Database db = DatabaseFactory.CreateDatabase();

               string sqlCommand = "sp_Admin_Login";
               DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
               //Add Parameter.
               db.AddInParameter(dbCommand, "szUserName", DbType.String, UserName);
               db.AddInParameter(dbCommand, "szPassword", DbType.String, clsSecure.EncryptText(Password));

               //DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_Admin_Login(this.szUserName,clsSecure.EncryptText(this.szPassword)));
               loDataSet = db.ExecuteDataSet(dbCommand);

               if (clsFunctions.GetRowCountOfDataSet(loDataSet, 0) == 0) return false;

               return true;
           }
           catch (Exception ex)
           {
               //this.m_ErrorMessage = ex.Message;
               return false;
           }

       }
        #endregion


        #region GetTimeSheetByUserwise
        /// <summary>
       /// Method for GetTimeSheetByUserwise          /// 
       /// </summary>
       /// <example>
       /// <code>
       /// Database dbSvc = DatabaseFactory.CreateDatabase();
       /// </code>
       /// </example>
       /// <returns>Database</returns>
       /// <exception cref="System.Configuration.ConfigurationException">
       /// <para>An error occured while reading the configuration.</para>
        /// </exception>

       
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
        /// <summary>
        /// Method for GetTimeSheetByProjectwise          /// 
        /// </summary>
        /// <example>
        /// <code>
        /// Database dbSvc = DatabaseFactory.CreateDatabase();
        /// </code>
        /// </example>
        /// <returns>Database</returns>
        /// <exception cref="System.Configuration.ConfigurationException">
        /// <para>An error occured while reading the configuration.</para>
        /// </exception>
        /// 
       public DataSet GetTimeSheetByProjectwise(DateTime dtStartDate, DateTime dtEndDate, int lnProjectID)
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

        #endregion

       #region GetTimeSheetByProjectwise_Without_module

       /// <summary>
       /// Method for GetTimeSheetByProjectwise_Without_module          /// 
       /// </summary>
       /// <example>
       /// <code>
       /// Database dbSvc = DatabaseFactory.CreateDatabase();
       /// </code>
       /// </example>
       /// <returns>Database</returns>
       /// <exception cref="System.Configuration.ConfigurationException">
       /// <para>An error occured while reading the configuration.</para>
       /// </exception>
       /// 

       public DataSet GetTimeSheetByProjectwise_Without_module(DateTime dtStartDate, DateTime dtEndDate, int lnProjectID, int moduleid)
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
       /// <summary>
       /// Method for GetTimeSheetByProject_USERwise        /// 
       /// </summary>
       /// <example>
       /// <code>
       /// Database dbSvc = DatabaseFactory.CreateDatabase();
       /// </code>
       /// </example>
       /// <returns>Database</returns>
       /// <exception cref="System.Configuration.ConfigurationException">
       /// <para>An error occured while reading the configuration.</para>
       /// </exception>
       /// 

       public DataSet GetTimeSheetByProject_USERwise(DateTime dtStartDate,
                                                 DateTime dtEndDate,
                                                 int lnProjectID,
                                                 int lnUserID)
       {
           // Create the Database object, using the default database service. The
           // default database service is determined through configuration.
           Database db = DatabaseFactory.CreateDatabase();

           DbCommand dbCommand = db.GetSqlStringCommand(Queries.GetTimeSheetByProject_USERwise(dtStartDate, dtEndDate, lnProjectID, lnUserID));
           // DataSet that will hold the returned results		
           DataSet loDataSet = null;

           loDataSet = db.ExecuteDataSet(dbCommand);

           // Note: connection was closed by ExecuteDataSet method call 

           return loDataSet;
       }

       #endregion

       #region GetUserEfficacyReoprt
       /// <summary>
        /// Method for GetTimeSheetByProject_USERwise        /// 
        /// </summary>
        /// <example>
        /// <code>
        /// Database dbSvc = DatabaseFactory.CreateDatabase();
        /// </code>
        /// </example>
        /// <returns>Database</returns>
        /// <exception cref="System.Configuration.ConfigurationException">
        /// <para>An error occured while reading the configuration.</para>
        /// </exception>
        ///       
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
       /// <summary>
       /// Method for GetUserProjectReport      /// 
       /// </summary>
       /// <example>
       /// <code>
       /// Database dbSvc = DatabaseFactory.CreateDatabase();
       /// </code>
       /// </example>
       /// <returns>Database</returns>
       /// <exception cref="System.Configuration.ConfigurationException">
       /// <para>An error occured while reading the configuration.</para>
       /// </exception>
       /// 

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
       /// <summary>
       /// Method for GetProjectUserwise      /// 
       /// </summary>
       /// <example>
       /// <code>
       /// Database dbSvc = DatabaseFactory.CreateDatabase();
       /// </code>
       /// </example>
       /// <returns>Database</returns>
       /// <exception cref="System.Configuration.ConfigurationException">
       /// <para>An error occured while reading the configuration.</para>
       /// </exception>
       ///      
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
       /// <summary>
       /// Method for GetProjectModulewiseReport      /// 
       /// </summary>
       /// <example>
       /// <code>
       /// Database dbSvc = DatabaseFactory.CreateDatabase();
       /// </code>
       /// </example>
       /// <returns>Database</returns>
       /// <exception cref="System.Configuration.ConfigurationException">
       /// <para>An error occured while reading the configuration.</para>
       /// </exception>
       /// 
       
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


       //=========================================================================================================================
       //                                                            Modification Data Block
       //=========================================================================================================================
       #region Insert Operation

       /// <summary>
       /// Inser Into Customer Table.
       /// </summary>
       /// <returns>1/0</returns>
       public int Insert(string UserName, string Password)
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
               db.AddInParameter(dbCommand, "szUserName", DbType.String, UserName);
               db.AddInParameter(dbCommand, "szPassword", DbType.String, clsSecure.EncryptText(Password));

               //Execute NonQuery.
               db.ExecuteNonQuery(dbCommand);
               return (int)clsMessage.RETURN_STATUS.OK;

           }
           catch (Exception ex)
           {
               throw;
           }
       }

       #endregion

       #region Update Operation

       /// <summary>
       /// Inser Into Customer Table .
       /// </summary>
       /// <returns>1/0</returns>
       public int Update(string UserName, string Password)
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
               db.AddInParameter(dbCommand, "szUserName", DbType.String, UserName);
               db.AddInParameter(dbCommand, "szPassword", DbType.String, clsSecure.EncryptText(UserName));

               //Execute NonQuery.
               db.ExecuteNonQuery(dbCommand);
               return (int)clsMessage.RETURN_STATUS.OK;

           }
           catch (Exception ex)
           {
               throw;
           }
       }

       #endregion

       #region Delete Operation

       /// <summary>
       /// Delete From Customer Table.
       /// </summary>
       /// <returns>1/0</returns>
       public string Delete(string UserName)
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
               db.AddInParameter(dbCommand, "szUserName", DbType.String, UserName);

               //Execute NonQuery.
               db.ExecuteNonQuery(dbCommand);

               return lsMessage;
           }
           catch (Exception ex)
           {
               throw;
           }
       }

       #endregion

       #region ChangePassword

       /// <summary>
       /// Inser Into Customer Table .
       /// </summary>
       /// <returns>1/0</returns>
       public int ChangePassword(string UserName, string Password)
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
               db.AddInParameter(dbCommand, "szUserName", DbType.String, UserName);
               db.AddInParameter(dbCommand, "szPassword", DbType.String, clsSecure.EncryptText(Password));

               //Execute NonQuery.
               db.ExecuteNonQuery(dbCommand);
               return (int)clsMessage.RETURN_STATUS.OK;

           }
           catch (Exception ex)
           {
               throw;
           }
       }

       #endregion
       
    }


}
