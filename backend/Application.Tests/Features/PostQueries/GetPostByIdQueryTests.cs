using Domain.Interfaces;
using Application.Features.PostQueries.Handlers;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Application.Features.PostQueries.Queries;

namespace Application.Tests.Features.PostQueries
{
    public class GetPostByIdQueryTests
    {
        private readonly Mock<IPostRepository>  _postRepositoryMock;
        private readonly GetPostByIdQueryHandler _handler;  

        public GetPostByIdQueryTests()
        {
            _postRepositoryMock = new Mock<IPostRepository>();
            _handler = new GetPostByIdQueryHandler(_postRepositoryMock.Object);
        }


        [Fact]
        public async Task Handle_PostExists_ReturnsPostDto()
        {
            var postId = 1;
            var post = new Domain.Entities.Posts
            {
                Id = postId,
                Content = "Test Content",
                CreatedAt = DateTime.UtcNow,
                UserId = 1,
                Tag = "Technology"
            };

            _postRepositoryMock.Setup(repo => repo.GetPostByIdAsync(postId))
                .ReturnsAsync(post)
                .Verifiable();

            var query = new GetPostByIdQuery(postId);

            var result = await _handler.Handle(query, CancellationToken.None);

            Assert.NotNull(result);
            Assert.Equal(post.Id, result.Id);
            Assert.Equal(post.Content, result.Content);
            Assert.Equal(post.CreatedAt, result.CreatedAt);
            Assert.Equal(post.UserId, result.UserId);
            Assert.Equal(post.Tag, result.Tag);

            _postRepositoryMock.Verify(repo => repo.GetPostByIdAsync(postId), Times.Once);
        }

        [Fact]
        public async Task Handle_PostDoesNotExist_ReturnsNull()
        {
            var postId = 1;

            _postRepositoryMock.Setup(repo => repo.GetPostByIdAsync(postId))
                .ReturnsAsync((Domain.Entities.Posts)null)
                .Verifiable();

            var query = new GetPostByIdQuery(postId);

            var result = await _handler.Handle(query, CancellationToken.None);

            Assert.Null(result);
            _postRepositoryMock.Verify(repo => repo.GetPostByIdAsync(postId), Times.Once);
        }
    }
}
