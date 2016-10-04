using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public class CommDB
{
	public CommDB()
	{
	}
    public int Rownum(string sql, string name, ref string sname)
    {
        int i = 0;
        string mystr;
        mystr = ConfigurationManager.AppSettings["myconn"];
        SqlConnection myconn = new SqlConnection();
        myconn.Open();
        SqlCommand mycmd = new SqlCommand(sql, myconn);
        SqlDataReader myreader = mycmd.ExecuteReader();
        while (myreader.Read())
        {
            sname = myreader[0].ToString();
            i++;
        }
        myconn.Close();
        return i;
    }

    public Boolean ExecuteNonQuery(string sql)
    {
        string mystr;
        mystr = ConfigurationManager.AppSettings["myconn"];
        SqlConnection myconn = new SqlConnection();
        myconn.ConnectionString = mystr;
        myconn.Open();
        SqlCommand mycmd = new SqlCommand(sql, myconn);
        try
        {
            mycmd.ExecuteNonQuery();
            myconn.Close();
        }
        catch
        {
            myconn.Close();
            return false;
        }
        return true;
    }

    public DataSet ExecuteQuery(string sql, string tname)
    {
        string mystr;
        mystr = ConfigurationManager.AppSettings["myconn"];
        SqlConnection myconn = new SqlConnection();
        myconn.ConnectionString = mystr;
        myconn.Open();
        SqlDataAdapter myda = new SqlDataAdapter(sql, myconn);
        DataSet myds = new DataSet();
        myda.Fill(myds, tname);
        myconn.Close();
        return myds;
    }
}