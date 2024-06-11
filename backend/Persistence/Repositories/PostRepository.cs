using Domain.Interfaces;
using Domain.Entities;
using Persistence.Configurations;
using Microsoft.EntityFrameworkCore;

namespace Persistence.Repositories
{
    public class PostRepository : IPostRepository
    {
        private readonly AppDbContext _context;

        public PostRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<Posts> AddAsync(Posts post)
        {
            _context.Posts.Add(post);
            await _context.SaveChangesAsync();

            return post;
        }


        public async Task<Posts> GetPostByIdAsync(int postId)
        {
            return await _context.Posts.Include(x => x.User)
                            .FirstOrDefaultAsync(x => x.Id == postId);
        }
        
        public async Task SaveChangesAsync(CancellationToken cancellationToken)
        {
            await _context.SaveChangesAsync(cancellationToken);
        }
        
<<<<<<< Updated upstream
=======
        public async Task SaveChangesAsync(CancellationToken cancellationToken)
        {
            await _context.SaveChangesAsync(cancellationToken);
        }
>>>>>>> Stashed changes
    }
}