// using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;
using RetailerApi.Models;

namespace RetailerApi.Repositories
{
    public interface IRetailerRepository
    {
         Task<Retailer> Get(int id);
         Task<IEnumerable<Retailer>> GetAll();

    }
}
