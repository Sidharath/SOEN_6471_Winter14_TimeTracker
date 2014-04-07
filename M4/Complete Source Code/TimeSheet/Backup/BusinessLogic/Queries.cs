using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Odbc;

namespace TimeSheet
{
    public class Queries
    {

        public static string sp_Project_SelectAll(string Search)
        {

            string s = "Select project_id as nmProjectId,project_name as szProjectName from Projects where project_name like '%" + Search + "%'";
            return s;

        }


        public static string sp_AdminPermission_Delete_24Hours(DateTime EndDate)
        {

            string s = "Delete AdminPermission Where dtCreationDate <= '" + EndDate + "'";
            return s;

        }


        public static string sp_Admin_Login(string szUserName, string szPassword)
        {

            string s = "select szUserName, szPassword from Admin where szUserName='" + szUserName + "' and szPassword='" + szPassword + "'";
            return s;

        }


        public static string sp_UserMaster_SelectAll(string szArchive, string szSearch)
        {
            bool includeArchive = (szArchive.Equals("0") || szArchive.Equals("1")) ? true : false;
            string s = "";

            s = "select u.user_id as nmUserID, u.user_username as szUserName, u.user_password as szPassword, u.user_archive as szArchive, u.user_photopath as szPhotoPath, concat(c.contact_first_name, ' ' ,c.contact_last_name) as szContactPerson, u.user_archive as szArchive from users as u inner join contacts as c on u.user_contact=c.contact_id where (u.user_username like '%" + szSearch + "%' or c.contact_first_name like '%" + szSearch + "%' or c.contact_last_name like '%" + szSearch + "%')" + (includeArchive ? (" and u.user_archive = '" + szArchive + "'") : "");

            return s;

        }



        public static string sp_TimeSheet_GetTotalHoursByDate(int nmUserId, DateTime dtStartDate, DateTime dtEndDate)
        {
            string s = "";

            s = @"	SELECT coalesce(SUM(HO.nmHourValue),0) AS TotalHours From 
                 TimeSheet TS INNER JOIN TimeSheetDetail TSD
	             ON TS.nmTimeSheetID = TSD.nmTimeSheetID";

            s += " AND TS.user_id = '" + nmUserId + "'";

            s += @" AND TS.dtCreateDate Between '" + dtStartDate + "' AND '" + dtEndDate + "'";
            s += @" INNER JOIN Hours HO
	                ON HO.nmHourID = TSD.nmHourID";




            return s;

        }


        public static string sp_TimeSheet_Today(int nmUserId, DateTime dtCreateDate)
        {
            string s = "";

            s = @"	Select 
		nmTimeSheetID,
		szAdminApproval,
	dtCreateDate,
	user_id
	From TimeSheet";
            s += " WHERE user_id ='" + nmUserId + "' AND";
            s += " date(dtCreateDate) = date('" + dtCreateDate.ToString("yyyy-MM-dd hh:mm:ss") + "')";




            return s;

        }


        public static string sp_TimeSheetDetail_By_TimeSheetID(int nmTimeSheetID)
        {
            string s = "";

            s = @"Select
  TSD.nmTimeSheetDetail,
  TSD.project_id as nmProjectId,
  TSD.project_module_id as nmModule,
  TSD.nmHourID,  
  TSD.szDetail,  
  TSD.nmTimeSheetID,
  PR.project_name as szProjectName,
  MO.project_module_name as szModuleName,
  HO.nmHourValue


 From TimeSheetDetail TSD
 INNER JOIN Projects PR
 ON PR.project_id = TSD.project_id
 INNER JOIN project_modules MO
 ON MO.project_module_id = TSD.project_module_id
 INNER JOIN Hours HO
 ON HO.nmHourID = TSD.nmHourID
 WHERE   TSD.nmTimeSheetID  =" + nmTimeSheetID;




            return s;

        }



        public static string sp_Hours_SelectAll(string search)
        {
            string s = "";

            s = @"	Select 
		nmHourID,
		nmHourValue
	From Hours
    WHERE 
      nmHourValue like '" + search + "%'";




            return s;

        }



        public static string sp_AdminPermission_Select_Month(DateTime StartDate, DateTime EndDate)
        {
            string s = "";

            s = @"	Select nmAdminPermission,dtPermissionDate,dtCreationDate,user_id as nmUserID, szPermission  
   FROM 
AdminPermission
	Where
		dtPermissionDate BETWEEN '" + StartDate.ToString("yyyy-MM-dd hh:mm:ss") + "' AND '" + EndDate.ToString("yyyy-MM-dd hh:mm:ss") + "'";




            return s;

        }





