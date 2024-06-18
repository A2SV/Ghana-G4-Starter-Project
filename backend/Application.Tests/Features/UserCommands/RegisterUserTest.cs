using Application.Features.Users.Commands;
using Domain.Interfaces;
using Moq;
using FluentAssertions;

namespace Application.Tests.Features.UsersTest;

public class RegisterUserTests
{
    private readonly Mock<IUserRepository> _mockUserRepository;
    private readonly Mock<IPasswordHasher> _mockPasswordHasher;
    private readonly RegisterUserCommandHandler _handler;

    public RegisterUserTests()
    {
        _mockUserRepository = new Mock<IUserRepository>();
        _mockPasswordHasher = new Mock<IPasswordHasher>();
        _handler = new RegisterUserCommandHandler(_mockUserRepository.Object, _mockPasswordHasher.Object);
    }

    [Fact]
    public async Task Handle_ShouldRegisterUser_WhenValidData()
    {
        var command = new RegisterUserCommand("John", "Doe", "Bio", "johndoe", "john.doe@example.com", "Password123");

        _mockPasswordHasher.Setup(ph => ph.CreatePasswordHash(It.IsAny<string>(), out It.Ref<byte[]>.IsAny, out It.Ref<byte[]>.IsAny));

        var result = await _handler.Handle(command, CancellationToken.None);

        result.IsSuccess.Should().BeTrue();
        _mockUserRepository.Verify(repo => repo.AddAsync(It.IsAny<Users>()), Times.Once);
    }

    [Fact]
    public async Task Handle_ShouldReturnFailure_WhenRequiredFieldsAreMissing()
    {
        var command = new RegisterUserCommand("", "Doe", "Bio", "johndoe", "john.doe@example.com", "Password123");

        var result = await _handler.Handle(command, CancellationToken.None);

        result.IsSuccess.Should().BeFalse();
        result.Message.Should().Be("Invalid input.");
        _mockUserRepository.Verify(repo => repo.AddAsync(It.IsAny<Users>()), Times.Never);
    }
}
