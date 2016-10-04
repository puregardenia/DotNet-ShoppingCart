using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View : System.Web.UI.Page
{
    string querystring;
    CommDB mydb = new CommDB();
    DataSet myds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        querystring = "SELECT * FROM teacher where 1=1 ";
        if (txt_name.Text != "")
        {
            querystring = querystring + "and name like '%" + txt_name.Text + "%'";
        }
        if (ddl_college.SelectedValue != "请选择学院")
        {
            querystring = querystring + "and college='" + ddl_college.SelectedValue + "'";
        }
        if (ddl_job.SelectedValue != "请选择职称")
        {
            querystring = querystring + "and job='" + ddl_job.SelectedValue + "'";
        }
        Session["sql"] = querystring;
        if (!IsPostBack)
        {
            bind();
        }
    }

    public void bind()
    {
        querystring = Session["sql"].ToString();
        myds = mydb.ExecuteQuery(querystring, "teacher");
        GridView1.DataSource = myds.Tables["teacher"];
        GridView1.DataKeyNames = new string[] { "tid" };
        GridView1.DataBind();
    }
    protected void bt_query_click(object sender, EventArgs e)
    {
        bind();
    }
    protected void bt_all_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox ck = (CheckBox)(GridView1.Rows[i].FindControl("cbSelect"));
            if (ck.Checked == false)
                ck.Checked = true;
        }
    }
    protected void bt_unall_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox ck = (CheckBox)(GridView1.Rows[i].FindControl("cbSelect"));
            if (ck.Checked == true)
                ck.Checked = false;
        }
    }
    protected void bt_del_Click(object sender, EventArgs e)
    {
        SqlConnection myconn = new SqlConnection();
        myconn.ConnectionString = ConfigurationManager.ConnectionStrings["myconnect"].ToString();
        myconn.Open();

        string querysql;

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox ck = (CheckBox)(GridView1.Rows[i].FindControl("cbSelect"));
            if (ck.Checked == true)
            {
                querysql = "delete from teacher where id='"+GridView1.Rows[i].Cells[2].Text +"'";

                try{
                    SqlCommand mycmd = new SqlCommand(querysql, myconn);
                    mycmd.ExecuteNonQuery();
                }
                catch{
                    Response.Write("<script>alert('删除数据失败！')</script>");
                }
            }
              
        }
        Response.Write("<script>alert('删除数据成功！')</script>");
        myconn.Close();

        bind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='Red'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bind();
    }
}