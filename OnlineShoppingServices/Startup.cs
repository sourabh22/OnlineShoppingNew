using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using OnlineShoppingServices.Components;
using OnlineShoppingServices.Models.DB;

namespace OnlineShoppingServices
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            int x = 10;
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(o => o.AddPolicy("MyPolicy", builder =>
             {
                 builder.WithOrigins("http://localhost:65138")
                 .AllowAnyMethod()
                 .AllowAnyHeader();   // it will help out in terms of permission for services 
             }));
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
            services.AddDbContext<OnlineShoppingDbContext>(opts => opts.UseSqlServer(Configuration.GetConnectionString("OnlineShoppingString")));
         }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }app.UseMiddleware(typeof(ExceptionHandlingMiddleware));
            app.UseCors("MyPolicy"); // used as a pipeline for checking service communictaion is valid 
            app.UseMvc();
        }
    }
}
