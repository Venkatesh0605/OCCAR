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

public partial class signin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    { SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
      
    //    SqlCommand cmd = new SqlCommand("select userid,password1 from userdetails", con);
    //    con.Open();
    //    cmd.Parameters.AddWithValue("userid", txtuserid.Text);
    //    cmd.Parameters.AddWithValue("password1", txtpass.Text);

    //    SqlDataReader rdr = cmd.ExecuteReader();
    //    rdr.Read();
    //    if (rdr.HasRows)
    //    {
    //        Session["userid"] = txtuserid.Text;
    //        if (rbbtn.SelectedItem.Text == "Do TestDrive")
    //        {
    //            Server.Transfer("Testdrive.aspx");
    //        }
    //        else
    //        {
    //            Server.Transfer("purchasesearch.aspx");

    //        }
    //    }
        

        
    //    con.Close();

    }

    protected void btnnewsignup_Click(object sender, EventArgs e)
    {
        panelid.Visible = true;
       
    }
    protected void btnregister_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select * from person where userid=@uid", con);
        cmd.Parameters.AddWithValue("@uid", txtid.Text);
        con.Open();
        SqlDataReader rdr1 = cmd.ExecuteReader();
        rdr1.Read();
        if (rdr1.HasRows)
        {
            

            lblvis.Visible = true;

        }
        else
        {
            rdr1.Close();

           SqlCommand cmd7 = new SqlCommand("insert person (userid,firstname,lastname,password1,mobileno,email,addressline,pincode,Personimage) values (@userid1,@fname,@lname,@pass1,@mobno,@email,@adress,@pin,@img)", con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            } int len = Fu1.PostedFile.ContentLength;
            byte[] img = new byte[len];
            Fu1.PostedFile.InputStream.Read(img, 0, len);
            cmd7.Parameters.Add(new SqlParameter("@userid1", SqlDbType.NVarChar, 25));
            cmd7.Parameters.Add(new SqlParameter("@fname", SqlDbType.NVarChar, 25));
            cmd7.Parameters.Add(new SqlParameter("@lname", SqlDbType.NVarChar, 25));
            cmd7.Parameters.Add(new SqlParameter("@pass1", SqlDbType.NVarChar, 25));
            cmd7.Parameters.Add(new SqlParameter("@mobno", SqlDbType.NVarChar, 25));
            cmd7.Parameters.Add(new SqlParameter("@email", SqlDbType.NVarChar, 25));
            cmd7.Parameters.Add(new SqlParameter("@adress", SqlDbType.NVarChar, 25));
            cmd7.Parameters.Add(new SqlParameter("@pin", SqlDbType.NVarChar, 25));
            cmd7.Parameters.Add(new SqlParameter("@img", SqlDbType.VarBinary));

            cmd7.Parameters["@userid1"].Value = txtid.Text;
            cmd7.Parameters["@fname"].Value = Txtfname.Text;
            cmd7.Parameters["@lname"].Value = Txtlname.Text;
            cmd7.Parameters["@pass1"].Value = txtpass1.Text;
            cmd7.Parameters["@mobno"].Value = txtmobile.Text;
            cmd7.Parameters["@email"].Value = Txtemail.Text;
            cmd7.Parameters["@adress"].Value = Txtaddress.Text;
            cmd7.Parameters["@pin"].Value = Txtpin.Text;
            cmd7.Parameters["@img"].Value = img;
           
            int res = cmd7.ExecuteNonQuery();
           
            if (res > 0)
            {
                lblvis1.Visible = true;
                txtid.Text = "";
                Txtfname.Text = "";
                Txtlname.Text = "";
                txtpass1.Text = "";
                Txtcpass.Text = "";
                txtmobile.Text = "";
                Txtemail.Text = "";
                Txtaddress.Text = "";
                Txtpin.Text = "";
            }
            else if (res < 0)
            {
                Response.Write("<Script>alert('You are not Registered.Please Register again') </script>");
            }
            con.Close();
        }
    }
    protected void btnsignin_Click(object sender, EventArgs e)
    {
       // SqlCommand cmd = new SqlCommand("Select userid,password from person Where userid=@uid and password=(Select HASHBYTES('MD5','"+txtpass.Text+"') as varchar)",con);
        SqlCommand cmd = new SqlCommand("Select userid,password1 from person Where userid=@uid and password1=@pid",con);
      
       // SqlCommand cmd = new SqlCommand("select userid,password1 from person where userid=@uid and password1=(select CAST(HASHBYTES('MD5','"+txtpass.Text+"'"+")as Varchar(max)))  ", con);
        con.Open();
        cmd.Parameters.AddWithValue("@uid", txtuserid.Text);
        cmd.Parameters.AddWithValue("@pid", txtpass.Text);
      
       
      

        SqlDataReader rdr = cmd.ExecuteReader();
        rdr.Read();
        if (rdr.HasRows)
        {
           Session["userid"] = txtuserid.Text;
           Session["pass"] = txtpass.Text;
            try
            {
                if (rbbtn.SelectedItem.Text == "Do TestDrive")
                {
                    Response.Redirect("Testdrive.aspx");
                }
                else
                {
                    Response.Redirect("purchasesearch.aspx");

                }
            }
            catch
            {
                Response.Write("<script>alert('select any one')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Invalid User id or Pass Word ')</script>");
            
        }

        
        con.Close();

    }

    protected void btnchangepass_Click(object sender, EventArgs e)
    {
        panelid.Visible = false;

    }

    protected void txtid_TextChanged(object sender, EventArgs e)
    {
        

       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        panelid.Visible = false;
        lblvis1.Visible = false;
    }
}

