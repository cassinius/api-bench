using Microsoft.EntityFrameworkCore;
using Minapi8.Data;
using Minapi8.Models;
using Minapi8.Models.Responses;

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
    var retailers = await ctx.Retailers.AsNoTracking().ToListAsync<Retailer>();
    return retailers;
});

app.MapGet("/retailer/{id}", async (int id) =>
{
    using var scope = app.Services.CreateScope();
    var ctx = scope.ServiceProvider.GetRequiredService<RetailerContext>();
    var retailer = await ctx.Retailers.Where(r => r.Id == id).AsNoTracking().FirstOrDefaultAsync();
    return retailer;
});

app.Run();
