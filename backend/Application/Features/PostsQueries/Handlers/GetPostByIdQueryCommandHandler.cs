using Application.Contracts.PostRequests;
using Application.Features.PostQueries.Queries;
using Domain.Interfaces;
using MediatR;

namespace Application.Features.PostQueries.Handlers
{
    public class GetPostByIdQueryHandler : IRequestHandler<GetPostByIdQuery, PostDto>
    {
        private readonly IPostRepository _postRepository;

        public GetPostByIdQueryHandler(IPostRepository postRepository)
        {
            _postRepository = postRepository;
        }

        public async Task<PostDto> Handle(GetPostByIdQuery request, CancellationToken cancellationToken)
        {
            var post = await _postRepository.GetPostByIdAsync(request.PostId);
            if (post == null)
            {
                return null;
            }
            
            return new PostDto
            {
                Id = post.Id,
                Content = post.Content,
                CreatedAt = post.CreatedAt,
                UserId = post.UserId,
                Tag = post.Tag
            };
        }
    }
}