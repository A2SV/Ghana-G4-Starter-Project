using Application.Features.PostCommands.Commands;
using Application.Features.PostCommands.Handlers;
using Domain.Interfaces;
using Moq;
using FluentAssertions;

namespace Application.Tests.Features.Posts;

public class DeletePostCommandTests
{
    private readonly Mock<IPostRepository> _postRepositoryMock;
    private readonly DeletePostCommandHandler _handler;

    public DeletePostCommandTests()
    {
        _postRepositoryMock = new Mock<IPostRepository>();
        _handler = new DeletePostCommandHandler(_postRepositoryMock.Object);
    }

    [Fact]
    public async Task Handle_ShouldDeletePost_WhenPostExists()
    {
        var postId = 1;
        var post = new Domain.Entities.Posts { Id = postId, Content = "Test Content", UserId = 1 };
        _postRepositoryMock.Setup(repo => repo.GetPostByIdAsync(postId))
            .ReturnsAsync(post);
        _postRepositoryMock.Setup(repo => repo.Delete(It.IsAny<Domain.Entities.Posts>()))
            .Returns(Task.CompletedTask);

        var command = new DeletePostCommand { Id = postId };
        
        var result = await _handler.Handle(command, CancellationToken.None);
        
        result.IsSuccess.Should().BeTrue();
        result.Message.Should().Be("Post Deleted Successfully");
        _postRepositoryMock.Verify(repo => repo.Delete(post), Times.Once);
    }

    [Fact]
    public async Task Handle_ShouldReturnFailure_WhenPostDoesNotExist()
    {
        var postId = 1;
        _postRepositoryMock.Setup(repo => repo.GetPostByIdAsync(postId))
            .ReturnsAsync((Domain.Entities.Posts)null);

        var command = new DeletePostCommand { Id = postId };
        
        var result = await _handler.Handle(command, CancellationToken.None);
        
        result.IsSuccess.Should().BeFalse();
        result.Message.Should().Be("Post Not Found");
        _postRepositoryMock.Verify(repo => repo.Delete(It.IsAny<Domain.Entities.Posts>()), Times.Never);
    }
}

