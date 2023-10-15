using Microsoft.EntityFrameworkCore;
using Minapi7.Models;

namespace Minapi7.Data;

public class RetailerContext : DbContext
{
    public RetailerContext(DbContextOptions<RetailerContext> options) : base(options)
    {
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