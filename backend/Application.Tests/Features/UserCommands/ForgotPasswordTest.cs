using Domain.Interfaces;
using Moq;
using Application.Features.UsersCommands.Handlers;
using Application.Features.UsersCommands.Commands;

namespace Application.Tests.Features.UsersTest
{
    public class ForgotPasswordTest
    {
        private readonly Mock<IUserRepository> _mockUserRepository;
        private readonly Mock<IEmailService> _mockEmailService;
        private readonly Mock<ITokenService> _mockTokenService;
        private readonly ForgotPasswordCommandHandler _handler;

        public ForgotPasswordTest()
        {
            _mockUserRepository = new Mock<IUserRepository>();
            _mockEmailService = new Mock<IEmailService>();
            _mockTokenService = new Mock<ITokenService>();
            _handler = new ForgotPasswordCommandHandler(_mockUserRepository.Object, _mockEmailService.Object, _mockTokenService.Object);
        }

        [Fact]
        public async Task Handle_ReturnsFailureResult_WhenUserNotFound()
        {
            // Arrange
            var command = new ForgotPasswordCommand("nonexistentuser@example.com");
            _mockUserRepository.Setup(repo => repo.GetUserByEmailAsync(command.Email)).ReturnsAsync((Users)null);

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("No user found with that email address.", result.Message);
        }

        [Fact]
        public async Task Handle_ReturnsSuccessResult_WhenUserFound()
        {
            // Arrange
            var command = new ForgotPasswordCommand("existinguser@example.com");
            var user = new Users { Email = command.Email, Username = "existinguser" };
            var token = "generated_token";
            var resetLink = $"https://yourdomain.com/reset-password?token={token}&email={user.Email}";

            _mockUserRepository.Setup(repo => repo.GetUserByEmailAsync(command.Email)).ReturnsAsync(user);
            _mockTokenService.Setup(service => service.GeneratePasswordResetToken(user.Email)).Returns(token);
            _mockEmailService.Setup(service => service.SendEmailAsync(user.Email, "Reset Your Password", $"Please reset your password by clicking here: {resetLink}")).Returns(Task.CompletedTask);

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Equal("Password reset email sent.", result.Message);
        }
    }
}
