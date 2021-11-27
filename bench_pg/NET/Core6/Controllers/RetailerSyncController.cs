using System.Collections.Generic;
using System.Net.Http.Headers;
using Microsoft.AspNetCore.Mvc;

using RetailerApi.Repositories;
using RetailerApi.Models;
using System.Net.Http;
using Microsoft.AspNetCore.Http;
using System.Net;
using System.Linq;

using System.Text.Json;

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
      // return Ok(retailer);
      return Ok(JsonSerializer.SerializeToUtf8Bytes(retailer, RetailerJsonContext.Default.Retailer));

      // byte[] bytes = MessagePackSerializer.Serialize(retailer);
      // return Ok(MessagePackSerializer.ConvertToJson(bytes));
      // return Ok(bytes);

      // var json = JsonSerializer.ToJsonString(retailer);
      // return Ok(json);
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
      // return Ok(retailers);
      return Ok(JsonSerializer.SerializeToUtf8Bytes(retailers, RetailerJsonContext.Default.IEnumerableRetailer));

      // var json = JsonConvert.SerializeObject(retailerList);
      // return Ok(json);


      // byte[] bytes = MessagePackSerializer.Serialize(retailers);
      // return Ok(MessagePackSerializer.ConvertToJson(bytes));
      // return Ok(bytes);

      // var json = JsonSerializer.ToJsonString(retailers);
      // return Ok(json);
    }
  }
}
