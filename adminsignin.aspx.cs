using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminsignin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsignin_Click(object sender, EventArgs e)
    {
        if (txtsignin.Text=="Admin"&&txtpass1.Text=="admin@123")
        {
            Response.Redirect("adminupload.aspx");

        }
        else
        {
            lbldisp.Visible = true;
        }
    }
}