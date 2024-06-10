using Application.Features.PostCommands.Commands;
using MediatR;
using Microsoft.AspNetCore.Mvc;

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
    }
}