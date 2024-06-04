using Domain.Entities;
using Domain.Interfaces;
using Persistence.Configurations;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Persistence.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly AppDbContext _context;

        public UserRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task AddAsync(Users user)
        {
            _context.Users.Add(user);
            await _context.SaveChangesAsync();
        }
    }
}
