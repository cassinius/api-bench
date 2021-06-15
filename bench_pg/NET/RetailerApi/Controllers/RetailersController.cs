using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

using RetailerApi.Repositories;
using RetailerApi.Models;

namespace RetailerApi.Controllers
{
  [ApiController]
  [Route("[controller]")]
  public class RetailerController : ControllerBase
  {
    private readonly IRetailerRepository _retailerRepository;
    public RetailerController(IRetailerRepository retailerRepository)
    {
        _retailerRepository = retailerRepository;
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Retailer>> GetRetailer(int id)
    {
        var retailer = await _retailerRepository.Get(id);
        if(retailer == null)
            return NotFound();
        return Ok(retailer);
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Retailer>>> GetRetailers()
    {
        var retailers = await _retailerRepository.GetAll();
        return Ok(retailers);
    }
  }
}
