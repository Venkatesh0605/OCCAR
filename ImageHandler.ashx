<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlTypes;
using System.Configuration;


public class ImageHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr1"].ConnectionString);
            string carid1 = context.Request.QueryString["carid"];
            con.Open();
            SqlCommand cmd = new SqlCommand("select image1 from  car where carid=@carid", con);
            cmd.Parameters.AddWithValue("@carid", carid1);
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            context.Response.BinaryWrite((byte[])rdr[0]);
            con.Close();
            context.Response.End();
        }
        catch(Exception)
        {
            Console.WriteLine("No cars available");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}