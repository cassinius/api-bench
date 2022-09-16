using Microsoft.EntityFrameworkCore;
using Minapi7.Data;
using Minapi7.Models;
using Minapi7.Models.Responses;

var builder = WebApplication.CreateBuilder(args);

var connStr = builder.Configuration.GetConnectionString("EfPgConnection");
builder.Services.AddDbContext<RetailerContext>(x => x.UseNpgsql(connStr));

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

app.MapGet("/retailer/{id}", async (int id) => {
    using var scope = app.Services.CreateScope();
    var ctx = scope.ServiceProvider.GetRequiredService<RetailerContext>();
    var retailer = await ctx.Retailers.Where(r => r.Id == id).AsNoTracking().FirstOrDefaultAsync();
    return retailer;
});

app.Run();
