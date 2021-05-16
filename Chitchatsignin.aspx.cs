using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.SqlTypes;


public partial class Chitchatsignin : System.Web.UI.Page
{
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");

    }
    protected void btnsignin_Click(object sender, EventArgs e)
    {
        Session["userid"] = txtuserid.Text;
        Session["pass"] = txtpass.Text;
        SqlCommand cmd = new SqlCommand("Select userid,password1 from person Where userid=@uid and password1=@pass1", con);
       
       // SqlCommand cmd = new SqlCommand("select userid,password1 from person where userid=@uid and password1=(select CAST(HASHBYTES('MD5','"+txtpass.Text+"'"+")as Varchar(max)))  ", con);
        con.Open();
        cmd.Parameters.AddWithValue("@uid", txtuserid.Text);
        cmd.Parameters.AddWithValue("@pass1", txtpass.Text);
       
      

        SqlDataReader rdr = cmd.ExecuteReader();
        rdr.Read();
        if (rdr.HasRows)
        {
            rdr.Close();
            SqlCommand cmd1 = new SqlCommand("Select userid,password1 from person where userid=@uid and password1=@pass1", con);
            cmd1.Parameters.AddWithValue("@uid", txtuserid.Text);
            cmd1.Parameters.AddWithValue("@pass1", txtpass.Text);
            
            SqlDataReader rdr1 = cmd1.ExecuteReader();
            rdr1.Read();
            if (rdr1.HasRows)
            {
                Session["userid"] = txtuserid.Text;


                {
                    Response.Redirect("chitchathome1.aspx");
                }

            }
            else
            {
                lblinval1.Visible = true;
            }
        }
        else
        {
            lblinval.Visible = true;
            
        }

        
        con.Close();

    }
    }
