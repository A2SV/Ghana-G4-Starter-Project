using Application.Contracts.PostRequests;
using MediatR;

namespace Application.Features.PostQueries.Queries
{
    public class GetPostByIdQuery : IRequest<PostDto>
    {
        public int PostId { get; }

        public GetPostByIdQuery(int postId)
        {
            PostId = postId;
        }
    }
}