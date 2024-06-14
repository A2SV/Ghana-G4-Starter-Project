using MediatR;
using Application.Response;
using Domain.Interfaces;
using System.Threading;
using System.Threading.Tasks;
using System.Linq;
using System.Security.Claims;
using Application.Features.UsersCommands.Commands;

namespace Application.Features.UsersCommands.Handlers
{
    public class PasswordResetCommandHandler : IRequestHandler<PasswordResetCommand, Result>
    {
        private readonly IUserRepository _userRepository;
        private readonly ITokenService _tokenService;
        private readonly IPasswordHasher _passwordHasher;
        private readonly IEmailService _emailService;

        public PasswordResetCommandHandler(
            IUserRepository userRepository,
            ITokenService tokenService,
            IPasswordHasher passwordHasher,
            IEmailService emailService)
        {
            _userRepository = userRepository;
            _tokenService = tokenService;
            _passwordHasher = passwordHasher;
            _emailService = emailService;
        }

        public async Task<Result> Handle(PasswordResetCommand request, CancellationToken cancellationToken)
{
    var principal = _tokenService.GetPrincipalFromToken(request.Token);
    if (principal == null || !principal.Identity.IsAuthenticated)
    {
        return Result.Failure("Invalid or expired token.");
    }

    var email = principal.FindFirst(ClaimTypes.Email)?.Value;
    if (email != request.Email)
    {
        return Result.Failure("Token does not match the user's email address.");
    }

    var user = await _userRepository.GetUserByEmailAsync(email);
    if (user == null)  
    {
        return Result.Failure("User not found.");
    }

    _passwordHasher.CreatePasswordHash(request.NewPassword, out byte[] newPasswordHash, out byte[] newPasswordSalt);

    user.PasswordHash = newPasswordHash;
    user.PasswordSalt = newPasswordSalt;
    var updateSuccessful = await _userRepository.UpdateUserAsync(user);
    if (!updateSuccessful)
    {
        return Result.Failure("Failed to update the user's password.");
    }

    await _emailService.SendEmailAsync(user.Email, "Password Reset Confirmation", "Your password has been successfully reset.");

    return Result.Success("Password reset successfully.");
}


    }}