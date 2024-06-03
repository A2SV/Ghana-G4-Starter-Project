using Domain.Entities;
using Domain.Interfaces;
using Persistence.Configurations;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Persistence.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly ApplicationDbContext _context;

        public UserRepository(ApplicationDbContext context)
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
