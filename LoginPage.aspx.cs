using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginPage : System.Web.UI.Page
{
    private string id = "admin";
    private string pw = "admin";
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void loginButton_Click(object sender, EventArgs e)
    {
        if (userID.Text == id && userPass.Text==pw)
        {

            Response.Redirect("CargoSystem.aspx");

        }
        else
            Response.Write("<script>alert('Invalid Login! Please Try Again')</script>");
            userID.Text = userPass.Text = "";
    }
    protected void butBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.html");
    }
}