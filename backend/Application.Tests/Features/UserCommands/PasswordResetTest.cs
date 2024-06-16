using System.Security.Claims;
using Domain.Interfaces;
using Moq;
using Application.Features.UsersCommands.Handlers;
using Application.Features.UsersCommands.Commands;


namespace Application.Tests.Features.UsersTest
{
    public class PasswordResetTest
    {
        private readonly Mock<IUserRepository> _mockUserRepository;
        private readonly Mock<ITokenService> _mockTokenService;
        private readonly Mock<IPasswordHasher> _mockPasswordHasher;
        private readonly Mock<IEmailService> _mockEmailService;
        private readonly PasswordResetCommandHandler _handler;

        public PasswordResetTest()
        {
            _mockUserRepository = new Mock<IUserRepository>();
            _mockTokenService = new Mock<ITokenService>();
            _mockPasswordHasher = new Mock<IPasswordHasher>();
            _mockEmailService = new Mock<IEmailService>();
            _handler = new PasswordResetCommandHandler(_mockUserRepository.Object, _mockTokenService.Object, _mockPasswordHasher.Object, _mockEmailService.Object);
        }

        [Fact]
        public async Task Handle_ReturnsFailureResult_WhenTokenIsInvalid()
        {
            // Arrange
            var command = new PasswordResetCommand("test@gmail.com", "invalid_token", "newpassword");
            _mockTokenService.Setup(x => x.GetPrincipalFromToken(command.Token)).Returns((ClaimsPrincipal)null);

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Invalid or expired token.", result.Message);
        }

        [Fact]
        public async Task Handle_ReturnsSuccessResult_WhenTokenIsValid()
        {
            // Arrange
            var command = new PasswordResetCommand("aebenezer27@gmail.com", "valid_token", "newpassword");
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Email, command.Email)
            };
            var identity = new ClaimsIdentity(claims, "mock");
            var principal = new ClaimsPrincipal(identity);

            _mockTokenService.Setup(x => x.GetPrincipalFromToken(command.Token)).Returns(principal);
            _mockUserRepository.Setup(x => x.GetUserByEmailAsync(command.Email)).ReturnsAsync(new Users { Email = command.Email, Username = "testuser" });
            _mockUserRepository.Setup(x => x.UpdateUserAsync(It.IsAny<Users>())).ReturnsAsync(true);
            _mockPasswordHasher.Setup(x => x.CreatePasswordHash(command.NewPassword, out It.Ref<byte[]>.IsAny, out It.Ref<byte[]>.IsAny));
            _mockEmailService.Setup(x => x.SendEmailAsync(command.Email, "Password Reset Confirmation", "Your password has been successfully reset.")).Returns(Task.CompletedTask);

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Equal("Password reset successfully.", result.Message);
        }
    }
}
