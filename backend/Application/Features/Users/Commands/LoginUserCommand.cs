using Application.Common.Models;
using MediatR;

namespace Application.Features.Users.Commands
{
    public class LoginUserCommand : IRequest<Result>
    {       
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public LoginUserCommand(string username, string email, string password)
        {
            Username = username;
            Email = email;
            Password = password;
        }
    }
}