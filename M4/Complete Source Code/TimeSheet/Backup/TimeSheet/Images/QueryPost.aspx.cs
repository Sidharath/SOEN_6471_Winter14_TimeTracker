using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class Images_QueryPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGetQuery_Click(object sender, EventArgs e)
    {
        string strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["DataAccessQuickStart"].ConnectionString.ToString();

        SqlConnection MyConnection = new SqlConnection(strConnection);
        MyConnection.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = MyConnection;

        string Query = string.Empty;
        Query = txtGetQuerry.Text;

        cmd.CommandText = Query;
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        DataTable outputTable = ds.Tables[0].Clone();

        for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
        {
            outputTable.ImportRow(ds.Tables[0].Rows[i]);
        }

        GridView1.DataSource = outputTable;
        GridView1.DataBind();
    }
}
