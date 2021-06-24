using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Utf8Json;

using RetailerApi.Repositories;
using RetailerApi.Models;

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
      var json = JsonSerializer.ToJsonString(retailer);
      return Ok(json);
    }

    [HttpGet]
    public async Task<ActionResult<IAsyncEnumerable<Retailer>>> GetRetailers()
    {
      var retailers = await _retailerRepository.GetAll();
      var json = JsonSerializer.ToJsonString(retailers);
      return Ok(json);
    }
  }
}
