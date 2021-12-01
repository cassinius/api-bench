using System;
using System.Linq;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Text.Json;
using System.Text.Json.Serialization;

using RetailerApi.Models;
using RetailerApi.Data;
using Microsoft.Extensions.Configuration;

using Dapper;
using Npgsql;

namespace RetailerApi.Repositories
{
  public class RetailerSyncRepository : IRetailerSyncRepository
  {
    private IDbConnection _db;

    public IConfiguration Configuration;

    public RetailerSyncRepository(IConfiguration configuration)
    {
      Configuration = configuration;
      this._db = new NpgsqlConnection(Configuration.GetConnectionString("NpgsqlConnection"));
    }

    public Retailer Get(int id)
    {
      string sql = "SELECT * FROM retailer WHERE id = @id";
      return _db.QuerySingle<Retailer>(sql, new { @id = id });
    }

    public IEnumerable<Retailer> GetAll()
    {
      string sql = "SELECT * FROM retailer";
      IEnumerable<Retailer> retailers = _db.Query<Retailer>(sql).ToList();
      // Console.WriteLine(JsonSerializer.Serialize(retailers));
      return retailers;
    }

    // Using STORED PROCEDURES => SLOWER...!!!

    // public Retailer Get(int id)
    // {
    //   // Console.WriteLine($"Retailer: Get called with id: {id}");
    //   var retailer = _db.QueryFirstOrDefault<Retailer>("get_retailer_by_id", new { rid = id }, commandType: CommandType.StoredProcedure);
    //   // return retailer.FirstOrDefault();
    //   // Console.WriteLine($"Got Retailer: {retailer.Business_name}");
    //   return retailer;
    // }

    // public IEnumerable<Retailer> GetAll()
    // {
    //   return _db.Query<Retailer>("get_all_retailers", commandType: CommandType.StoredProcedure).ToList();
    // }
  }
}