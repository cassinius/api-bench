// using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using RetailerApi.Models;

namespace RetailerApi.Repositories
{
    public interface IRetailerRepository
    {
         Retailer Get(int id);
         IEnumerable<Retailer> GetAll();
    }
}
