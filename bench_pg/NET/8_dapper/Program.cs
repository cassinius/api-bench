using Npgsql;
using Dapper;
// using Core8Dapper.Models;
// using Core8Dapper.Models.Responses;

var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

var connStr = builder.Configuration.GetConnectionString("NpgsqlConnection");
// var conn = new NpgsqlConnection(connStr);
// await conn.OpenAsync();
// var npgSqlConn = new NpgsqlConn(connStr!);

app.MapGet("/", () => "Retailer API up and running.");

app.MapGet("/retailers", async () =>
{
    // open the connection (every time!?)
    var conn = new NpgsqlConnection(connStr);
    await conn.OpenAsync();

    string sql = "SELECT * FROM retailer";
    var retailers = await conn.QueryAsync(sql);

    conn.Close();

    return retailers;
});

app.MapGet("/retailer/{id}", async (int id) =>
{
    // open the connection (every time!?)
    var conn = new NpgsqlConnection(connStr);
    await conn.OpenAsync();

    string sql = "SELECT * FROM retailer WHERE id=@id LIMIT 1";
    var retailer = await conn.QueryFirstAsync(sql, new { id });

    conn.Close();

    return retailer;
});

app.Run("Retailer API running...");