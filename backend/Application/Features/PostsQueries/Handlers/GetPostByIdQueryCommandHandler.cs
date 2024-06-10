using Application.Contracts.PostRequests;
using Application.Features.PostCommands.Commands;
using Domain.Interfaces;
using MediatR;

namespace Application.Features.PostCommands.Handlers
{
    public class GetPostByIdQueryCommandHandler : IRequestHandler<GetPostByIdQueryCommand, PostDto>
    {
        private readonly IPostRepository _postRepository;

        public GetPostByIdQueryCommandHandler(IPostRepository postRepository)
        {
            _postRepository = postRepository;
        }

        public async Task<PostDto> Handle(GetPostByIdQueryCommand request, CancellationToken cancellationToken)
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