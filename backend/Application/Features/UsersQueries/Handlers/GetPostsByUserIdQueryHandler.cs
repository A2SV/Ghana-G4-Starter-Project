using Application.Contracts.PostRequests;
using Application.Features.UsersQueries.Queries;
using Domain.Interfaces;
using MediatR;

namespace Application.Features.UsersQueries.Handlers
{
    public class GetPostsByUserIdQueryHandler : IRequestHandler<GetPostsByUserIdQuery, List<PostDto>>
    {
        private readonly IUserRepository _userRepository;

        public GetPostsByUserIdQueryHandler(IPostRepository postRepository)
        {
            _userRepository = _userRepository;
        }

        public async Task<List<PostDto>> Handle(GetPostsByUserIdQuery request, CancellationToken cancellationToken)
        {
            var posts = await _userRepository.GetPostsByUserIdAsync(request.UserId);
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