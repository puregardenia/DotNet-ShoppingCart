using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void bt_submit_Click(object sender, EventArgs e)
    {
       /* // 不需要加验证功能(RequiredFieldValidator 控件)
       if (txt_id.Text == null || txt_id.Text == "")
           return;
       if (txt_name.Text == null || txt_name.Text == "")
           return;
       if (txt_loc.Text == null || txt_loc.Text == "")
           return;
       if (txt_college.Text == null || txt_college.Text == "")
           return;
       */
        
        Regex regex = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
        Match match = regex.Match(txt_email.Text);
        if (txt_email.Text == null || txt_email.Text == ""||!match.Success)
            return;
        
        SqlConnection myconn = new SqlConnection();
        myconn.ConnectionString = ConfigurationManager.ConnectionStrings["myconnect"].ToString();

        myconn.Open();

        //string querysql = "select * from student where name='" + txt_id.Text + "'";
        string querysql = "insert into teacher(tid,name,job,location,college,email) values('" + txt_id.Text + "','" + txt_name.Text + "','" + ddl_job.Text + "','" + txt_loc.Text + "','" + txt_college.Text + "','" + txt_email.Text + "')";
        try
        {
            SqlCommand mycmd = new SqlCommand(querysql, myconn);
            if (mycmd.ExecuteNonQuery() > 0)
            {
                Response.Write("<script>alert('插入数据成功')</script>");
            }
            else
            {
                Response.Write("<script>alert('插入数据失败')</script>");
            }
        }catch(Exception){
            Response.Write("<script>alert('插入异常,请检查编号是否存在、长度是否合格')</script>");
        }

        myconn.Close();
    }
    protected void bt_back_Click(object sender, EventArgs e)
    {

       if (txt_id.Text == null || txt_id.Text == "")
           return;
       if (txt_name.Text == null || txt_name.Text == "")
           return;
       if (txt_loc.Text == null || txt_loc.Text == "")
           return;
       if (txt_college.Text == null || txt_college.Text == "")
           return;

        Regex regex = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
        Match match = regex.Match(txt_email.Text);
        if (txt_email.Text == null || txt_email.Text == "" || !match.Success)
            return;

        SqlConnection myconn = new SqlConnection();
        myconn.ConnectionString = ConfigurationManager.ConnectionStrings["myconnect"].ToString();

        myconn.Open();

        string querysql = "insert into teacher(tid,name,job,location,college,email) values('" + txt_id.Text + "','" + txt_name.Text + "','" + ddl_job.Text + "','" + txt_loc.Text + "','" + txt_college.Text + "','" + txt_email.Text + "')";
        try
        {
            SqlCommand mycmd = new SqlCommand(querysql, myconn);
            if (mycmd.ExecuteNonQuery() > 0)
            {
                Response.Write("<script>alert('插入数据成功')</script>");
            }
            else
            {
                Response.Write("<script>alert('插入数据失败')</script>");
            }
        }
        catch (Exception)
        {
            Response.Write("<script>alert('插入异常,请检查编号是否存在、长度是否合格')</script>");
        }

        myconn.Close();
    }
    protected void bt_change_Click(object sender, EventArgs e)
    {
        if (txt_id.Text == null || txt_id.Text == "")
            return;
        if (txt_name.Text == null || txt_name.Text == "")
            return;
        if (txt_loc.Text == null || txt_loc.Text == "")
            return;
        if (txt_college.Text == null || txt_college.Text == "")
            return;

        Regex regex = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
        Match match = regex.Match(txt_email.Text);
        if (txt_email.Text == null || txt_email.Text == "" || !match.Success)
            return;

        SqlConnection myconn = new SqlConnection();
        myconn.ConnectionString = ConfigurationManager.ConnectionStrings["myconnect"].ToString();

        myconn.Open();
        string querysql = "update teacher set name='" + txt_name.Text + "',job='" + ddl_job.Text  + "',location='" + txt_loc.Text + "',college='" + txt_college.Text + "',email='" + txt_email.Text + "' where tid='" + txt_id.Text + "'";
        try
        {
            SqlCommand mycmd = new SqlCommand(querysql, myconn);
            if (mycmd.ExecuteNonQuery() > 0)
            {
                Response.Write("<script>alert('更新数据成功')</script>");
            }
            else
            {
                Response.Write("<script>alert('更新数据失败')</script>");
            }
        }
        catch (Exception)
        {
            Response.Write("<script>alert('更新异常,请检查编号是否重复或者其他属性的长度')</script>");
        }

        myconn.Close();
    }
    protected void bt_query_Click(object sender, EventArgs e)
    {
        SqlConnection myconn = new SqlConnection();
        myconn.ConnectionString = ConfigurationManager.ConnectionStrings["myconnect"].ToString();
        myconn.Open();

        string querysql = "select * from teacher where tid='" + txt_id.Text + "'";

        SqlCommand mycmd = new SqlCommand(querysql, myconn);
        SqlDataReader myreader = mycmd.ExecuteReader();
        myreader.Read();
        try
        {
            txt_name.Text = myreader["name"].ToString();
            ddl_job.SelectedItem.Text = myreader["job"].ToString();
            txt_loc.Text = myreader["location"].ToString();
            txt_college.Text = myreader["college"].ToString();
            txt_email.Text = myreader["email"].ToString();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('查询编号不存在')</script>");
            txt_id.Text = "";
            txt_name.Text = "";
            txt_loc.Text = "";
            txt_college.Text = "";
            txt_email.Text = "";
        }
        myreader.Close();
        myconn.Close();
    }
    protected void bt_delete_Click(object sender, EventArgs e)
    {
        SqlConnection myconn = new SqlConnection();
        myconn.ConnectionString = ConfigurationManager.ConnectionStrings["myconnect"].ToString();

        myconn.Open();

        string querysql = "delete from teacher where tid='" + txt_id.Text + "'";

        try
        {
            SqlCommand mycmd = new SqlCommand(querysql, myconn);
            if (mycmd.ExecuteNonQuery() > 0)
            {
                Response.Write("<script>alert('删除数据成功')</script>");
                txt_id.Text = "";
                txt_name.Text = "";
                txt_loc.Text = "";
                txt_college.Text = "";
                txt_email.Text = "";
            }
            else
            {
                Response.Write("<script>alert('删除数据失败')</script>");
            }
        }
        catch (Exception)
        {
            Response.Write("<script>alert('删除数据异常')</script>");
        }

        myconn.Close();
    }
}