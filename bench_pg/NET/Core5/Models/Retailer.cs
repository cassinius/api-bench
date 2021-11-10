using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace RetailerApi.Models
{
  [Table("StudentMaster")]
  public class Retailer
  {
    [Column("id")]
    [JsonPropertyName("id")]
    public int Id { get; set; }
    public string GSTIN { get; set; }
    [Column("Business_name")]
    [JsonPropertyName("business_name")]
    public string BusinessName { get; set; }
    [Column("Contact_person")]
    [JsonPropertyName("contact_person")]
    public string ContactPerson { get; set; }
    [Column("Contact_number")]
    [JsonPropertyName("contact_number")]
    public int ContactNumber { get; set; }
    [Column("Contact_address")]
    [JsonPropertyName("contact_address")]
    public string ContactAddress { get; set; }
    [Column("Contact_emailId")]
    [JsonPropertyName("contact_emailId")]
    public string ContactEmailId { get; set; }
    // [Column("Status")]
    [JsonPropertyName("status")]
    public string Status { get; set; }
    [Column("Outlet_limit")]
    [JsonPropertyName("outlet_limit")]
    public int OutletLimit { get; set; }
  }
}
