using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.Odbc;

/// <summary>
/// Summary description for DotProjectDatabase
/// </summary>
public class DotProjectDatabase
{
    public DotProjectDatabase()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    private static OdbcConnection getConnectionObject
    {
        get
        {
            string ConnectionString = "DRIVER={MySQL ODBC 5.1 Driver};SERVER=c99;PORT=3306;DATABASE=dotproject;USER=dotproject;PASSWORD=dotproject;OPTION=3;";
            OdbcConnection conn = new OdbcConnection(ConnectionString);
            return conn;

        }
    }

    public static DataView getAllProjects()
    {
        string s = "select project_id as nmProjectID, project_name as szProjectName from projects";
        return getDataView(s);
    }


    public static DataView getAllModules()
    {
        string s = "select project_module_id as nmModule, project_module_name as szModuleName, project_id as nmProjectID from project_modules";
        return getDataView(s);
    }



    public static DataView getAllProjectsWithModules(string search)
    {
        string s = "select p.project_id as nmProjectId, p.project_name as szProjectName,m.project_module_id  as nmModule, m.project_module_name as szModuleName from projects as p left join project_modules as m on p.project_id=m.project_id where p.project_name like '%" + search + "%' or m.project_module_name like '%" + search + "%'";
        return getDataView(s);
    }


    public static DataSet LoadModuleByProjectId(int nmProjectID)
    {
        string s = "select m.project_module_name as szModuleName, project_module_id as nmModule from project_modules as m where m.project_id = '" + nmProjectID + "'";
        return getDataSet(s);
    }
    private static DataView getDataView(string s)
    {
        OdbcConnection conn = getConnectionObject;
        conn.Open();

        OdbcDataAdapter da = new OdbcDataAdapter(s, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
        return ds.Tables[0].DefaultView; ;
    }


    private static DataSet getDataSet(string s)
    {
        OdbcConnection conn = getConnectionObject;
        conn.Open();

        OdbcDataAdapter da = new OdbcDataAdapter(s, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
        return ds;
    }
}