        public static string sp_TimeSheet_Insert(clsTimeSheet _TimeSheet, out int _nmTimeSheetID)
        {
            string s = "";


            DataTable dt = getData("select count(nmTimeSheetID)+1 from TimeSheet");
            _nmTimeSheetID = int.Parse(dt.Rows[0][0].ToString());
            s = @"Insert Into TimeSheet
		(nmTimeSheetID,szAdminApproval,dtCreateDate,user_id)
	    Values
		(" + _nmTimeSheetID + "," + _TimeSheet.szAdminApproval + ",'" + _TimeSheet.dtCreateDate.ToString("yyyy-MM-dd hh:mm:ss") + "'," + _TimeSheet.nmUserID + ")";

            


            return s;

        }








        public static string sp_TimeSheetDetail_Insert(TimeSeetDetail TimeSheetDetail)
        {
            string s = "";


            DataTable dt = getData("select count(nmTimeSheetID)+1 from TimeSheetDetail");
            int i = int.Parse(dt.Rows[0][0].ToString());

            s = @"Insert Into TimeSheetDetail
		(nmTimeSheetDetail,szDetail,nmHourId,nmTimeSheetID,project_module_id,project_id)
	    Values
		(" + i + ",'" + TimeSheetDetail.szDetail + "','" + TimeSheetDetail.nmHourID + "'," + TimeSheetDetail.nmTimeSheetID + "," + TimeSheetDetail.nmModule + "," + TimeSheetDetail.nmProjectID + ")";




            return s;

        }





        public static string sp_Module_SelectRow(int  nmModule)
        {
            string s = "";


            s = "select project_module_id as nmModule, project_module_name as szModuleName, project_id as nmProjectID from module where project_module_id =" + nmModule;


            return s;

        }


        public static string sp_Module_SelectAll(string szSearch)
        {
            string s = "";

            s = @"


Select 
		M.project_module_id as nmModule,
		M.project_module_name as szModuleName,
		M.project_id as nmProjectID,
		P.project_name as szProjectName
	From project_modules M
    INNER JOIN Projects P
	ON M.project_id = P.project_id
    WHERE" +
        " P.project_name Like '%" + szSearch + "%' OR" +
        " M.project_module_name Like '%" + szSearch + "%'";






            return s;

        }



        public static string GetTimeSheetByProjectwise(DateTime dtStartDate, DateTime dtEndDate, int ProjectID)
        {
            string s = "";

            s = @"


Select 
     TS.dtCreateDate as Date,
	 PR.project_name as Project, 
	 MO.project_module_name as Module,
	 HO.nmHourValue as Hours,
         concat(c.contact_first_name, ' ' ,c.contact_last_name) as UserName,
	 TSD.szDetail as Detail
	FROM
	  TimeSheet TS
	INNER JOIN TimeSheetDetail TSD
	 ON TS.nmTimeSheetID = TSD.nmTimeSheetID
     AND TS.dtCreateDate BETWEEN '" + dtStartDate + "' AND '" + dtEndDate + "'" +
     @" AND TSD.project_id = '" + ProjectID + "'" +
    @"INNER JOIN Projects PR
	 ON PR.project_id = TSD.project_id
	INNER JOIN project_modules MO
	 ON MO.project_module_id = TSD.project_module_id
	INNER JOIN Hours HO
	 ON HO.nmHourID = TSD.nmHourID 
	INNER JOIN users UM
	 ON UM.user_id = TS.user_id
 INNER JOIN contacts c
	 ON UM.user_contact=c.contact_id
   AND UM.user_archive= '0'
	ORDER BY  PR.project_name, TS.dtCreateDate";






            return s;

        }



        public static string GetTimeSheetByProject_USERwise(DateTime dtStartDate, DateTime dtEndDate, int ProjectID, int UserID)
        {
            string s = "";

            s = @"


Select 
     TS.dtCreateDate as Date,
	 PR.project_name as Project, 
	 MO.project_module_name as Module,
	 HO.nmHourValue as Hours,
         concat(c.contact_first_name, ' ' ,c.contact_last_name) as UserName,
	 TSD.szDetail as Detail
	FROM
	  TimeSheet TS
	INNER JOIN TimeSheetDetail TSD
	 ON TS.nmTimeSheetID = TSD.nmTimeSheetID
     AND TS.dtCreateDate BETWEEN '" + dtStartDate + "' AND '" + dtEndDate + "'" +
     @" AND TSD.project_id = '" + ProjectID + "'" +
    @"INNER JOIN Projects PR
	 ON PR.project_id = TSD.project_id
	INNER JOIN project_modules MO
	 ON MO.project_module_id = TSD.project_module_id
	INNER JOIN Hours HO
	 ON HO.nmHourID = TSD.nmHourID 
	INNER JOIN users UM
	 ON UM.user_id = TS.user_id
 INNER JOIN contacts c
	 ON UM.user_contact=c.contact_id
   AND UM.user_archive= '0'" +
" WHERE UM.user_id ='" + UserID + "'" +
    " ORDER BY  PR.project_name, TS.dtCreateDate";






            return s;

        }

