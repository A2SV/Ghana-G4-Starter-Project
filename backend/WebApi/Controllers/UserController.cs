using Application.Contracts.UserRequests;
using Application.Features.Users.Commands;
using Application.Features.UsersCommands.Commands;
using Application.Features.UsersQueries.Queries;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Application.Features.PostCommands.Commands;
using Application.Contracts.UsersRequests;
using Application.Features.UsersCommands;
using Application.Contracts.PostRequests;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly IMediator _mediator;

        public UsersController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(RegisterUserRequest request)
        {
            var command = new RegisterUserCommand(request.FirstName, request.LastName, request.Bio, request.Username, request.Email, request.Password);
            var result = await _mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.Message);
            }
            return Ok("User registered successfully.");
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginUserRequest loginUserRequest)
        {
            var command = new LoginUserCommand(loginUserRequest.Email, loginUserRequest.Password);
            var result = await _mediator.Send(command);

            if (result.IsSuccess)
            {
                return Ok(result);
            }
            return BadRequest(result.Message);
        }
        
        [HttpPost("forgot-password")]
        public async Task<IActionResult> ForgotPassword(ForgotPasswordRequest request)
        {
            // Ensure that this matches the constructor that takes a single string argument.
            var command = new PasswordResetCommand(request.Email); 
            var result = await _mediator.Send(command);
            if (result.IsSuccess)
                return Ok(result.Message);
            return BadRequest(result.Message);
        }


        [HttpPost("reset-password")]
        public async Task<IActionResult> ResetPassword(ResetPasswordRequest request)
        {
            // Ensure this uses the constructor that takes three string arguments.
            var command = new PasswordResetCommand(request.Email, request.Token, request.NewPassword);
            var result = await _mediator.Send(command);
            if (result.IsSuccess)
                return Ok(result.Message);
            return BadRequest(result.Message);
        }
        

        [HttpGet("{userId}/posts")]
        public async Task<IActionResult> GetPostsByUserId(int userId)
        {
            var result = await _mediator.Send(new GetPostsByUserIdQuery(userId));
            if (result == null)
            {
                return NotFound(new { Message = "The user does not exist or this user has made no posts yet" });
            }
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
