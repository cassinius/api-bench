using System;
using System.Linq;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using RetailerApi.Models;
using RetailerApi.Data;
using Microsoft.Extensions.Configuration;

using Dapper;
using Npgsql;

namespace RetailerApi.Repositories
{
  public class RetailerAsyncRepository: IRetailerAsyncRepository
  {
    private IDbConnection _db;

    public IConfiguration Configuration;

    public RetailerAsyncRepository(IConfiguration configuration)
    {
      Configuration = configuration;
      this._db = new NpgsqlConnection(Configuration.GetConnectionString("NpgsqlConnection"));
    }

    public async Task<Retailer> Get(int id)
    {
      string sql = "SELECT * FROM \"Retailers\" WHERE id = @id";
      return await _db.QueryFirstAsync<Retailer>(sql, new { @id = id });
    }

    public async Task<IEnumerable<Retailer>> GetAll()
    {
      string sql = "SELECT * FROM \"Retailers\"";
      return (await _db.QueryAsync<Retailer>(sql)).ToList();
    }
  }
}
