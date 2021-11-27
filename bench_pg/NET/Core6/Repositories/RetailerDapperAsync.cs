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
  public class RetailerAsyncRepository : IRetailerAsyncRepository
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
      string sql = "SELECT * FROM retailer WHERE id = @id";
      var retailer = await _db.QueryAsync<Retailer>(sql, new { @id = id });
      return retailer.FirstOrDefault();
    }

    public async Task<IEnumerable<Retailer>> GetAll()
    {
      string sql = "SELECT * FROM retailer";
      var retailers = await _db.QueryAsync<Retailer>(sql);
      return retailers;
    }

    // Using STORED PROCEDURES => SLOWER !!

    // public async Task<Retailer> Get(int id)
    // {
    //   var retailer = await _db.QueryAsync<Retailer>("get_retailer_by_id", new { rid = id }, commandType: CommandType.StoredProcedure);
    //   return retailer.FirstOrDefault();
    // }

    // public async Task<IEnumerable<Retailer>> GetAll()
    // {
    //   var retailers = await _db.QueryAsync<Retailer>("get_all_retailers", commandType: CommandType.StoredProcedure);
    //   return retailers.ToList();
    // }
  }
}

// This makes it a few percent SLOWER (actually logical...)
// 
// using (var _db = new NpgsqlConnection("User ID=retailer;Password=retailer;Host=localhost;Port=5432;Database=retailer_api_dotnet;"))
// {
//   return await _db.QueryFirstAsync<Retailer>(sql, new { @id = id });
// }