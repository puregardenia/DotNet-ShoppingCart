using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class update : System.Web.UI.Page
{
    CommDB mydb = new CommDB();
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断页面是否是首次加载的
        if(!Page.IsPostBack){
            DataSet myds = new DataSet();
            txt_id.Text = Request.QueryString["id"];
            string querysql = "select * from teacher where tid='" + Request.QueryString["id"] + "'";

            myds = mydb.ExecuteQuery(querysql, "student");
            DataRow mydr = myds.Tables["student"].Rows[0];

            txt_name.Text = mydr["name"].ToString();
            ddl_job.Text = mydr["job"].ToString();
            txt_loc.Text = mydr["location"].ToString();
            txt_college.Text = mydr["college"].ToString();
            txt_email.Text = mydr["email"].ToString();
        }
    }
    protected void bt_change_Click(object sender, EventArgs e)
    {
        if (txt_id.Text == "")
            return;
        if (txt_name.Text == "")
            return;
        if (txt_loc.Text == "")
            return;
        if (txt_college.Text == "")
            return;

        Regex regex = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
        Match match = regex.Match(txt_email.Text);
        if (txt_email.Text == null || txt_email.Text == "" || !match.Success)
            return;

        string querysql = "update teacher set name='" + txt_name.Text + "',job='" + ddl_job.Text + "',location='" + txt_loc.Text + "',college='" + txt_college.Text + "',email='" + txt_email.Text + "' where tid='" + txt_id.Text + "'";
        mydb.ExecuteNonQuery(querysql);
    }
    protected void bt_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("View.aspx");
    }
}