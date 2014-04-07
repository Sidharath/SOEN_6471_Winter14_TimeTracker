using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using NarolaInfotech.Data;
using NarolaInfotech.Utility;

namespace TimeSheet
{
    public class clsTimeSheet
    {
        #region Properties
        /// <summary>
        /// Get - Set Properties. 
        /// </summary>
        private int f_nmTimeSheetID;
        public int nmTimeSheetID
        {
            get { return f_nmTimeSheetID; }
            set { f_nmTimeSheetID = value; }
        }

        private string f_szAdminApproval;
        public string szAdminApproval
        {
            get { return f_szAdminApproval; }
            set { f_szAdminApproval = value; }
        }


        private DateTime f_dtCreateDate;
        public DateTime dtCreateDate
        {
            get { return f_dtCreateDate; }
            set { f_dtCreateDate = value; }
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

            string sqlCommand = "sp_TimeSheet_SelectAll";
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

                string sqlCommand = "sp_TimeSheet_SelectRow";
                DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
                //Add Parameter.
                db.AddInParameter(dbCommand, "nmTimeSheetID", DbType.Int32, this.nmTimeSheetID);

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
            this.nmTimeSheetID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmTimeSheetID", 0));
            this.szAdminApproval = Convert.ToString(clsFunctions.GetDataSetValue(ds, 0, "szAdminApproval", string.Empty));
            this.nmUserID = Convert.ToInt32(clsFunctions.GetDataSetValue(ds, 0, "nmUserID", 0));
            this.dtCreateDate = Convert.ToDateTime(clsFunctions.GetDataSetValue(ds, 0, "dtCreateDate", clsConst.DATETIME_NULL));
        }
        #endregion

        #region LoadTodayData
        public DataSet LoadTodayData()
        {
            // Create the Database object, using the default database service. The
            // default database service is determined through configuration.
            Database db = DatabaseFactory.CreateDatabase();

            string sqlCommand = "sp_TimeSheet_Today";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

            ////add parameter.
            db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);
            db.AddInParameter(dbCommand, "dtCreateDate", DbType.DateTime, this.dtCreateDate);

            //DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_TimeSheet_Today(this.nmUserID, this.dtCreateDate));
            // DataSet that will hold the returned results		
            DataSet loDataSet = null;

            loDataSet = db.ExecuteDataSet(dbCommand);

            // Note: connection was closed by ExecuteDataSet method call 

            return loDataSet;
        }
        #endregion


        #region Missing Entery
        public DataSet MissingEntery(DateTime dtStartDate, DateTime dtEndDate)
        {
            // Create the Database object, using the default database service. The
            // default database service is determined through configuration.
            Database db = DatabaseFactory.CreateDatabase();

            string sqlCommand = "USP_MISSING_TIMESHEET_BY_DATE";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

            ////add parameter.
            db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, dtStartDate);
            db.AddInParameter(dbCommand, "EndDate", DbType.DateTime, dtEndDate);

            // DataSet that will hold the returned results		
            DataSet loDataSet = null;

            loDataSet = db.ExecuteDataSet(dbCommand);

            // Note: connection was closed by ExecuteDataSet method call 

