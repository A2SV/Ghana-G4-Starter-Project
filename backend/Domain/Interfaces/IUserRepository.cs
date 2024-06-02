using Domain.Entities;

namespace Domain.Interfaces
{
    public interface IUserRepository
    {
        Task AddAsync(Users user);
        // Task<Users> GetByEmailAsync(string email);
    }
}
