using Application.DTOs;
using Application.Features.UsersQueries.Queries;
using Domain.Interfaces;
using MediatR;

namespace Application.Features.UsersQueries.Handlers
{
    public class GetPostsByUserIdQueryHandler : IRequestHandler<GetPostsByUserIdQuery, List<PostDto>>
    {
        private readonly IPostRepository _postRepository;

        public GetPostsByUserIdQueryHandler(IPostRepository postRepository)
        {
            _postRepository = postRepository;
        }

        public async Task<List<PostDto>> Handle(GetPostsByUserIdQuery request, CancellationToken cancellationToken)
        {
            var posts = await _postRepository.GetPostsByUserIdAsync(request.UserId);
            if (posts == null)
            {
                return null;
            }
            return posts.Select(p => new PostDto
            {
                Id = p.Id,
                Content = p.Content,
                CreatedAt = p.CreatedAt
            }).ToList();
        }
    }
}