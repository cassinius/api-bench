using MySqlConnector;
using Dapper;
using Core8Dapper.Models;

var builder = WebApplication.CreateBuilder(args);

var connStr = builder.Configuration.GetConnectionString("MariaDB");

var app = builder.Build();

app.MapGet("/", () => "Retailer API up and running.");

app.MapGet("/api/retailers", async () =>
{
    MySqlConnection? conn = null;

    try
    {
        conn = new MySqlConnection(connStr);

        await conn.OpenAsync();

        string sql = "SELECT id, GSTIN, Business_name, Contact_person, Contact_number, Contact_address, Contact_emailId, Status, Outlet_limit FROM retailers";

        var retailers = await conn.QueryAsync<Retailer>(sql);

        return retailers;
    }
    catch (Exception ex)
    {
        Console.WriteLine(ex.Message);
        return null;
    }
    finally
    {
        conn?.Close();
    }
});

app.MapGet("/api/retailer/{id}", async (int id) =>
{
    MySqlConnection? conn = null;

    try
    {
        conn = new MySqlConnection(connStr);

        await conn.OpenAsync();

        string sql = "SELECT id, GSTIN, Business_name, Contact_person, Contact_number, Contact_address, Contact_emailId, Status, Outlet_limit FROM retailers WHERE id=@id LIMIT 1";

        var retailer = await conn.QueryAsync<Retailer>(sql, new { id });

        return retailer;
    }
    catch (Exception ex)
    {
        Console.WriteLine(ex.Message);
        return null;
    }
    finally
    {
        conn?.Close();
    }
});

Console.WriteLine("Listening on http://localhost:8000");
app.Run();