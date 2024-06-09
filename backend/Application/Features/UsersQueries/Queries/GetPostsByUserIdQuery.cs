using Application.DTOs;
using MediatR;

namespace Application.Features.UsersQueries.Queries
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