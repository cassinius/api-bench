using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
// using Utf8Json;

using RetailerApi.Repositories;
using RetailerApi.Models;

using System.Text.Json;

namespace RetailerApi.Controllers
{
  [ApiController]
  [Route("[controller]")]
  public class RetailerAsyncController : ControllerBase
  {
    private readonly IRetailerAsyncRepository _retailerRepository;
    public RetailerAsyncController(IRetailerAsyncRepository retailerRepository)
    {
      _retailerRepository = retailerRepository;
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Retailer>> GetRetailer(int id)
    {
      var retailer = await _retailerRepository.Get(id);
      if (retailer == null)
        return NotFound();
      // return Ok(retailer);
      return Ok(JsonSerializer.SerializeToUtf8Bytes(retailer, RetailerJsonContext.Default.Retailer));
      
      // var json = JsonSerializer.ToJsonString(retailer);
      // return Ok(json);
    }

    [HttpGet]
    public async Task<ActionResult<IAsyncEnumerable<Retailer>>> GetRetailers()
    {
      var retailers = await _retailerRepository.GetAll();
      // return Ok(retailers);
      return Ok(JsonSerializer.SerializeToUtf8Bytes(retailers, RetailerJsonContext.Default.IEnumerableRetailer));

      // var json = JsonSerializer.ToJsonString(retailers);
      // return Ok(json);
    }
  }
}
