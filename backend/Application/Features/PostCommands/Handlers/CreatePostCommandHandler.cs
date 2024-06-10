using MediatR;
using Application.Response;
using Application.Features.PostCommands.Commands;
using Domain.Entities;
using Domain.Interfaces;

namespace Application.Features.PostCommands.Handlers
{
    public class CreatePostCommandHandler : IRequestHandler<CreatePostCommand, Result>
    {
        private readonly IPostRepository _postRepository;

        public CreatePostCommandHandler(IPostRepository postRepository)
        {
            _postRepository = postRepository;
        }

        public async Task<Result> Handle(CreatePostCommand request, CancellationToken cancellationToken)
        {
            if (string.IsNullOrEmpty(request.Content))
            {
                return Result.Failure("Content can't be empty");
            }

            var post = new Posts
            {
                Content = request.Content,
                Tag = request.Tag,
                UserId = request.UserId
            };

            await _postRepository.AddAsync(post);

            return Result.Success("Post created successfully", null);
        }
    }
}