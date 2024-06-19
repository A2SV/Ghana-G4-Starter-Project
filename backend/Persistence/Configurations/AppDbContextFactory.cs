using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using DotNetEnv;
namespace Persistence.Configurations
{
    public class AppDbContextFactory : IDesignTimeDbContextFactory<AppDbContext>
    {
        public AppDbContext CreateDbContext(string[] args)
        {
            DotNetEnv.Env.Load("../.env");
            var host = System.Environment.GetEnvironmentVariable("HOST");
            var user_id = System.Environment.GetEnvironmentVariable("USER_ID");
            var password = System.Environment.GetEnvironmentVariable("PASSWORD");
            var database = System.Environment.GetEnvironmentVariable("DATABASE");
            var port = System.Environment.GetEnvironmentVariable("PORT");
            var pooling = System.Environment.GetEnvironmentVariable("POOLING");

            var connectionString = $"Host={host}; Database={user_id};Username={user_id};Password={password}";
            var optionsBuilder = new DbContextOptionsBuilder<AppDbContext>();
            optionsBuilder.UseNpgsql($"Host=localhost; User ID=postgres;Password={password};Server=localhost;Port=5432;Database=GhanaStarterProject; Pooling=true");

            return new AppDbContext(optionsBuilder.Options);
        }
    }
}
