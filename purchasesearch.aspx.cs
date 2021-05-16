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

public partial class purchasesearch : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
        lbluserid.Text = Session["userid"].ToString();
        if (!IsPostBack)
        {
           
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("select distinct brand from car", con);
            con.Open();
            SqlDataReader rdr1 = cmd.ExecuteReader();
            // rdr1.Read();  
            dt.Load(rdr1, LoadOption.OverwriteChanges);

            ddbrand.DataSource = dt;
            ddbrand.DataTextField = "brand";
            ddbrand.DataBind();
            con.Close();

            DateTime now = DateTime.Now;
            lbldate.Text = now.ToShortDateString();
        }
    }
    protected void btncontinue_Click(object sender, EventArgs e)
    {
        Session["uid"] = lbluserid.Text;
        Session["bid"] = ddbrand.SelectedItem.Text;
        Session["mid"] = ddmodel.SelectedItem.Text;
        Session["d1"] = lbldate.Text;

        SqlCommand cmd7 = new SqlCommand("insert purchase (userid2,carid2,date2,pricetax)values (@uid,@c1,@d1,@pt1)", con);
        con.Open();
        cmd7.Parameters.Add(new SqlParameter("@uid", SqlDbType.NVarChar, 25));
        cmd7.Parameters.Add(new SqlParameter("@c1", SqlDbType.NVarChar, 25));
        cmd7.Parameters.Add(new SqlParameter("@d1", SqlDbType.Date));
        cmd7.Parameters.Add(new SqlParameter("@pt1", SqlDbType.NVarChar,25));
        cmd7.Parameters["@uid"].Value = lbluserid.Text;
        cmd7.Parameters["@c1"].Value = lblcarid.Text;
        cmd7.Parameters["@d1"].Value = lbldate.Text;

        cmd7.Parameters["@pt1"].Value = lblprice.Text;
        int res = cmd7.ExecuteNonQuery();
        con.Close();
        if (res > 0)
        {
            Response.Redirect("Paymentsucess.aspx");
        }

    }
    protected void ddbrand_SelectedIndexChanged(object sender, EventArgs e)
    {

        lblprice.Text = "";
        DataTable dt1 = new DataTable();
        SqlCommand cmd1 = new SqlCommand("select distinct model from car where brand=@brand1", con);
        cmd1.Parameters.AddWithValue("@brand1", ddbrand.SelectedItem.Text);
        con.Open();
        SqlDataReader rdr1 = cmd1.ExecuteReader();
      
        dt1.Load(rdr1, LoadOption.OverwriteChanges);

        ddmodel.DataSource = dt1;
        ddmodel.DataTextField = "Model";
        ddmodel.DataBind();
        con.Close();

    }
    protected void ddmodel_SelectedIndexChanged(object sender, EventArgs e)
    {
               
            lblprice.Text = "";
            SqlCommand cmd4 = new SqlCommand("select distinct carid from car where model=@mod and brand=@barn", con);
            con.Open();
            cmd4.Parameters.AddWithValue("@mod", ddmodel.Text);
            cmd4.Parameters.AddWithValue("@barn", ddbrand.Text);
            SqlDataReader rdr4 = cmd4.ExecuteReader();
            rdr4.Read();
            lblcarid.Text = (string)rdr4[0];
            con.Close();
            SqlCommand cmd5 = new SqlCommand("select (0.1236*Price)+price from car where carid=@car1", con);
            con.Open();
            cmd5.Parameters.AddWithValue("@car1", lblcarid.Text);
            SqlDataReader rdr5 = cmd5.ExecuteReader();
            rdr5.Read();
            lblprice.Text = rdr5[0].ToString();
            con.Close();
                
        
        
    }
    protected void btnsignout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signin.aspx");
    }
}