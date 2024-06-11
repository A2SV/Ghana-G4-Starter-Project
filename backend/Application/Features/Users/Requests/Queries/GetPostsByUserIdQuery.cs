using Application.Contracts.PostRequests;
using MediatR;

namespace Application.Features.Users.Requests.Queries
{
    public class GetPostsByUserIdQuery : IRequest<List<PostDto>>
    {
        public int UserId { get; }

        public GetPostsByUserIdQuery(int userId)
        {
            UserId = userId;
        }
    }
}