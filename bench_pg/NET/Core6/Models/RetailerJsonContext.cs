using System.Text.Json.Serialization;

namespace RetailerApi.Models;

[JsonSerializable(typeof(Retailer))]
[JsonSourceGenerationOptions(GenerationMode = JsonSourceGenerationMode.Default, PropertyNamingPolicy = JsonKnownNamingPolicy.CamelCase)]
public partial class RetailerJsonContext : JsonSerializerContext
{

}
