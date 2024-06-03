using backend.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Seed
{
    public static class PostsSeed
    {
        public static void AddSeed(ModelBuilder modelbuilder) {
            modelbuilder.Entity<Posts>()
                    .HasData(
                new Posts
                {
                    Id = 1,
                    Content = "My first Post",
                    Tag = "Entertainment",
                    UserId = 1,


                });
        }
    }
}
