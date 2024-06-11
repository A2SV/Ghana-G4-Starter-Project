using Application.Response;
using Domain.Interfaces;
using MediatR;
using Persistence.Configurations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.PostCommands.Commands
{
    public class DeletePostCommand : IRequest<Result>
    {
        public int Id { get; set; }
    }
}
