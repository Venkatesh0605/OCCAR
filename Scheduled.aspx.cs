using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlTypes;
using System.Configuration;


public partial class Scheduled : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        lblmodel1.Text = Session["mid"].ToString();
        lblbrand1.Text = Session["bid"].ToString();
        lbldate1.Text = Session["date"].ToString();
        lbltime1.Text = Session["time1"].ToString();
        lbluseriddisplay.Text = Session["userid"].ToString();



        SqlCommand cmd = new SqlCommand("select testdriveid from testdrive where scheduledtime=@time1 and date1=@date1", con);
        con.Open();

 
        cmd.Parameters.AddWithValue("@time1", lbltime1.Text);
        cmd.Parameters.AddWithValue("@date1", lbldate1.Text);
        SqlDataReader rdr = cmd.ExecuteReader();
        rdr.Read();
        lbltestdriveid2.Text = (string)rdr[0];
        con.Close();

    }
    protected void btnsignout_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }
}