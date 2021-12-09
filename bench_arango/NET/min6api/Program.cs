using Core.Arango;
using Core.Arango.Serialization;

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
builder.Services.AddArango(builder.Configuration.GetConnectionString("Arango"));

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

app.Run();
