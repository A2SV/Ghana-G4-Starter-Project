using Application.Features.UsersCommands;
using Domain.Entities;
using Domain.Interfaces;
using Moq;
using Xunit;
using FluentAssertions;
using Microsoft.Extensions.Configuration;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Tests.Features.UsersTest
{
    public class LoginUserTests
    {
        private readonly Mock<IUserRepository> _mockUserRepository;
        private readonly Mock<IPasswordHasher> _mockPasswordHasher;
        private readonly Mock<IConfiguration> _mockConfiguration;
        private readonly LoginUserCommandHandler _handler;

        public LoginUserTests()
        {
            _mockUserRepository = new Mock<IUserRepository>();
            _mockPasswordHasher = new Mock<IPasswordHasher>();
            _mockConfiguration = new Mock<IConfiguration>();
            
            _mockConfiguration.Setup(config => config["Jwt:Key"]).Returns("super_secret_key_1234567890super_secret_key_1234567890");
            _mockConfiguration.Setup(config => config["Jwt:Issuer"]).Returns("testIssuer");
            _mockConfiguration.Setup(config => config["Jwt:Audience"]).Returns("testAudience");

            _handler = new LoginUserCommandHandler(_mockUserRepository.Object, _mockPasswordHasher.Object, _mockConfiguration.Object);
        }

        [Fact]
        public async Task Handle_ShouldLoginUser_WhenValidCredentials()
        {
            var user = new Users
            {
                Id = 1,
                Email = "john.doe@example.com",
                Username = "johndoe",
                PasswordHash = new byte[64],
                PasswordSalt = new byte[128]
            };
            var command = new LoginUserCommand("john.doe@example.com", "Password123");

            _mockUserRepository.Setup(repo => repo.GetUserByEmailAsync(command.Email)).ReturnsAsync(user);
            _mockPasswordHasher.Setup(ph => ph.VerifyPasswordHash(command.Password, user.PasswordHash, user.PasswordSalt)).Returns(true);

            var result = await _handler.Handle(command, CancellationToken.None);

            result.IsSuccess.Should().BeTrue();
            result.Message.Should().Be("Login successful");
        }

        [Fact]
        public async Task Handle_ShouldReturnFailure_WhenIncorrectCredentials()
        {
            var user = new Users
            {
                Id = 1,
                Email = "john.doe@example.com",
                Username = "johndoe",
                PasswordHash = new byte[64],
                PasswordSalt = new byte[128]
            };
            var command = new LoginUserCommand("john.doe@example.com", "WrongPassword");

            _mockUserRepository.Setup(repo => repo.GetUserByEmailAsync(command.Email)).ReturnsAsync(user);
            _mockPasswordHasher.Setup(ph => ph.VerifyPasswordHash(command.Password, user.PasswordHash, user.PasswordSalt)).Returns(false);

            var result = await _handler.Handle(command, CancellationToken.None);

            result.IsSuccess.Should().BeFalse();
            result.Message.Should().Be("Incorrect password.");
        }

        [Fact]
        public async Task Handle_ShouldReturnFailure_WhenUserNotFound()
        {
            var command = new LoginUserCommand("nonexistent@example.com", "Password123");

            _mockUserRepository.Setup(repo => repo.GetUserByEmailAsync(command.Email)).ReturnsAsync((Users)null);

            var result = await _handler.Handle(command, CancellationToken.None);

            result.IsSuccess.Should().BeFalse();
            result.Message.Should().Be("User not found.");
        }
    }
}
