namespace Core8Npgsql.Models.Responses;

public class APIStatusResponse
{
  public int Code { get; set; } // = StatusCodes.Status200OK;
  public string Message { get; set; } = "";
}
