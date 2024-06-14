using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Response;
using MediatR;

namespace Application.Features.UsersCommands.Commands
{
    public class PasswordResetCommand : IRequest<Result>
    {
        public string Email {get; set;}
        public string Token {get; set;}
        public string NewPassword {get; set;}

        public PasswordResetCommand(string email, string token, string newPassword)
        {
            Email = email;
            Token = token;
            NewPassword = newPassword;
        }
    }
}