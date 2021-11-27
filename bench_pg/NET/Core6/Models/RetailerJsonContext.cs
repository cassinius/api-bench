using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace RetailerApi.Models;

[JsonSerializable(typeof(Retailer))]
[JsonSerializable(typeof(IEnumerable<Retailer>))]
[JsonSourceGenerationOptions(GenerationMode = JsonSourceGenerationMode.Default, PropertyNamingPolicy = JsonKnownNamingPolicy.CamelCase)]
public partial class RetailerJsonContext : JsonSerializerContext
{

}
