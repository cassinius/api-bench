using Microsoft.EntityFrameworkCore;

using Minapi8_compiled;
using Minapi8_compiled.Data;
using Minapi8_compiled.Models;
using Minapi8_compiled.Models.Responses;

var builder = WebApplication.CreateBuilder(args);

var connStr = builder.Configuration.GetConnectionString("EfPgConnection");
builder.Services.AddDbContext<RetailerContext>(x => x.UseNpgsql(connStr));

var app = builder.Build();

app.MapGet("/", () => new APIStatusResponse
{
    Code = StatusCodes.Status200OK,
    Message = "Retailer API up and running."
})
    .WithName("GetWeatherForecast")
    .WithOpenApi();

app.MapGet("/retailers", async () =>
{
    using var scope = app.Services.CreateScope();
    var ctx = scope.ServiceProvider.GetRequiredService<RetailerContext>();

    List<Retailer> retailers = new List<Retailer>();
    await foreach (var retailer in ctx.GetRetailers())
    {
        retailers.Add(retailer);
    }
    return retailers;
});

app.MapGet("/retailer/{id}", async (int id) =>
{
    using var scope = app.Services.CreateScope();
    var ctx = scope.ServiceProvider.GetRequiredService<RetailerContext>();

    var retailer = await ctx.GetRetailer(id);
    return retailer;
});

app.Run();
