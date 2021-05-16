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

public partial class adminupload : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        try
        {
            int len = fuimage.PostedFile.ContentLength;
            byte[] img = new byte[len];
            fuimage.PostedFile.InputStream.Read(img, 0, len);
            SqlCommand cmd7 = new SqlCommand("insert car (brand,model,enginetype,price,description1,image1)values (@b,@m,@e,@p,@d,@i)", con);
            con.Open();
            cmd7.Parameters.Add(new SqlParameter("@b", SqlDbType.NVarChar, 10));
            cmd7.Parameters.Add(new SqlParameter("@m", SqlDbType.NVarChar, 10));
            cmd7.Parameters.Add(new SqlParameter("@e", SqlDbType.NVarChar, 10));
            cmd7.Parameters.Add(new SqlParameter("@p", SqlDbType.Money));
            cmd7.Parameters.Add(new SqlParameter("@d", SqlDbType.NVarChar, 100));
            cmd7.Parameters.Add(new SqlParameter("@i", SqlDbType.VarBinary));
            cmd7.Parameters["@b"].Value = textbrand.Text;
            cmd7.Parameters["@m"].Value = TextModel.Text;
            cmd7.Parameters["@e"].Value = ddengtype.SelectedItem.Text;
            cmd7.Parameters["@p"].Value = Textprice.Text;

            cmd7.Parameters["@d"].Value = TextDescription.Text;
            cmd7.Parameters["@i"].Value = img;
            int res = cmd7.ExecuteNonQuery();
            con.Close();
            if (res > 0)
            {
                textbrand.Text = "";
                TextDescription.Text = "";
                TextModel.Text = "";
                Textprice.Text = "";

                Response.Write("<script>alert('uploaded successfully')</script>");
            }

        }
    
    catch(Exception)
{
   lbldisp.Visible=true;

}
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminsignin.aspx");

    }
    protected void btnreport_Click(object sender, EventArgs e)
    {
        Server.Transfer("report.aspx");

    }
}