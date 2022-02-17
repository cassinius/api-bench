using Core.Arango;
using Core.Arango.Serialization.Json;

using System.Text.Json;

using min6api.Models;

var builder = WebApplication.CreateBuilder(args);

// var arango = new ArangoContext("Server=http://localhost:8529;");
// new ArangoConfiguration
// {
//   Serializer = new ArangoNewtonsoftSerializer(new ArangoNewtonsoftCamelCaseContractResolver())
// });

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddArango((sp, config) =>
{
  config.ConnectionString = builder.Configuration.GetConnectionString("arango");
  config.Serializer = new ArangoJsonSerializer(new ArangoJsonDefaultPolicy());
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
  app.UseSwagger();
  app.UseSwaggerUI();
}

app.MapGet("/", () => new
{
  status = StatusCodes.Status200OK,
  message = ".NET Arango Retailer API up and running."
})
.WithName("RootStatus");

app.MapGet("/retailerByFunc/{id}", async (IArangoContext arango, string id) =>
{
  var retailer = await arango.Document.GetAsync<Retailer>("retailer_api", "retailers", id);
  return new
  {
    status = StatusCodes.Status200OK,
    retailer = retailer
  };
});

app.MapGet("/retailerByQuery/{id}", async (IArangoContext arango, string id) =>
{
  var retailer = await arango.Query.ExecuteAsync<Retailer>("retailer_api", $"FOR r IN retailers FILTER r._key == {id} RETURN r");
  return new
  {
    status = StatusCodes.Status200OK,
    retailer = retailer
  };
});

app.MapGet("/retailers/{limit}", async (IArangoContext arango, int limit) =>
{
  var retailers = await arango.Query.ExecuteAsync<Retailer>("retailer_api", $"FOR r IN retailers LIMIT {limit} RETURN r");
  return new
  {
    status = StatusCodes.Status200OK,
    count = retailers.Count(),
    retailers = retailers
  };
});

// IEnumerable<string> retailer_ids_100 = new string[] { "455","456","457","458","459","460","461","462","463","464","465","466","467","468","469","470","471","472","473","474","475","476","477","478","479","480","481","482","483","484","485","486","487","488","489","490","491","492","493","494","495","496","497","498","499","500","501","502","503","504","505","506","507","508","509","510","511","512","513","514","515","516","517","518","519","520","521","522","523","524","525","526","527","528","529","530","531","532","533","534","535","536","537","538","539","540","541","542","543","544","545","546","547","548","549","550","551","552","553","554" };
// IEnumerable<string> retailer_ids_30 = new string[] { "455","456","457","458","459","460","461","462","463","464","465","466","467","468","469","470","471","472","473","474","475","476","477","478","479","480","481","482","483","484" };
// IEnumerable<string> retailer_ids_10 = new string[] { "456","457","458","459","460","461","462","463","464" };

// app.MapGet("/retailers100/", async (IArangoContext arango) =>
// {
//   Console.WriteLine($"Retailer IDs: {JsonSerializer.Serialize(retailer_ids_100)}");
//   // arango.Document.GetManyAsync<Retailer>()
//   // var arangoDb = await arango.Database.GetAsync("retailer");
//   var retailers = await arango.Document.GetManyAsync<Retailer>("retailer_api", "retailers", retailer_ids_100);
//   return new
//   {
//     status = StatusCodes.Status200OK,
//     count = retailers.Count(),
//     retailers = retailers
//   };
// });

// app.MapGet("/retailers30/", async (IArangoContext arango) =>
// {
//   Console.WriteLine($"Retailer IDs: {JsonSerializer.Serialize(retailer_ids_30)}");
//   var retailers = await arango.Document.GetManyAsync<Retailer>("retailer_api", "retailers", retailer_ids_30);
//   return new
//   {
//     status = StatusCodes.Status200OK,
//     count = retailers.Count(),
//     retailers = retailers
//   };
// });

// app.MapGet("/retailers10/", async (IArangoContext arango) =>
// {
//   Console.WriteLine($"Retailer IDs: {JsonSerializer.Serialize(retailer_ids_10)}");
//   var retailers = await arango.Document.GetManyAsync<Retailer>("retailer_api", "retailers", retailer_ids_10);
//   return new
//   {
//     status = StatusCodes.Status200OK,
//     count = retailers.Count(),
//     retailers = retailers
//   };
// });

app.Run();
