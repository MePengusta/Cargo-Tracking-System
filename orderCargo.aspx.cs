using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
public partial class orderCargo : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "select place from warehouseTable'";
        string selectQuery = "select nameSurname from clientList";
        OleDbCommand cmd = new OleDbCommand(query, con);
        OleDbCommand cmd2 = new OleDbCommand(selectQuery, con);
        con.Open();
        OleDbDataReader rdr = cmd.ExecuteReader();
        OleDbDataReader rdr2 = cmd2.ExecuteReader();
        while (rdr.Read()) {

            fromList.Items.Add(rdr["place"].ToString());
            toList.Items.Add(rdr["place"].ToString());
            
        
        }
        while (rdr2.Read())
        {
            clientList.Items.Add(rdr2["nameSurname"].ToString());
        }

      
        con.Close();

    }


    protected void sendButton_Click(object sender, EventArgs e)
    {
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "insert into ordersTable (orderID,fromLocation,toLocation,price,clientName) values (@orderID,@fromLocation,@toLocation,@price,@client)";
        OleDbCommand cmd = new OleDbCommand(query, con);
        cmd.Parameters.AddWithValue("@orderID", orderidText.Text);
        cmd.Parameters.AddWithValue("@fromLocation", fromList.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@toLocation", toList.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@price", priceBox.Text);
        cmd.Parameters.AddWithValue("@client", clientList.SelectedItem.Text);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            lblinfo.Text = "Order is saved!";
        }
        catch (Exception ex)
        {

            lblinfo.Text = ex.Message;
        }
    }

    protected void wherehouseBut_Click1(object sender, EventArgs e)
    {
        Response.Redirect("warehouses.aspx");
    }

    protected void orderBut_Click(object sender, EventArgs e)
    {
        Response.Redirect("orderCargo.aspx");
    }
    protected void clientsBut_Click1(object sender, EventArgs e)
    {
        Response.Redirect("clients.aspx");
    }

    protected void viewButton_Click1(object sender, EventArgs e)
    {
        Response.Redirect("viewCargo.aspx");
    }
    protected void butLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.html");
    }
    protected void menuBut_Click(object sender, EventArgs e)
    {
        Response.Redirect("CargoSystem.aspx");
    }
}