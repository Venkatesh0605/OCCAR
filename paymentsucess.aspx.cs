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

public partial class paymentsuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    //    Session["uid"] = lbluserid.Text;
    //    Session["bid"] = ddbrand.SelectedItem.Text;
    //    Session["mid"] = ddmodel.SelectedItem.Text;
    //    Session["d1"] = lbldate.Text;
        lbluserid1.Text = Session["uid"].ToString();
        lblbrand1.Text = Session["bid"].ToString();
        lblmodel1.Text = Session["mid"].ToString();
        string s = Session["d1"].ToString();
        //s = Convert.ToDateTime(s).
        //s =( s + 3);
        //lbldate1.Text = s;
        lbldate1.Text = "Will be delivered in 3 days";
        SqlCommand cmd = new SqlCommand("select  top 1 salesid  from purchase order by salesid  desc", con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        rdr.Read();
        lblsalesid1.Text = (string)rdr[0];
        con.Close();




        



    }

    protected void btnsignout_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }
}