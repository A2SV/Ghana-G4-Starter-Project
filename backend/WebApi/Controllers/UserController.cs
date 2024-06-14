using Application.Contracts.UserRequests;
using Application.Features.Users.Commands;
using Application.Features.UsersCommands.Commands;
using Application.Features.UsersQueries.Queries;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Application.Contracts.UsersRequests;
using Application.Features.UsersCommands;
using Application.Contracts.UsersRequests;

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

        [HttpPost("reset-password")]
        public async Task<IActionResult> ResetPassword([FromBody] PasswordResetRequest request)
        {
            if (request == null)
            {
                return BadRequest("Invalid request.");
            }

            if (string.IsNullOrWhiteSpace(request.Email) ||
                string.IsNullOrWhiteSpace(request.Token) ||
                string.IsNullOrWhiteSpace(request.NewPassword))
            {
                return BadRequest("Missing email, token, or new password.");
            }

            var command = new PasswordResetCommand(request.Email, request.Token, request.NewPassword);
            var result = await _mediator.Send(command);

            if (result.IsSuccess)
            {
                return Ok(result.Message);
            }
            return BadRequest(result.Message);
        }


        [HttpPost("forgot-password")]
        public async Task<IActionResult> ForgotPassword([FromBody] ForgotPasswordRequest request)
        {
            if (request == null || string.IsNullOrWhiteSpace(request.Email))
            {
                return BadRequest("Email address is required.");
            }

            var command = new ForgotPasswordCommand(request.Email);
            var result = await _mediator.Send(command);

            if (result.IsSuccess)
            {
                return Ok(result.Message);
            }
            return BadRequest(result.Message);
        }



    }
}
