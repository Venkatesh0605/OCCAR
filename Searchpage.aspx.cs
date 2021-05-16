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

public partial class Searchpage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr1"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("select distinct brand from car", con);
            con.Open();
            SqlDataReader rdr1 = cmd.ExecuteReader();
            // rdr1.Read();  
            dt.Load(rdr1, LoadOption.OverwriteChanges);

            ddbrand.DataSource = dt;
            ddbrand.DataValueField = "brand";
            ddbrand.DataTextField = "brand";
            ddbrand.DataBind();
            con.Close();

        }

    }
 
    protected void ddbrand_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void textpricemin_TextChanged(object sender, EventArgs e)
    {

    }
    protected void textpricemax_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnsearch_Click1(object sender, EventArgs e)
    {
        P1.Visible = false;
        GridView1.Visible = true;
        SqlConnection con = new SqlConnection("Data Source=(local); Initial Catalog=occar;Integrated Security=true");
        SqlCommand cmd1 = new SqlCommand("select carid,Brand,model,EngineType,price,Description1,image1 from car where Brand=@b and Price between @pmin and @pmax", con);
        con.Open();
        cmd1.Parameters.AddWithValue("@b", ddbrand.SelectedItem.Value);
        cmd1.Parameters.AddWithValue("@pmin", textpricemin.Text);
        cmd1.Parameters.AddWithValue("@pmax", textpricemax.Text);
        SqlDataReader rdr = cmd1.ExecuteReader();
        //rdr.Read();
        if (rdr.HasRows)
        {
            DataTable dt = new DataTable();
            dt.Load(rdr, LoadOption.PreserveChanges);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            imigpanel.Visible = true;
        }
        else 
        {
            Response.Write("<script>alert('For your budget in this brand cars not available')</script>");

        }
    }
    protected void btndotestdrive_Click(object sender, EventArgs e)
    {
        Response.Redirect("signin.aspx");
    }
    protected void btnbuyacar_Click(object sender, EventArgs e)
    {
        Response.Redirect("signin.aspx");
    }
    protected void buttonclick(object sender, EventArgs e)
    {
        P1.Visible = true;
        imigpanel.Visible = false;
    }


    protected void ddbrand_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}