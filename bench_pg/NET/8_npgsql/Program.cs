using Npgsql;

using Core8Npgsql;
using Core8Npgsql.Models;
using Core8Npgsql.Models.Responses;

var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

var connStr = builder.Configuration.GetConnectionString("NpgsqlConnection");
// var conn = new NpgsqlConnection(connStr);
// await conn.OpenAsync();
// var npgSqlConn = new NpgsqlConn(connStr!);

app.MapGet("/retailers", async () =>
{
    int rowsRead = 0;
    List<Retailer> retailers = new List<Retailer>();
    
    // open the connection (every time!?)
    var conn = new NpgsqlConnection(connStr);
    await conn.OpenAsync();

    // get the (cached) connection
    // var conn = await npgSqlConn.GetConn();
    
    // Retrieve all rows
    await using (var cmd = new NpgsqlCommand("SELECT * FROM retailer", conn))
    await using (var reader = await cmd.ExecuteReaderAsync())
    {
        while (await reader.ReadAsync())
        {
            retailers.Add(new Retailer()
            {
                Id = Convert.ToInt32(reader.GetDecimal(0)),
                GSTIN = reader.GetString(1),
                BusinessName = reader.GetString(2),
                ContactPerson = reader.GetString(3),
                ContactNumber = Convert.ToInt32(reader.GetDecimal(4)),
                ContactAddress = reader.GetString(5),
                ContactEmailId = reader.GetString(6),
                Status = reader.GetString(7),
                OutletLimit = Convert.ToInt32(reader.GetDecimal(8)),
            });
            
            rowsRead++;
        }
    }

    // Console.WriteLine($"Read {rowsRead} retailers from DB");
    
    conn.Close();

    return retailers;
});

app.Run("Retailer API running...");
