using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;

public partial class warehouses : System.Web.UI.Page
{
    
    private string newID;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submitButton_Click(object sender, EventArgs e)
    {

        OleDbConnection conn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "insert into warehouseTable (place,supervisorName,capacity,phoneNo) values (@place,@supervisorName,@capacity,@phoneNo)";
        OleDbCommand cmd = new OleDbCommand(query, conn);
        cmd.Parameters.AddWithValue("@place", (ddlCity.SelectedItem.Text + "-" + txtPlace.Text));
        cmd.Parameters.AddWithValue("@supervisorName", supervisorBox.Text);
        cmd.Parameters.AddWithValue("@capacity", capacityBox.Text);
        cmd.Parameters.AddWithValue("@phoneNo", phoneBox.Text);
        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            lblinfo.Text = "Record has been saved!";
        }
        catch (Exception ex)
        {

            Response.Write("Error : " + ex);
        }

        warehouseGrid.DataBind();

        ddlCity.SelectedIndex = 0;
        lblinfo.Text = txtPlace.Text = supervisorBox.Text = capacityBox.Text = phoneBox.Text = "";

    }
    protected void warehouseGrid_SelectedIndexChanged1(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#editWarehousePanel';", true);
        editPanel.Visible = true;
        string id = warehouseGrid.SelectedRow.Cells[1].Text;
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "select * from warehouseTable where ID = @testID ";
        OleDbCommand cmd = new OleDbCommand(query, con);
        cmd.Parameters.AddWithValue("@testID", id);
        con.Open();
        OleDbDataReader rdr = cmd.ExecuteReader();
        using (rdr)
        {
            while (rdr.Read())
            {
                editPlaceBox.Text = rdr["place"].ToString();
                editSupervisorBox.Text = rdr["supervisorName"].ToString();
                editCapacityBox.Text = rdr["capacity"].ToString();
                editPhoneBox.Text = rdr["phoneNo"].ToString();

            }

        }

        con.Close();
        warehouseGrid.DataBind();
    }
    protected void editSubmitButton_Click(object sender, EventArgs e)
    {
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string id = warehouseGrid.SelectedRow.Cells[1].Text;
        string query = "update warehouseTable set place=@place,supervisorName=@sName,capacity=@capacity WHERE ID = @id ";
        OleDbCommand cmd = new OleDbCommand(query, con);
        cmd.Parameters.AddWithValue("@place", editPlaceBox.Text);
        cmd.Parameters.AddWithValue("@sName", editSupervisorBox.Text);
        cmd.Parameters.AddWithValue("@capacity", editCapacityBox.Text);
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
        warehouseGrid.DataBind();
        editPanel.Visible = false;
    }
    protected void deleteButton_Click(object sender, EventArgs e)
    {
        string id = warehouseGrid.SelectedRow.Cells[1].Text;
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "delete from warehouseTable where ID = @id";
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
        warehouseGrid.DataBind();
        editPanel.Visible = false;
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
    protected void warehouseButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("warehouses.aspx");
    }

    protected void logoutButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.html");
    }
    protected void menuBut_Click(object sender, EventArgs e)
    {
        Response.Redirect("CargoSystem.aspx");
    }
}