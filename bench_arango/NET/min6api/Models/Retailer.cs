namespace min6api.Models;

public class Retailer {
  public int id {get; set;}
  public string GSTIN {get; set;} = string.Empty;
  public string Business_name {get; set;} = string.Empty;
  public string Contact_person {get; set;} = string.Empty;
  public int Contact_number {get; set;}
  public string Contact_address {get; set;} = string.Empty;
  public string Contact_emailId {get; set;} = string.Empty;
  public string Status {get; set;} = string.Empty;
  public int Outlet_limit {get; set;}
}
