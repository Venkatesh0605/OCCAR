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

public partial class chitchathome1 : System.Web.UI.Page
{
   SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    
             
    protected void Page_Load(object sender, EventArgs e)
   {
       try
       {
           string id = Session["userid"].ToString();
           userimage.ImageUrl = "Picture.ashx?userid=" + id;

           if (!IsPostBack)
           {
               binddata();
               display();
           }

           lbldisplayuser.Text = Session["userid"].ToString();
       }
       catch (Exception)
       {
           Response.Write("<script>alert('Session time Out')</script>");
       }
    }
    public void display()
    {
           SqlCommand cmd1 = new SqlCommand("Select COUNT(message1) from chit where userid4=@uid4", con);
           con.Open();
           cmd1.Parameters.AddWithValue("@uid4", lbldisplayuser.Text);
           string rdr1 = cmd1.ExecuteScalar().ToString();
           lblchitcount.Text = rdr1;
           con.Close();

           SqlCommand cmd2 = new SqlCommand("Select COUNT(followingid) from following where userid3=@uid5", con);
           con.Open();
           cmd2.Parameters.AddWithValue("@uid5", lbldisplayuser.Text);
           string rdr2 = cmd2.ExecuteScalar().ToString();
           lblfollowingcount.Text = rdr2;
           con.Close();

           SqlCommand cmd3 = new SqlCommand("Select COUNT(userid3) from following where followingid=@fid", con);
           con.Open();
           cmd3.Parameters.AddWithValue("@fid", lbldisplayuser.Text);
           string rdr3 = cmd3.ExecuteScalar().ToString();
           lblfollowerscount.Text = rdr3;
           con.Close();

       }
      



 
   
  
    public void binddata()
    {
        lbldisplayuser.Text = Session["userid"].ToString();
        if (con.State==ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("select ID ,userid4 as USERID,message1 as CHITS,created as TIME from chit where userid4 in (select followingid from following where userid3=@uid3) or userid4=@uid3 order by Time desc", con);
        cmd.Parameters.AddWithValue("@uid3", lbldisplayuser.Text);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.SelectCommand = cmd;
        DataSet ds = new DataSet();
        adp.Fill(ds);
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        con.Close();
    }




  
    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        Button btn = (Button)GridView1.Rows[e.RowIndex].FindControl("btnedit");
        TextBox txtmsg = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        Label lbluid = (Label)GridView1.Rows[e.RowIndex].FindControl("lbluserid");
        Label lbltid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblid");
        if (lbluid.Text != Session["userid"].ToString())
        {
            btn.Visible = false;
        }
        con.Open();

        SqlCommand cmd = new SqlCommand("update chit set message1=@message where userid4=@id and ID=@tid", con);
        var a = txtmsg.Text;
        string b = lbluid.Text;
        int c = Convert.ToInt32(lbltid.Text);

        cmd.Parameters.AddWithValue("@message", a);
        cmd.Parameters.AddWithValue("@id", b);
        cmd.Parameters.AddWithValue("@tid", c);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        binddata();

    }
    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {

        GridView1.EditIndex = e.NewEditIndex;
        binddata();
    }
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        Label lbluserid = (Label)GridView1.Rows[e.RowIndex].FindControl("lbluserid");
        Label lblid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblid");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from chit where userid4=@id and ID=@tid", con);
        string b = lbluserid.Text;
        int c = Convert.ToInt32(lblid.Text);
        cmd.Parameters.AddWithValue("@id", b);
        cmd.Parameters.AddWithValue("@tid", c);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        binddata();
        display();
    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string r = Session["userid"].ToString();
            Label lbl = (Label)e.Row.FindControl("lbluserid");

            if (r != lbl.Text)
            {
                Button b1 = (Button)e.Row.FindControl("btnedit");
                Button b2 = (Button)e.Row.FindControl("btndelete");
                b1.Visible = false;
                b2.Visible = false;

                
            }
            if (r == lbl.Text)
            {
                Button b3 = (Button)e.Row.FindControl("btnreply");
                if (b3 != null)
                {
                    b3.Visible = false;
                }
            }

        }

        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    string r1 = Session["userid"].ToString();
        //    Label lbl1 = (Label)e.Row.FindControl("lbluserid");
        //    if (r1 == lbl1.Text)
        //    {
        //        Button b3 = (Button)e.Row.FindControl("btnreply");
        //        b3.Visible = false;
        //    }
        //}
    }
    protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        binddata();
    }
    protected void btnupdated_Click(object sender, EventArgs e)
    {
        try
        {
            if (t1.Text != "")
            {
                lbldisp.Visible = false;
                SqlCommand cmd = new SqlCommand("insert chit (userid4,message1) values (@uid,@msg)", con);
                con.Open();
                cmd.Parameters.Add(new SqlParameter("@uid", SqlDbType.NVarChar, 25));
                cmd.Parameters.Add(new SqlParameter("@msg", SqlDbType.NVarChar, 140));
                cmd.Parameters["@uid"].Value = lbldisplayuser.Text;
                cmd.Parameters["@msg"].Value = t1.Text;
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    t1.Text = "";
                    Response.Write("<script>alert('status updated')</script>");
                }
                else
                {
                    Response.Write("<script>alert('status not updated')</script>");
                }
                binddata();
                display();

            }
            else
            {
                lbldisp.Visible = true;
            }

        }
        catch         
        {
            Response.Write("<script>alert('Cannot Exceed 140 Characters')</script>");
        }
    }
   
   

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
