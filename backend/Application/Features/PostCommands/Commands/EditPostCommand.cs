using MediatR;
using Application.Response;

namespace Application.Features.PostCommands.Commands
{
    public class EditPostCommand : IRequest<Result>
    {
        public int PostId { get; }
        public string Content { get; }
        public string Tag { get; }

        public EditPostCommand(int postId, string content, string tag)
        {
            PostId = postId;
            Content = content;
            Tag = tag;
        }
    }
}

