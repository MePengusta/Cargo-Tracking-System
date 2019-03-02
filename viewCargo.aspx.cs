using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class viewOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void menuBut_Click(object sender, EventArgs e)
    {
        Response.Redirect("CargoSystem.aspx");
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
    protected void logoutButton_Click(object sender, EventArgs e) {

        Response.Redirect("index.html");
    }
    protected void orderGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        toList.Items.Clear();
        string id = orderGrid.SelectedRow.Cells[1].Text;
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "select * from ordersTable where ID = @testID ";
        string locations = "select place from warehouseTable";
        OleDbCommand cmd = new OleDbCommand(query, con);
        OleDbCommand cmd2 = new OleDbCommand(locations, con);
        cmd.Parameters.AddWithValue("@testID", id);
        con.Open();
        OleDbDataReader rdr = cmd.ExecuteReader();
        OleDbDataReader rdr2 = cmd2.ExecuteReader();
        using (rdr)
        {
            while (rdr.Read())
            {
                idBox.Text = rdr["ID"].ToString();
                orderBox.Text = rdr["orderID"].ToString();
                fromText.Text = rdr["fromLocation"].ToString();
                priceBox.Text = rdr["price"].ToString();

            }

        }
        using (rdr2)
        {
            while (rdr2.Read())
            {
                toList.Items.Add(rdr2["place"].ToString());

            }
        }

        con.Close();

    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
        string id = orderGrid.SelectedRow.Cells[1].Text;
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "update ordersTable set orderID=@testID,fromLocation=@from,toLocation=@to,price=@price WHERE ID = @id ";
        OleDbCommand cmd = new OleDbCommand(query, con);

        cmd.Parameters.AddWithValue("@testID", orderBox.Text);
        cmd.Parameters.AddWithValue("@from", fromText.Text);
        cmd.Parameters.AddWithValue("@to", toList.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@price", priceBox.Text);
        cmd.Parameters.AddWithValue("@id", id);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("Edit Complete !");

        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex);
        }
        orderGrid.DataBind();
        Panel3.Visible = false;
    }
    protected void deleteButton_Click(object sender, EventArgs e)
    {
        string id = orderGrid.SelectedRow.Cells[1].Text;
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "delete from ordersTable where ID = @id";
        OleDbCommand cmd = new OleDbCommand(query, con);
        cmd.Parameters.AddWithValue("@id", id);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("Delete Successful");
        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex);
        }
        orderGrid.DataBind();
        Panel3.Visible = false;
    }

    
}