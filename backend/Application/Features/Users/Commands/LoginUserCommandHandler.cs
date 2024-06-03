using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Application.Common.Models;
using Domain.Entities;
using Domain.Interfaces;

namespace Application.Features.Users.Commands
{
    public class LoginUserCommandHandler : IRequestHandler<LoginUserCommand, Result>
    {
        private readonly IUserRepository _userRepository;
        private readonly IPasswordHasher _passwordHasher;

        public LoginUserCommandHandler(IUserRepository userRepository, IPasswordHasher passwordHasher)
        {
            _userRepository = userRepository;
            _passwordHasher = passwordHasher;
        }

        public async Task<Result> Handle(LoginUserCommand request, CancellationToken cancellationToken)
        {
            if (
                string.IsNullOrWhiteSpace(request.Username) && 
                string.IsNullOrWhiteSpace(request.Email) || 
                string.IsNullOrWhiteSpace(request.Password))
            {
                return Result.Failure("Invalid input.");
            }

            var user = await _userRepository.GetUserByUsernameOrEmailAsync(request.Username, request.Email);

            if (user == null)
            {
                return Result.Failure("User not found.");
            }

            if (!_passwordHasher.VerifyPasswordHash(request.Password, user.PasswordHash, user.PasswordSalt))
            {
                return Result.Failure("Incorrect password.");
            }

            return Result.Success(new
            {
                user.Id,
                user.Username,
                user.Email
            });
        }
    }
}