            return loDataSet;
        }
        #endregion


        #region Daily Time Sheet
        public DataSet DailyTimeSheet(DateTime date)
        {
            // Create the Database object, using the default database service. The
            // default database service is determined through configuration.
            Database db = DatabaseFactory.CreateDatabase();

            string sqlCommand = "USP_GET_ALL_EMP_TIMESHEET_BY_DATE";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

            ////add parameter.
            db.AddInParameter(dbCommand, "Date", DbType.DateTime, date);

            // DataSet that will hold the returned results		
            DataSet loDataSet = null;

            loDataSet = db.ExecuteDataSet(dbCommand);

            // Note: connection was closed by ExecuteDataSet method call 

            return loDataSet;
        }

        #endregion
        #region TotalHours
        public String TotalHours(DateTime dtStartDate, DateTime dtEndDate)
        {
            // Create the Database object, using the default database service. The
            // default database service is determined through configuration.
            Database db = DatabaseFactory.CreateDatabase();

            string sqlCommand = "sp_TimeSheet_GetTotalHoursByDate";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

            ////add parameter.
            string sdate = dtStartDate.Year.ToString() + "-" + dtStartDate.Month.ToString() + "-" + dtStartDate.Day.ToString();
            string edate = dtEndDate.Year.ToString() + "-" + dtEndDate.Month.ToString() + "-" + dtEndDate.Day.ToString();

            db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);
            db.AddInParameter(dbCommand, "StartDate", DbType.DateTime, sdate);
            db.AddInParameter(dbCommand, "ENDDate", DbType.DateTime, edate);
            //DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_TimeSheet_GetTotalHoursByDate(this.nmUserID, dtStartDate, dtEndDate));
            // DataSet that will hold the returned results		
            DataSet loDataSet = null;

            loDataSet = db.ExecuteDataSet(dbCommand);

            if (clsFunctions.GetRowCountOfDataSet(loDataSet, 0) == 0) return "0";
            // Note: connection was closed by ExecuteDataSet method call 
            string h = loDataSet.Tables[0].Rows[0]["H"].ToString();
            string m = loDataSet.Tables[0].Rows[0]["M"].ToString();
            int intMinute = 0;
            int intHour = 0;
            if (!string.IsNullOrEmpty(m))
            {
                intMinute = Convert.ToInt32(m);
                if (intMinute > 60)
                {
                    var TempHour = System.TimeSpan.FromMinutes(intMinute);
                    if (!string.IsNullOrEmpty(h))
                    {
                        intHour = Convert.ToInt32(h);
                    }
                    intHour = intHour + TempHour.Hours;
                    m = TempHour.Minutes.ToString();
                    h = intHour.ToString();
                }
            }
            if (h.Length == 1)
            {
                h = "0" + h;
            }
            if (m.Length == 1)
            {
                m = "0" + m;
            }
            if (h.Length == 0)
            { h = "00"; }
            if (m.Length == 0)
            { m = "00"; }

            //return loDataSet.Tables[0].Rows[0]["TotalHours"].ToString();
            return h + ":" + m;
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
                string sqlCommand = "sp_TimeSheet_Insert";
                DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

                //// Set Parameters.
                db.AddInParameter(dbCommand, "szAdminApproval", DbType.String, this.szAdminApproval);
                db.AddInParameter(dbCommand, "dtCreateDate", DbType.DateTime, this.dtCreateDate);
                db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);
                db.AddOutParameter(dbCommand, "nmTimeSheetID", DbType.Int32, 0);
                ////Execute NonQuery.
                int _nmTimeSheetID = 0;
                //DbCommand dbCommand = db.GetSqlStringCommand(Queries.sp_TimeSheet_Insert(this, out _nmTimeSheetID));

                db.ExecuteNonQuery(dbCommand);
                this.nmTimeSheetID = _nmTimeSheetID;
                object loValue = db.GetParameterValue(dbCommand, "nmTimeSheetID");
                if (!string.IsNullOrEmpty(loValue.ToString()))
                {
                    this.nmTimeSheetID = clsFunctions.ToInteger(loValue);
                }

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
                string sqlCommand = "sp_TimeSheet_Update";
                DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

                // Set Parameters.
                db.AddInParameter(dbCommand, "szAdminApproval", DbType.String, this.szAdminApproval);
                db.AddInParameter(dbCommand, "dtCreateDate", DbType.DateTime, this.dtCreateDate);
                db.AddInParameter(dbCommand, "nmUserID", DbType.Int32, this.nmUserID);
                db.AddInParameter(dbCommand, "nmTimeSheetID", DbType.Int32, this.nmTimeSheetID);


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
                string sqlCommand = "sp_TimeSheet_DeleteRow";
                DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

                // Set Parameters.
                db.AddInParameter(dbCommand, "nmTimeSheetID", DbType.Int32, this.nmTimeSheetID);

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
