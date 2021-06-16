using System.Collections.Generic;
using System.Threading.Tasks;
using RetailerApi.Models;
using RetailerApi.Data;
using Microsoft.EntityFrameworkCore;

namespace RetailerApi.Repositories
{
  public class RetailerRepository : IRetailerRepository
  {
    private readonly IDataContext _context;

    public RetailerRepository(IDataContext context)
    {
      this._context = context;
    }

    public async Task<Retailer> Get(int id)
    {
        return await _context.Retailers.FindAsync(id);
    }

    public async Task<IEnumerable<Retailer>> GetAll()
    {
        return await _context.Retailers.ToListAsync();
    }
  }
}
