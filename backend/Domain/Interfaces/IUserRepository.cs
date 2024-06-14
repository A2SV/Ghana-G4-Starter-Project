using Domain.Entities;

namespace Domain.Interfaces
{
    public interface IUserRepository
    {
        Task<Users> AddAsync(Users user);
        Task<Users> GetUserByEmailAsync(string email);
        Task<List<Posts>> GetPostsByUserIdAsync(int userId);
        // Task<bool> ResetPasswordAsync(string email, string token, byte[] newPasswordHash, byte[] newPasswordSalt);
        Task<bool> UpdateUserAsync(Users user);
    }
}
