<<<<<<< HEAD:backend/Application/Features/UsersQueries/Handlers/GetPostsByUserIdQueryHandler.cs
using Application.Contracts.PostRequests;
using Application.Features.UsersQueries.Queries;
||||||| parent of 26a118a (feat(backend): REstructure):backend/Application/Features/UsersQueries/Handlers/GetPostsByUserIdQueryHandler.cs
using Application.DTOs;
using Application.Features.UsersQueries.Queries;
=======
using Application.DTOs;
using Application.Features.Users.Requests.Queries;
>>>>>>> 26a118a (feat(backend): REstructure):backend/Application/Features/Users/Handlers/Queries/GetPostsByUserIdQueryHandler.cs
using Domain.Interfaces;
using MediatR;

namespace Application.Features.Users.Handlers.Queries
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