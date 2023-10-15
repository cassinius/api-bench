using Npgsql;
using Dapper;

using Core8Dapper.Models;
using Core8Dapper.Models.Responses;

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
    var retailers = conn.Query<Retailer>(sql).AsList();

    Console.WriteLine("blahoo");

    conn.Close();

    return retailers;
});

// app.MapGet("/retailer/{id}", async (int id) =>
// {
//     int rowsRead = 0;
//     // List<Retailer> retailers = new List<Retailer>();
//     Retailer retailer = null;
//
//     // open the connection (every time!?)
//     var conn = new NpgsqlConnection(connStr);
//     await conn.OpenAsync();
//
//     // Retrieve retailer
//     await using (var cmd = new NpgsqlCommand("SELECT * FROM retailer WHERE id=@id LIMIT 1", conn))
//     {
//         cmd.Parameters.AddWithValue("id", id);
//
//         await using (var reader = await cmd.ExecuteReaderAsync())
//         {
//             while (await reader.ReadAsync())
//             {
//                 retailer = new Retailer()
//                 {
//                     Id = Convert.ToInt32(reader.GetDecimal(0)),
//                     GSTIN = reader.GetString(1),
//                     BusinessName = reader.GetString(2),
//                     ContactPerson = reader.GetString(3),
//                     ContactNumber = Convert.ToInt32(reader.GetDecimal(4)),
//                     ContactAddress = reader.GetString(5),
//                     ContactEmailId = reader.GetString(6),
//                     Status = reader.GetString(7),
//                     OutletLimit = Convert.ToInt32(reader.GetDecimal(8)),
//                 };
//
//                 rowsRead++;
//             }
//         }
//     }
//
//     // Console.WriteLine($"Read {rowsRead} retailers from DB");
//
//     conn.Close();
//
//     return retailer;
// });

app.Run("Retailer API running...");
