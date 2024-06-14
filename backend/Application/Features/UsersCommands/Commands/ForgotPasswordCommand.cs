using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Response;
using MediatR;

namespace Application.Features.UsersCommands.Commands
{
    public class ForgotPasswordCommand : IRequest<Result>
    {
        public string Email { get; }

        public ForgotPasswordCommand(string email)
        {
            Email = email;
        }
    }
}