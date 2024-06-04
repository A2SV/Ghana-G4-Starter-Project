using Domain.Common;
using Domain.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Configurations
{
    public  class AppDbContext: DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.Entity<Users>()
                .HasMany(e=>e.Posts)
                .WithOne(p=>p.User)
                .HasForeignKey(e=>e.UserId);
            
            modelBuilder.Entity<Domain.Entities.Users>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id)
                      .ValueGeneratedOnAdd();
            });

            Seed.UsersSeed.AddSeed(modelBuilder);
            Seed.PostsSeed.AddSeed(modelBuilder);
        }

        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken=default)
        { 
            foreach(var entry in ChangeTracker.Entries<BaseEntity>())
            {
                entry.Entity.UpdatedAt = DateTime.UtcNow;

                if (entry.State == EntityState.Added )
                {
                    entry.Entity.CreatedAt = DateTime.UtcNow;
                }
            }

            return base.SaveChangesAsync(cancellationToken);
        }

        public DbSet<Users> Users { get; set; }
        public DbSet<Posts> Posts { get; set; }

        

    }
}
