using Application.Features.PostCommands.Commands;
using Application.Features.PostCommands.Handlers;
using Domain.Interfaces;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentAssertions;

namespace Application.Tests.Features.Posts
{
    public class EditPostCommandTests
    {
        private readonly Mock<IPostRepository> _postRepositoryMock;
        private readonly EditPostCommandHandler _handler;

        public EditPostCommandTests()
        {
            _postRepositoryMock = new Mock<IPostRepository>();
            _handler = new EditPostCommandHandler(_postRepositoryMock.Object);


        }

        [Fact]
        public async Task EditPostCommand_ValidData_ReturnsUpdatedPost()
        {
            var postId = 1;
            var content = "Updated Content";
            var tag = "Technology";
            var existingPost = new Domain.Entities.Posts { Id = postId, Content = "Old Content", Tag = "Old Tag", UserId = 1 };

            _postRepositoryMock.Setup(repo => repo.GetPostByIdAsync(postId))
                .ReturnsAsync(existingPost)
                .Verifiable();

            _postRepositoryMock.Setup(repo => repo.SaveChangesAsync(It.IsAny<CancellationToken>()))
                .Returns(Task.CompletedTask)
                .Verifiable();

            var command = new EditPostCommand(postId, content, tag);
            var handler = new EditPostCommandHandler(_postRepositoryMock.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            Assert.NotNull(result);
            result.IsSuccess.Should().BeTrue();
            result.Message.Should().Be("Post updated successfully.");
            _postRepositoryMock.Verify(repo => repo.GetPostByIdAsync(postId), Times.Once);
            _postRepositoryMock.Verify(repo => repo.SaveChangesAsync(It.IsAny<CancellationToken>()), Times.Once);
            Assert.Equal(content, existingPost.Content);
            Assert.Equal(tag, existingPost.Tag);
        }

        [Fact]
        public async Task EditPostCommand_PostNotFound_ReturnsFailure()
        {
            var postId = 1;
            var content = "Updated Content";
            var tag = "Technology";

            _postRepositoryMock.Setup(repo => repo.GetPostByIdAsync(postId))
                .ReturnsAsync((Domain.Entities.Posts)null)
                .Verifiable();

            var command = new EditPostCommand(postId, content, tag);
            var handler = new EditPostCommandHandler(_postRepositoryMock.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            Assert.NotNull(result);
            result.IsSuccess.Should().BeFalse();
            result.Message.Should().Be("Post not found.");
            _postRepositoryMock.Verify(repo => repo.GetPostByIdAsync(postId), Times.Once);
            _postRepositoryMock.Verify(repo => repo.SaveChangesAsync(It.IsAny<CancellationToken>()), Times.Never);
        }

       
        [Fact]
        public async Task EditPostCommand_EmptyContent_ReturnsFailure()
        {
            var postId = 1;
            var content = ""; 
            var tag = "Technology";
            var existingPost = new Domain.Entities.Posts { Id = postId, Content = "Old Content", Tag = "Old Tag", UserId = 1 };

            _postRepositoryMock.Setup(repo => repo.GetPostByIdAsync(postId))
                .ReturnsAsync(existingPost)
                .Verifiable();

            var command = new EditPostCommand(postId, content, tag);
            var handler = new EditPostCommandHandler(_postRepositoryMock.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            Assert.NotNull(result);
            result.IsSuccess.Should().BeFalse();
            result.Message.Should().Be("Content cannot be empty.");
            _postRepositoryMock.Verify(repo => repo.GetPostByIdAsync(postId), Times.Once);
            _postRepositoryMock.Verify(repo => repo.SaveChangesAsync(It.IsAny<CancellationToken>()), Times.Never);
        }



    }
}
