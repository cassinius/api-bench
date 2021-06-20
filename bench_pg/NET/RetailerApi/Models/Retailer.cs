using MessagePack;

namespace RetailerApi.Models
{
  [MessagePackObject]
  public class Retailer
  {
    [Key(0)]
    public int id { get; set; }
    [Key(1)]
    public string GSTIN { get; set; }
    [Key(2)]
    public string Business_name { get; set; }
    [Key(3)]
    public string Contact_person { get; set; }
    [Key(4)]
    public int Contact_number { get; set; }
    [Key(5)]
    public string Contact_address { get; set; }
    [Key(6)]
    public string Contact_emailId { get; set; }
    [Key(7)]
    public string Status { get; set; }
    [Key(8)]
    public int Outlet_limit { get; set; }
  }
}
