using Application.Features.PostCommands.Commands;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Application.Contracts.PostRequests;


namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PostsController : ControllerBase
    {
        private readonly IMediator _mediator;

        public PostsController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet]
        [Route("{id:int}")]
        public async Task<IActionResult> GetPostById([FromRoute] int id)
        {
            var command = new GetPostByIdQueryCommand(id);
            var result = await _mediator.Send(command);

            if (result == null)
                return NotFound("Post not found");

            return Ok(result);
        }

        [HttpPost("posts")]
        public async Task<IActionResult> CreatePost(CreatePostRequest request)
        {
            var command = new CreatePostCommand(request.Content, request.Tag, request.UserId);
            var result = await _mediator.Send(command);
            if (result.IsSuccess)
            {
                return Ok(result.Message);
            }
            return BadRequest(result.Message);
        }
    }
}