using MediatR;
using Application.Response;
using System.ComponentModel.DataAnnotations;

namespace Application.Features.PostCommands.Commands
{
    public class CreatePostCommand : IRequest<Result>
    {
        [Required]
        public string Content { get; set; }
        public string Tag { get; set; }
        [Required]
        public int UserId { get; set; }

        public CreatePostCommand(string content, string tag, int userId)
        {
            Content = content;
            Tag = tag;
            UserId = userId;
        }
    }
}