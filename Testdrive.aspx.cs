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
public partial class Testdrive : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        datech.Text = DateTime.Now.ToShortDateString();
        lbluserid1.Text = Session["userid"].ToString();

        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("select distinct brand from car", con);
            con.Open();
            SqlDataReader rdr1 = cmd.ExecuteReader();

            dt.Load(rdr1, LoadOption.OverwriteChanges);

            ddbrand.DataSource = dt;
            ddbrand.DataTextField = "brand";
            ddbrand.DataBind();
            con.Close();
        }

    }
    protected void ddbrand_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd2 = new SqlCommand("select distinct model from car where brand=@brand1", con);
        con.Open();
        cmd2.Parameters.AddWithValue("@brand1", ddbrand.SelectedItem.Text);
        SqlDataReader rdr2 = cmd2.ExecuteReader();
        DataTable dt2 = new DataTable();
        dt2.Load(rdr2, LoadOption.PreserveChanges);
        ddmodel.DataSource = dt2;
        ddmodel.DataTextField = "model";
        ddmodel.DataBind();
        con.Close();


    }
    protected void btnfixdrive_Click(object sender, EventArgs e)
    {
       
            Session["bid"] = ddbrand.SelectedItem.Text;
            Session["mid"] = ddmodel.SelectedItem.Text;
            Session["date"] = txtdate1.Text;
            Session["time1"] = ddtime.SelectedItem.Text;

            string d = txtdate1.Text;
            SqlCommand cmd7 = new SqlCommand("insert testdrive (userid1,carid1,date1,scheduledtime)values (@u1,@c1,@d1,@st1)", con);
            con.Open();
            cmd7.Parameters.Add(new SqlParameter("@u1", SqlDbType.NVarChar, 25));
            cmd7.Parameters.Add(new SqlParameter("@c1", SqlDbType.NVarChar, 25));
            cmd7.Parameters.Add(new SqlParameter("@d1", SqlDbType.Date));
            cmd7.Parameters.Add(new SqlParameter("@st1", SqlDbType.NVarChar, 15));
            cmd7.Parameters["@u1"].Value = lbluserid1.Text;
            cmd7.Parameters["@c1"].Value = lblcarid.Text;
            cmd7.Parameters["@d1"].Value = d;
            cmd7.Parameters["@st1"].Value = ddtime.SelectedItem.Text;
            cmd7.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Scheduled.aspx");
        }
      
    
    protected void btnsignout_Click(object sender, EventArgs e)
    {
        Server.Transfer("signin.aspx");

    }
    protected void ddmodel_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd4 = new SqlCommand("select distinct carid from car where model=@mod and brand=@barn", con);
        con.Open();
        cmd4.Parameters.AddWithValue("@mod", ddmodel.Text);
        cmd4.Parameters.AddWithValue("@barn", ddbrand.Text);
        SqlDataReader rdr4 = cmd4.ExecuteReader();
        rdr4.Read();
        lblcarid.Text = (string)rdr4[0];
        con.Close();
    }
    protected void calender1_SelectionChanged(object sender, EventArgs e)
    {
        //string d = txtdate1.Text;

        //SqlCommand cmd5 = new SqlCommand("select schtime from dummy where schtime not in (select scheduledtime from testdrive where carid1=@car and date1=@dat)", con);
        //con.Open();
        //cmd5.Parameters.AddWithValue("@car", lblcarid.Text);
        //cmd5.Parameters.AddWithValue("@dat", d);
        //SqlDataReader rdr5 = cmd5.ExecuteReader();
        //DataTable dt5 = new DataTable();
        //dt5.Load(rdr5, LoadOption.PreserveChanges);
        //ddtime.DataSource = dt5;
        //ddtime.DataTextField = "schtime";
        //ddtime.DataBind();
        //con.Close();
    }
    protected void txtdate1_TextChanged(object sender, EventArgs e)
    {
        string d = txtdate1.Text;
        

        SqlCommand cmd5 = new SqlCommand("select schtime from dummy where schtime not in (select scheduledtime from testdrive where carid1=@car and date1=@dat)", con);
        con.Open();
        cmd5.Parameters.AddWithValue("@car", lblcarid.Text);
        cmd5.Parameters.AddWithValue("@dat", d);
        SqlDataReader rdr5 = cmd5.ExecuteReader();
        DataTable dt5 = new DataTable();
        dt5.Load(rdr5, LoadOption.PreserveChanges);
        //ddtime.Text = "";
        ddtime.DataSource = dt5;
        ddtime.DataTextField = "schtime";
        ddtime.DataBind();
        con.Close();
    }
    protected void ddtime_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}