        public static string GetTimeSheetByUserwise(DateTime dtStartDate, DateTime dtEndDate, int UserID)
        {
            string s = "";

            s = @"


Select 
     TS.dtCreateDate as Date,
	 PR.project_name as Project, 
	 MO.project_module_name as Module,
	 HO.nmHourValue as Hours,
         concat(c.contact_first_name, ' ' ,c.contact_last_name) as UserName,
	 TSD.szDetail as Detail
	FROM
	  TimeSheet TS
	INNER JOIN TimeSheetDetail TSD
	 ON TS.nmTimeSheetID = TSD.nmTimeSheetID
     AND TS.dtCreateDate BETWEEN '" + dtStartDate + "' AND '" + dtEndDate + "'" +
    
    @" INNER JOIN Projects PR
	 ON PR.project_id = TSD.project_id
	INNER JOIN project_modules MO
	 ON MO.project_module_id = TSD.project_module_id
	INNER JOIN Hours HO
	 ON HO.nmHourID = TSD.nmHourID 
	INNER JOIN users UM
	 ON UM.user_id = TS.user_id
 INNER JOIN contacts c
	 ON UM.user_contact=c.contact_id
   AND UM.user_archive= '0'" +
" WHERE UM.user_id ='" + UserID + "'" +
    " ORDER BY  PR.project_name, TS.dtCreateDate";






            return s;

        }

        public static string GetUserEfficacyReoprt(DateTime dtStartDate, DateTime dtEndDate, int UserID)
        {
            string s = "";
            string StartDate = dtStartDate.ToString("MM/dd/yyyy");
            string EndDate = dtEndDate.ToString("MM/dd/yyyy");

            /* Old_Logic
            s = @"
                SELECT 
                 SUM(HO.nmHourValue) AS Hours,
                TS.dtCreateDate AS DATE 
                FROM 
                TimeSheet TS
                INNER JOIN TimeSheetDetail TSD
                ON TS.nmTimeSheetID = TSD.nmTimeSheetID
                AND TS.nmUserID='" + UserID + "'" +
                @" AND TS.dtCreateDate BETWEEN '" + StartDate + "' AND '" + EndDate + "'" +
                @" INNER JOIN Hours HO
                ON HO.nmHourID = TSD.nmHourID
                GROUP BY  TS.dtCreateDate";
            */

            // New Query by Shiv on 12/10/2012
            s = @"Select 
SUM(CONVERT(decimal(10,2),REPLACE(TSD.nmHourID,':','.'))) AS Hours,
TS.dtCreateDate AS DATE  
from TimeSheet TS
inner join TimeSheetDetail TSD on TS.nmTimeSheetID = TSD.nmTimeSheetID
where TS.nmUserID='" + UserID + "' AND TS.dtCreateDate BETWEEN '" + StartDate + "' AND '" + EndDate + "'" +
@"GROUP BY  TS.dtCreateDate";





            return s;

        }





        public static string GetUserProjectReport(DateTime dtStartDate, DateTime dtEndDate, int UserID)
        {
            string s = "";

            /*
            s = @"
            SELECT 
             SUM(HO.nmHourValue) AS Hours,
             PR.project_name as szProjectName
            FROM 
            TimeSheet TS
            INNER JOIN TimeSheetDetail TSD
            ON TS.nmTimeSheetID = TSD.nmTimeSheetID
            AND TS.user_id = '" + UserID + "'" +
            @" AND TS.dtCreateDate BETWEEN '" + dtStartDate + "' AND '" + dtEndDate + "'" +
            @" INNER JOIN Hours HO
            ON HO.nmHourID = TSD.nmHourID
            INNER JOIN Projects PR
            ON PR.project_id = TSD.project_id
            GROUP BY  PR.project_name
            ";
             * */

            s = @"
                SELECT 
                 SUM(CONVERT(decimal(10,2),REPLACE(TSD.nmHourID,':','.'))) AS Hours,
                 PR.szProjectName as szProjectName
                FROM 
                TimeSheet TS
                INNER JOIN TimeSheetDetail TSD
                ON TS.nmTimeSheetID = TSD.nmTimeSheetID
                AND TS.nmUserID = '" + UserID + "'" +
                @"AND TS.dtCreateDate BETWEEN '" + dtStartDate + "' AND '" + dtEndDate + "'" +
                @"INNER JOIN Project PR
                ON PR.nmProjectID = TSD.nmProjectID
                GROUP BY  PR.szProjectName";





            return s;

        }



        private static DataTable getData(string s)
        {
            OdbcConnection conn = new OdbcConnection(@"DRIVER={MySQL ODBC 5.1 Driver};SERVER=c99;PORT=3306;DATABASE=dotproject;USER=dotproject;PASSWORD=dotproject;OPTION=3;");
            OdbcDataAdapter da = new OdbcDataAdapter(s, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0];
        }

    }
    
}
