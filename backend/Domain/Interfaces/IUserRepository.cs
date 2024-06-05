using Application.Common.Models;
using Domain.Entities;

namespace Domain.Interfaces
{
    public interface IUserRepository
    {
        Task<Users> AddAsync(Users user);
        Task<Users> GetUserByEmailAsync(string email);
    }
}
