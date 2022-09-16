using Minapi6.Models.Responses;
using Minapi6.Models;
using Minapi6.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MapGet("/", () => new APIStatusResponse 
{
    Code = StatusCodes.Status200OK,
    Message = "Retailer API up and running."
});

app.MapGet("/retailers", () => {
    var ctx = new RetailerContext();
    var retailers = ctx.Retailers.ToList<Retailer>();// .All<Retailer>();// FindAsync<Retailer>(42);
    return retailers;
});

app.MapGet("/retailer/{id}", async (int id) => {
    var ctx = new RetailerContext();
    var retailers = await ctx.Retailers.FindAsync(id);
    return retailers;
});

app.Run();
