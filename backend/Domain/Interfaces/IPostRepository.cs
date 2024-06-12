using Application.Response;
using Domain.Entities;

namespace Domain.Interfaces
{
    public interface IPostRepository
    {
        Task<Posts> AddAsync(Posts post);
        Task<Posts> GetPostByIdAsync(int postId);

        Task Delete(Posts post);

        Task SaveChangesAsync(CancellationToken cancellationToken);
        
    }
}