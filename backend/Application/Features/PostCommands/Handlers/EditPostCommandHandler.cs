using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Contracts.PostRequests;
using Application.Response;
using MediatR;
using Application.Features.PostCommands.Commands;
using Domain.Interfaces;

namespace Application.Features.PostCommands.Handlers
{
    public class EditPostCommandHandler : IRequestHandler<EditPostCommand, Result>
    {
        
        private readonly IPostRepository _postRepository;

        public EditPostCommandHandler(IPostRepository postRepository)
        {
            _postRepository = postRepository;
        }

        public async Task<Result> Handle(EditPostCommand request, CancellationToken cancellationToken)
        {
            var post = await _postRepository.GetPostByIdAsync(request.PostId);

            if (post == null)
            {
                return Result.Failure("Post not found.");
            }

            if (request.Content == "")
            {
                
                return Result.Failure("Content cannot be empty.");
            }
            
            post.Content = request.Content;
            post.Tag = request.Tag;

            await _postRepository.SaveChangesAsync(cancellationToken);

            return Result.Success("Post updated successfully.");
        }
    }
}