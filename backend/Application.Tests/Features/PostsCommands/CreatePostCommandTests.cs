using Domain.Entities;
using Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Moq;
using Application.Features.PostCommands.Handlers;
using Application.Features.PostCommands.Commands;
using FluentAssertions;

namespace Application.Tests.Features.Posts
{
    public class CreatePostCommandTests
    {
        private readonly Mock<IPostRepository> _postRepositoryMock;
        private readonly CreatePostCommandHandler _handler;

        public CreatePostCommandTests()
        {
            _postRepositoryMock = new Mock<IPostRepository>();
            _handler = new CreatePostCommandHandler(_postRepositoryMock.Object);
        }

        [Fact]
        public async Task CreatePostAsync_ValidData_ReturnsCreatedPost()
        {
            var postId = 1;
            var content = "Test Content";
            var tag = "Sports";
            var userId = 1;
            var post = new Domain.Entities.Posts { Id = postId, Content = content, Tag = tag, UserId = userId };
            _postRepositoryMock.Setup(repo => repo.AddAsync(It.IsAny<Domain.Entities.Posts>()))
            .ReturnsAsync(post)
            .Verifiable();

            var command = new CreatePostCommand(content, tag, userId);

            var result = await _handler.Handle(command, CancellationToken.None);

            Assert.NotNull(result);
            result.IsSuccess.Should().BeTrue();
            result.Message.Should().Be("Post created successfully");
            _postRepositoryMock.Verify(repo => repo.AddAsync(It.Is<Domain.Entities.Posts>(p =>
        p.Content == content && p.Tag == tag && p.UserId == userId)), Times.Once);



        }


        [Fact]
        public async Task CreatePostAsync_EmptyContent_ThrowsArgumentException()
        {
            var content = ""; 
            var tag = "Sports";
            var userId = 1;

            var command = new CreatePostCommand(content, tag, userId);

            var result  = await _handler.Handle(command, CancellationToken.None);

            result.Message.Should().Be("Content can't be empty");

            _postRepositoryMock.Verify(repo => repo.AddAsync(It.IsAny<Domain.Entities.Posts>()), Times.Never);
        }

    }
}
