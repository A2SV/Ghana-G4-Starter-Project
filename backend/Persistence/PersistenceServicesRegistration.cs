using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Persistence.Configurations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence
{
    public static class PersistenceServicesRegistration
    {
        public static IServiceCollection ConfigurePersistenceServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddEntityFrameworkNpgsql().
                AddDbContext<AppDbContext>(options=>
                options.UseNpgsql(
                    configuration.GetConnectionString("AppConnectionString"), 
                    b=>b.MigrationsAssembly(typeof(AppDbContext).Assembly.FullName)));
            return services;
        }
    }
}
