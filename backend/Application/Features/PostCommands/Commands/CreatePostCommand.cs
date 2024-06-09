using MediatR;
using Application.Response;

namespace Application.Features.PostCommands.Commands
{
    public class CreatePostCommand : IRequest<Result>
    {
        public string Content { get; set; }
        public string Tag { get; set; }
        public int UserId { get; set; }

        public CreatePostCommand(string content, string tag, int userId)
        {
            Content = content;
            Tag = tag;
            UserId = userId;
        }
    }
}