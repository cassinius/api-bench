namespace min6api.Models;

public class Retailer {
  public int id {get; set;}
  public string GSTIN {get; set;} = "";
  public string Business_name {get; set;} = "";
  public string Contact_person {get; set;} = "";
  public int Contact_number {get; set;}
  public string Contact_address {get; set;} = "";
  public string Contact_emailId {get; set;} = "";
  public string Status {get; set;} = "";
  public int Outlet_limit {get; set;}
}
