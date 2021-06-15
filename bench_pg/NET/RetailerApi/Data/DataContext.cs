using Microsoft.EntityFrameworkCore;
using RetailerApi.Models;

namespace RetailerApi.Data
{
    public class DataContext: DbContext, IDataContext
    {
        public DataContext(DbContextOptions<DataContext> options): base(options) {

        }

        public DbSet<Retailer> Retailers {get; set;}
    }
}
