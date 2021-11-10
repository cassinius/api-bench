using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace RetailerApi.Models;

[Table("retailer")]
public class Retailer
{
  [Column("id")]
  [JsonPropertyName("id")]
  [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
  public int Id { get; set; } = -1;
  [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
  public string GSTIN { get; set; } = "";
  [Column("Business_name")]
  [JsonPropertyName("business_name")]
  [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
  public string BusinessName { get; set; } = "";
  [Column("Contact_person")]
  [JsonPropertyName("contact_person")]
  [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
  public string ContactPerson { get; set; } = "";
  [Column("Contact_number")]
  [JsonPropertyName("contact_number")]
  [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
  public int ContactNumber { get; set; } = -1;
  [Column("Contact_address")]
  [JsonPropertyName("contact_address")]
  [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
  public string ContactAddress { get; set; } = "";
  [Column("Contact_emailId")]
  [JsonPropertyName("contact_emailId")]
  [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
  public string ContactEmailId { get; set; } = "";
  // [Column("Status")]
  [JsonPropertyName("status")]
  [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
  public string Status { get; set; } = "";
  [Column("Outlet_limit")]
  [JsonPropertyName("outlet_limit")]
  [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
  public int OutletLimit { get; set; } = -1;
}
