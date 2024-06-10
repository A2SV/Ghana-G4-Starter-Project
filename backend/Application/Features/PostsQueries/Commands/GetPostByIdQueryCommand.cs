using Application.Contracts.PostRequests;
using MediatR;

namespace Application.Features.PostCommands.Commands
{
    public class GetPostByIdQueryCommand : IRequest<PostDto>
    {
        public int PostId { get; }

        public GetPostByIdQueryCommand(int postId)
        {
            PostId = postId;
        }
    }
}