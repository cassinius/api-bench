using Microsoft.EntityFrameworkCore;
using Minapi8_compiled.Models;

namespace Minapi8_compiled.Data;

public class RetailerContext : DbContext
{
    public RetailerContext(DbContextOptions<RetailerContext> options) : base(options)
    {
    }

    private static Func<RetailerContext, int, Task<Retailer?>> GetRetailerByIdFunc =
        EF.CompileAsyncQuery<RetailerContext, int, Retailer?>(
            (dbContext, id) =>
                dbContext.Set<Retailer>().FirstOrDefault(r => r.Id == id));

    public async Task<Retailer?> GetRetailer(int id)
    {
        return await GetRetailerByIdFunc(this, id);
    }

    private static Func<RetailerContext, IAsyncEnumerable<Retailer>> GetAllRetailersFunc =
        EF.CompileAsyncQuery<RetailerContext, Retailer>(
            (dbContext) =>
                dbContext.Retailers.AsNoTracking());

    public IAsyncEnumerable<Retailer> GetRetailers()
    {
        return GetAllRetailersFunc(this);
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseNpgsql(
            @"User ID=retailer;Password=retailer;Host=localhost;Port=5432;Database=retailer_api;MaxPoolSize=90;Pooling=true");
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
    }

    public DbSet<Retailer> Retailers { get; set; } = default!;
}