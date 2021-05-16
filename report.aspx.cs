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

public partial class report : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select COUNT(salesid) from purchase where date2=@d1", con);
        con.Open();

        cmd.Parameters.AddWithValue("@d1", txtdate.Text);
        SqlDataReader rdr = cmd.ExecuteReader();
        rdr.Read();
        lblcount.Text = rdr[0].ToString();
        rdr.Close();


        con.Close();
        SqlCommand cmd1 = new SqlCommand("select salesid as SALES_ID,carid as CARID,model as MODEL ,brand as BRAND ,pricetax as PRICE from purchase join car on purchase.carid2=car.carid where date2=@d2 ", con);
        con.Open();
        cmd1.Parameters.AddWithValue("@d2", txtdate.Text);
        SqlDataReader rdr1 = cmd1.ExecuteReader();

        DataTable dt = new DataTable();
        dt.Load(rdr1, LoadOption.PreserveChanges);
        gv1.DataSource = dt;
        gv1.DataBind();
        con.Close();
        con.Open();
        
        
        SqlCommand cmd2 = new SqlCommand("select SUM(pricetax) from purchase join car on purchase.carid2=car.carid where date2=@d2", con);
        cmd2.Parameters.AddWithValue("@d2", txtdate.Text);
        string rdr2 = cmd2.ExecuteScalar().ToString();


        lbltotaldisplay.Text = rdr2;
            con.Close();
        
        



    }
}