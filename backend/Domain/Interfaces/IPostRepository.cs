using Domain.Entities;

namespace Domain.Interfaces
{
    public interface IPostRepository
    {
        Task<Posts> AddAsync(Posts post);
        Task<Posts> GetPostByIdAsync(int postId);
        
        Task SaveChangesAsync(CancellationToken cancellationToken);
<<<<<<< Updated upstream
=======
        
>>>>>>> Stashed changes
    }
}