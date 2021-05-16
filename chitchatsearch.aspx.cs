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

public partial class chitchatsearch : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            data();
        }
    }
   
    protected void gv2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        data(); 
        string usr = Session["userid"].ToString();
        Label lbluserid = (Label)gv2.Rows[e.RowIndex].FindControl("lbluserid");
        SqlCommand cmd2 = new SqlCommand("select userid3,followingid from following where userid3=@usr1 and followingid=@fid1", con);
        con.Open();
        cmd2.Parameters.AddWithValue("usr1", usr);
        cmd2.Parameters.AddWithValue("fid1", lbluserid.Text);
        SqlDataReader rdr = cmd2.ExecuteReader();
        rdr.Read();
        
        if (rdr.HasRows)
        {
            rdr.Close();
            Response.Write("<script>alert('Already Following')</script>");
           
        }
        
         else{
             rdr.Close();
             con.Close();
        SqlCommand cmd1 = new SqlCommand("insert following (userid3,followingid) values(@uid,@fid)", con);
        con.Open();
        cmd1.Parameters.AddWithValue("@fid", lbluserid.Text);
        cmd1.Parameters.AddWithValue("@uid", usr);
        int r = cmd1.ExecuteNonQuery();
        if (r > 0)
        {
            lblvis.Visible=true;
        }
        con.Close();
        data();
         }
    }
    public void data()
    {
        string val = Session["value"].ToString();
        string usr = Session["userid"].ToString();

        SqlCommand cmd = new SqlCommand("select userid,firstname,lastname,personimage from person where userid like @val+'%' and userid not in (select followingid from following where userid3=@usr1) and userid!=@usr1 and active='true'", con);
        cmd.Parameters.AddWithValue("@val", val);
        cmd.Parameters.AddWithValue("@usr1", usr);
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        gv2.DataSource = ds;
        gv2.DataBind();
    }
    protected void gv2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}