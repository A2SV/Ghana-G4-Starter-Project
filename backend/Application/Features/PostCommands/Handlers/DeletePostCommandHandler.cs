using Application.Features.PostCommands.Commands;
using Application.Response;
using Domain.Interfaces;
using MediatR;

namespace Application.Features.PostCommands.Handlers
{
    public class DeletePostCommandHandler : IRequestHandler<DeletePostCommand, Result>
    {
        private readonly IPostRepository _postRepository;

        public DeletePostCommandHandler(IPostRepository postRepository)
        {
            _postRepository = postRepository;
        }
        public async Task<Result> Handle(DeletePostCommand request, CancellationToken cancellationToken)
        {
            var post = await _postRepository.GetPostByIdAsync(request.Id);
            if (post == null)
            {
                
                return Result.Failure("Post Not Found");
                
            }
            await _postRepository.Delete(post);
            return Result.Success("Post Deleted Successfully", null);
        }
    }
}
