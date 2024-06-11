using MediatR;
using Application.Response;

namespace Application.Features.Users.Requests.Commands
{
    public class PasswordResetCommand : IRequest<Result>
    {
        public string Email { get; set; }
        public string Token { get; set; }
        public string NewPassword { get; set; }

        public PasswordResetCommand(string email, string token, string newPassword)
        {
            Email = email;
            Token = token;
            NewPassword = newPassword;
        }

        public PasswordResetCommand(string email)
        {
            Email = email;
            Token = null;
            NewPassword = null;
        }
    }
}