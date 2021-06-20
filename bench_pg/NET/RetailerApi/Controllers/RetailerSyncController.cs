using System.Collections.Generic;
using System.Net.Http.Headers;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

using RetailerApi.Repositories;
using RetailerApi.Models;
using System.Net.Http;
using Microsoft.AspNetCore.Http;
using System.Net;
using Microsoft.AspNetCore.WebUtilities;
using System.Linq;
using Newtonsoft.Json.Serialization;

namespace RetailerApi.Controllers
{
  [ApiController]
  [Route("[controller]")]
  public class RetailerSyncController : ControllerBase
  {
    private readonly IRetailerSyncRepository _retailerRepository;
    public RetailerSyncController(IRetailerSyncRepository retailerRepository)
    {
      _retailerRepository = retailerRepository;
    }

    [HttpGet("{id}")]
    public ActionResult<Retailer> GetRetailer(int id)
    {
      var retailer = _retailerRepository.Get(id);
      if (retailer == null)
        return NotFound();
      return Ok(retailer);
    }

    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public ActionResult<IEnumerable<Retailer>> GetRetailers()
    {
      var retailers = _retailerRepository.GetAll();
      // var retailerList = retailers.ToList();
      // if (retailerList == null || retailerList.Count() == 0) {
      //   return NotFound();
      // }

      // var json = JsonConvert.SerializeObject(retailerList);
      // return Ok(json);
      return Ok(retailers);
    }
  }
}
