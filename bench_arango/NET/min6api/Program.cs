using Core.Arango;
using Core.Arango.Serialization.Json;

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
  config.ConnectionString = builder.Configuration.GetConnectionString("Arango");
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
  return new {
    status = StatusCodes.Status200OK,
    retailer = retailer
  };
});

app.MapGet("/retailerByQuery/{id}", async (IArangoContext arango, string id) => 
{
  var retailer = await arango.Query.ExecuteAsync<Retailer>("retailer_api", $"FOR r IN retailers FILTER r._key == {id} RETURN r");
  return new {
    status = StatusCodes.Status200OK,
    retailer = retailer
  };
});

app.MapGet("/retailers/{limit}", async (IArangoContext arango, int limit) => 
{
  var retailers = await arango.Query.ExecuteAsync<Retailer>("retailer_api", $"FOR r IN retailers LIMIT {limit} RETURN r");
  return new {
    status = StatusCodes.Status200OK,
    count = retailers.Count(),
    retailers = retailers
  };
});

app.Run();
