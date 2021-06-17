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
  public class RetailerSyncRepository: IRetailerSyncRepository
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
      string sql = "SELECT * FROM \"Retailers\" WHERE id = @id";
      return _db.QuerySingle<Retailer>(sql, new { @id = id });
    }

    public IEnumerable<Retailer> GetAll()
    {
      string sql = "SELECT * FROM \"Retailers\"";
      return _db.Query<Retailer>(sql).ToList();
    }
  }
}