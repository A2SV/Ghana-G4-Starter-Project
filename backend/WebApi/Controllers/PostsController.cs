using Application.Features.PostQueries.Queries;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Application.Contracts.PostRequests;
using Application.Features.PostCommands.Commands;


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
            var command = new GetPostByIdQuery(id);
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

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var command = new DeletePostCommand { Id = id };
            var result =  await _mediator.Send(command);
            if (result.IsSuccess)
            {
                return Ok(result.Message);
            }
            return BadRequest(result.Message);
            
        }

        [HttpPatch("posts/{id:int}")]
        public async Task<IActionResult> EditPost(int id, [FromBody] EditPostRequest request)
        {
            if (request == null)
            {
                return BadRequest("Invalid data.");
            }

            var command = new EditPostCommand(id, request.Content, request.Tag);
            var result = await _mediator.Send(command);

            if (result.IsSuccess)
            {
                return Ok(result.Message);
            }

            return BadRequest(result.Message);
        }


    }
}