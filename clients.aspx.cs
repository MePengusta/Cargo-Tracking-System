using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;

public partial class clients : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void clientGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        editPanel.Visible = true;
        string id = clientGrid.SelectedRow.Cells[1].Text;
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "select * from clientList where ID = @testID ";
        OleDbCommand cmd = new OleDbCommand(query, con);
        cmd.Parameters.AddWithValue("@testID", id);
        con.Open();
        OleDbDataReader rdr = cmd.ExecuteReader();
        using (rdr)
        {
            if (rdr.Read())
            {
                idBox.Text = rdr["ID"].ToString();
                nameEditBox.Text = rdr["nameSurname"].ToString();
                phoneEditBox.Text = rdr["phoneNumber"].ToString();
                addressEditBox.Text = rdr["address"].ToString();
                mailEditBox.Text = rdr["mailAddress"].ToString();
            }
        }
        con.Close();
    }
    protected void editSubmitButton_Click(object sender, EventArgs e)
    {
        string id = clientGrid.SelectedRow.Cells[1].Text;
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "update clientList set nameSurname=@name,phoneNumber=@pnumber,address=@address,mailAddress=@mail WHERE ID = @id ";
        OleDbCommand cmd = new OleDbCommand(query, con);

        cmd.Parameters.AddWithValue("@name", nameEditBox.Text);
        cmd.Parameters.AddWithValue("@pnumber", phoneEditBox.Text);
        cmd.Parameters.AddWithValue("@address", addressEditBox.Text);
        cmd.Parameters.AddWithValue("@mail", mailEditBox.Text);
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
        clientGrid.DataBind();
        editPanel.Visible = false;
    }
    protected void deleteButton_Click(object sender, EventArgs e)
    {
        string id = clientGrid.SelectedRow.Cells[1].Text;
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "delete from clientList where ID = @id";
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
        clientGrid.DataBind();
        editPanel.Visible = false;
    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
        editPanel.Visible = false;
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("db.mdb") + ";Persist Security Info=False");
        string query = "insert into clientList (nameSurname,phoneNumber,address,mailAddress) values (@ns,@phone,@address,@mailAddress)";
        OleDbCommand cmd = new OleDbCommand(query, con);
        cmd.Parameters.AddWithValue("@ns", nameBox.Text);
        cmd.Parameters.AddWithValue("@fromLocation", phoneBox.Text);
        cmd.Parameters.AddWithValue("@toLocation", addressBox.Text);
        cmd.Parameters.AddWithValue("@price", mailBox.Text);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("Successful");
            clientGrid.DataBind();

        }
        catch (Exception ex)
        {
            Response.Write("Error : " + ex);
        }
    }

    protected void butWarehouse_Click(object sender, EventArgs e)
    {
        Response.Redirect("warehouses.aspx");
    }
    protected void butOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("orderCargo.aspx");
    }
    protected void butClients_Click(object sender, EventArgs e)
    {
        Response.Redirect("clients.aspx");
    }
    protected void butView_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewCargo.aspx");
    }
    protected void butLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.html");
    }
    protected void mainBut_Click(object sender, EventArgs e)
    {
        Response.Redirect("CargoSystem.aspx");
    }
}