using Microsoft.EntityFrameworkCore;

using Minapi6.Models;

namespace Minapi6.Data;

public class RetailerContext : DbContext
{
  public RetailerContext()
  {

  }

  protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
  {
    optionsBuilder.UseNpgsql(@"User ID=retailer;Password=retailer;Host=localhost;Port=5432;Database=retailer_api;MaxPoolSize=90;Pooling=true");
  }

  protected override void OnModelCreating(ModelBuilder modelBuilder)
  {

  }

  public DbSet<Retailer> Retailers { get; set; }
}