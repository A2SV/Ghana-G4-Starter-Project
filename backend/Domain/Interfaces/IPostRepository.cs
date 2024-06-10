using Domain.Entities;

namespace Domain.Interfaces
{
    public interface IPostRepository
    {
        Task<Posts> AddAsync(Posts post);
        Task<List<Posts>> GetPostsByUserIdAsync(int userId);
        Task<Posts> GetPostByIdAsync(int postId);
    }
}