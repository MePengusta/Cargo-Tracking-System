using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class CargoSystem : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void warehouseButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("warehouses.aspx");
    }
    protected void orderButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("orderCargo.aspx");
    }
    protected void clientsButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("clients.aspx");
    }
    protected void viewButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewCargo.aspx");
    }
    protected void menuBut_Click(object sender, EventArgs e)
    {
        Response.Redirect("CargoSystem.aspx");
    }
    protected void logoutButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.html");
    }
}
