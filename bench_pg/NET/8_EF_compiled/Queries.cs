using Microsoft.EntityFrameworkCore;
using Minapi8_compiled.Data;
using Minapi8_compiled.Models;

public static class RetailerQueries
{
    public static readonly Func<RetailerContext, int, Task<Retailer?>> GetRetailerById =
    EF.CompileAsyncQuery(
        (RetailerContext ctx, int id) => ctx
            .Retailers
            .AsNoTracking()
            .FirstOrDefault(r => r.Id == id)
    );

    public static readonly Func<RetailerContext, IAsyncEnumerable<Retailer>> GetRetailers =
    EF.CompileAsyncQuery(
        (RetailerContext ctx) => ctx.Retailers.AsNoTracking()
    );
}