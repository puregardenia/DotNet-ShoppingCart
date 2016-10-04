using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class query : System.Web.UI.Page
{
    CommDB mydb = new CommDB();
    protected void Page_Load(object sender, EventArgs e)
    {
        txt_id.Text = Request.QueryString["id"];
        string querysql = "select * from teacher where tid='" + Request.QueryString["id"] + "'";

        DataSet myds = new DataSet();

        myds = mydb.ExecuteQuery(querysql, "student");
        DataRow mydr = myds.Tables["student"].Rows[0];

        txt_name.Text = mydr["name"].ToString();
        txt_job.Text = mydr["job"].ToString();
        txt_loc.Text = mydr["location"].ToString();
        txt_college.Text = mydr["college"].ToString();
        txt_email.Text = mydr["email"].ToString();
    }
    protected void bt_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("View.aspx");
    }
}