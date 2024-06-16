using Microsoft.EntityFrameworkCore;
using Minapi8.Models;

namespace Minapi8.Data;

public class RetailerContext : DbContext
{
    public RetailerContext(DbContextOptions<RetailerContext> options) : base(options)
    {
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var serverVersion = new MySqlServerVersion(new Version(11, 4, 2));
        optionsBuilder.UseMySql("Server=localhost;Port=3506;Database=retailer_api;User ID=retailer;Password=retailer", serverVersion);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
    }

    public DbSet<Retailer> Retailers { get; set; } = default!;
}