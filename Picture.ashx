<%@ WebHandler Language="C#" Class="Picture" %>

using System;
using System.Web;
using System.Data.SqlTypes;
using System.Configuration;
using System.Data.SqlClient;

public class Picture : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr1"].ConnectionString);
        string pic = context.Request.QueryString["userid"];
        con.Open();
        SqlCommand cmd = new SqlCommand("select Personimage from  person where userid=@uid", con);
        cmd.Parameters.AddWithValue("@uid", pic);
        SqlDataReader rdr = cmd.ExecuteReader();
        rdr.Read();
        context.Response.BinaryWrite((byte[])rdr[0]);
          con.Close();
            context.Response.End();
            }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}