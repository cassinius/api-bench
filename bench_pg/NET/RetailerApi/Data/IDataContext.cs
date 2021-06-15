using System.Threading;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using RetailerApi.Models;

namespace RetailerApi.Data
{
    public interface IDataContext
    {
        DbSet<Retailer> Retailers {get; set;}
        Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
    }
}

