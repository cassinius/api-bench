using System.Threading.Tasks;
using System.Collections.Generic;
using RetailerApi.Models;

namespace RetailerApi.Repositories
{
    public interface IRetailerAsyncRepository
    {
         Task<Retailer> Get(int id);
         Task<IEnumerable<Retailer>> GetAll();
    }
}
