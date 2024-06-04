using Domain.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Seed
{
    public static class UsersSeed
    {
        public static void AddSeed(ModelBuilder modelBuilder) {
            modelBuilder.Entity<Users>().
                    HasData(
                new Users
                {
                    Id = 2,
                    FirstName = "Michael",
                    LastName = "Adu",
                    Bio = "Computer Engineering Student",
                    Username = "mikkayadu",
                    Email = "michaeladugyamfi@gmail.com",
                    PasswordHash = new byte[]
            {
            0xAB, 0xCD, 0xEF, 0xAB, 0xCD, 0xEF, 0xAB, 0xCD,
            0xEF, 0xAB, 0xCD, 0xEF, 0xAB, 0xCD, 0xEF, 0xAB,
            0xCD, 0xEF, 0xAB, 0xCD, 0xEF, 0xAB, 0xCD, 0xEF,
            0xAB, 0xCD, 0xEF, 0xAB, 0xCD, 0xEF, 0xAB, 0xCD
            },
                    PasswordSalt = new byte[]
                {
                0xAB, 0xCD, 0xEF, 0xAB, 0xCD, 0xEF, 0xAB, 0xCD,
            0xEF, 0xAB, 0xCD, 0xEF, 0xAB, 0xCD, 0xEF, 0xAB,
            0xCD, 0xEF, 0xAB, 0xCD, 0xEF, 0xAB, 0xCD, 0xEF,
            0xAB, 0xCD, 0xEF, 0xAB, 0xCD, 0xEF, 0xAB, 0xCD

                },

                    VerificationToken = "akdl8elslejdl",
                    PasswordResetToken = "None",

                });
                }
    }
}
