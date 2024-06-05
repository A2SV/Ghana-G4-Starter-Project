using Application.Response;
using MediatR;

namespace Application.Features.UsersCommands
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