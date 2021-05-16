using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using System.Configuration;
using System.Data.SqlClient;


public partial class Profile1 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Session["userid"].ToString();
        image.ImageUrl = "~/Picture.ashx?userid=" + id;
if(!IsPostBack){
    
    SqlCommand cmd = new SqlCommand("Select firstname,lastname,mobileno,email,addressline from person where userid=@uid", con);
    con.Open();
        cmd.Parameters.AddWithValue("@uid",id);
        SqlDataReader rdr=cmd.ExecuteReader();
        rdr.Read();
        if (rdr.HasRows)
        {
            txtfname.Text = rdr[0].ToString();
            txtlname.Text = rdr[1].ToString();
            txtmobile.Text = rdr[2].ToString();
            txtemail.Text = rdr[3].ToString();
            txtaddress.Text = rdr[4].ToString();

        }
        con.Close();
    }
    


    }
    protected void btncpass_Click(object sender, EventArgs e)
    {
        p1.Visible = true;
    }
    protected void btnupdate1_Click(object sender, EventArgs e)
    {
        string id = Session["userid"].ToString();
     
        SqlCommand cmd7 = new SqlCommand("update person set firstname=@fname,Lastname=@lname,Mobileno=@mob,email=@email1,addressline=@adl,password1=@pass where userid=@id", con);

        con.Open();
        cmd7.Parameters.Add(new SqlParameter("@fname", SqlDbType.NVarChar, 25));
        cmd7.Parameters.Add(new SqlParameter("@lname", SqlDbType.NVarChar, 25));
        cmd7.Parameters.Add(new SqlParameter("@mob", SqlDbType.NVarChar, 25));
        cmd7.Parameters.Add(new SqlParameter("@email1", SqlDbType.NVarChar, 25));
        cmd7.Parameters.Add(new SqlParameter("@adl", SqlDbType.NVarChar, 25));
       cmd7.Parameters.Add(new SqlParameter("@id",SqlDbType.NVarChar,25));
       cmd7.Parameters.Add(new SqlParameter("@pass", SqlDbType.NVarChar, 30));
       cmd7.Parameters["@pass"].Value = Session["pass"].ToString();
       cmd7.Parameters["@id"].Value=Session["userid"].ToString();
       cmd7.Parameters["@fname"].Value = txtfname.Text;
        cmd7.Parameters["@lname"].Value = txtlname.Text;
        cmd7.Parameters["@mob"].Value = txtmobile.Text;
        cmd7.Parameters["@email1"].Value = txtemail.Text;
        cmd7.Parameters["@adl"].Value = txtaddress.Text;

        int res = cmd7.ExecuteNonQuery();
        con.Close();
        if (res > 0)
        {
         
            Response.Write("<script>alert('uploaded successfully')</script>");
        }
        
    }
    protected void btnupdate_Click(object sender, EventArgs e)
{
    SqlCommand cmd = new SqlCommand("Select userid,password1 from person Where userid=@uid and Password1=(Select HASHBYTES('MD5','" + txtcpass.Text + "') as varchar)", con);
        con.Open();
        cmd.Parameters.AddWithValue("@uid",Session["userid"].ToString());
       // cmd.Parameters.AddWithValue("@pass",txtcpass.Text);
        SqlDataReader rdr=cmd.ExecuteReader();
        rdr.Read();
        if(rdr.HasRows)
        {
            rdr.Close();
            SqlCommand cmd1=new SqlCommand("update person set password1=@pass2 where userid=@uid1",con);
            cmd1.Parameters.AddWithValue("@uid1",Session["userid"].ToString());
            cmd1.Parameters.AddWithValue("@pass2", txtcpass2.Text);
          
            int n=cmd1.ExecuteNonQuery();
            if(n>0)
            {
                lblvis1.Visible = true;
                btnupdate.Visible = false;
            }
        }
}
    protected void btndeactivate_Click(object sender, EventArgs e)
    {
        SqlCommand cmd1 = new SqlCommand("update person set active='false' where userid=@uid", con);
        con.Open();

        cmd1.Parameters.AddWithValue("@uid", Session["userid"].ToString());
        int i = cmd1.ExecuteNonQuery();

        SqlCommand cmd2 = new SqlCommand("delete chit where userid4=@uid", con);
        cmd2.Parameters.AddWithValue("@uid", Session["userid"].ToString());
        int m = cmd2.ExecuteNonQuery();

        SqlCommand cmd3 = new SqlCommand("delete following where followingid=@uid", con);
        cmd3.Parameters.AddWithValue("@uid", Session["userid"].ToString());
        int n = cmd3.ExecuteNonQuery();
        con.Close();

        SqlCommand cmd4 = new SqlCommand("delete following where followingid=@uid", con);
        cmd4.Parameters.AddWithValue("@uid", Session["userid"].ToString());
        Response.Write("<script>alert('Deactivated Successfully')</script>");
        Response.Redirect("signin.aspx");


    }
    protected void btnupdate11_Click(object sender, EventArgs e)
    {
        string id = Session["userid"].ToString();

        image.ImageUrl = "~/Picture.ashx?userid=" + id;
        int len = fu1.PostedFile.ContentLength;
        byte[] img = new byte[len];
        fu1.PostedFile.InputStream.Read(img, 0, len);
        SqlCommand cmd7 = new SqlCommand("update person set Personimage=@i,password1=@pass where userid=@id", con);
        con.Open();
        cmd7.Parameters.Add(new SqlParameter("@i", SqlDbType.VarBinary));
        cmd7.Parameters.Add(new SqlParameter("@id", SqlDbType.NVarChar, 25));
        cmd7.Parameters.Add(new SqlParameter("@pass",SqlDbType.NVarChar,30));
        cmd7.Parameters["@pass"].Value=Session["pass"].ToString();
        cmd7.Parameters["@id"].Value = Session["userid"].ToString();
        cmd7.Parameters["@i"].Value = img;
        int res = cmd7.ExecuteNonQuery();
        con.Close();
        if (res > 0)
        {

            Response.Redirect("profile1.aspx");
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("profile1.aspx");
    }
}
