using MediatR;
using Application.Response;

namespace Application.Features.Users.Handlers.Commands
{
    public class PasswordResetCommandHandler : IRequest<Result>
    {
        public string Email { get; set; }
        public string Token { get; set; }
        public string NewPassword { get; set; }

        public PasswordResetCommandHandler(string email, string token, string newPassword)
        {
            Email = email;
            Token = token;
            NewPassword = newPassword;
        }
    }
}