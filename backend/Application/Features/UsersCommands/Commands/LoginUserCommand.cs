using Application.Common.Models;
using MediatR;

namespace Application.Features.Users.Commands
{
    public class LoginUserCommand : IRequest<Result>
    {       
        public string Email { get; set; }
        public string Password { get; set; }

        public LoginUserCommand(string email, string password)
        {
            Email = email;
            Password = password;
        }
    }
}