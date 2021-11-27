using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;

using Microsoft.EntityFrameworkCore;
using RetailerApi.Data;
using RetailerApi.Repositories;

using Dapper;

namespace RetailerApi
{
  public class Startup
  {
    public Startup(IConfiguration configuration)
    {
      Configuration = configuration;
      Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
    }

    public IConfiguration Configuration { get; }

    // This method gets called by the runtime. Use this method to add services to the container.
    public void ConfigureServices(IServiceCollection services)
    {
      services.AddDbContext<DataContext>(options => options.UseNpgsql(Configuration.GetConnectionString("NpgsqlConnection")));
      // services.AddScoped<IDataContext>(provider => provider.GetService<DataContext>());
      services.AddScoped<IRetailerSyncRepository, RetailerSyncRepository>();
      services.AddScoped<IRetailerAsyncRepository, RetailerAsyncRepository>();
      services.AddControllers();
      services.AddSwaggerGen(c =>
      {
        c.SwaggerDoc("v1", new OpenApiInfo { Title = "RetailerApi", Version = "v1" });
      });
    }

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
      if (env.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
        app.UseSwagger();
        app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "RetailerApi v1"));
      }

      if (env.IsProduction() || env.IsStaging() || env.IsEnvironment("Staging_2"))
      {
        app.UseExceptionHandler("/Error");
      }

      // app.UseHttpsRedirection();

      app.UseRouting();

      app.UseAuthorization();

      app.UseEndpoints(endpoints =>
      {
        endpoints.MapControllers();

        endpoints.MapGet("/", async context =>
        {
          await context.Response.WriteAsJsonAsync(new
          {
            status = "OK",
            message = "Retailer API up and running."
          });
        });
      });
    }
  }
}
