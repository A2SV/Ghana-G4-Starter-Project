using System.ComponentModel.DataAnnotations;
using Application.Response;
using MediatR;

namespace Application.Features.UsersCommands
{
    public class LoginUserCommand : IRequest<Result>
    {       
        [Required]
        [EmailAddress(ErrorMessage = "A valid email address is required")]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }

        public LoginUserCommand(string email, string password)
        {
            Email = email;
            Password = password;
        }
    }
}