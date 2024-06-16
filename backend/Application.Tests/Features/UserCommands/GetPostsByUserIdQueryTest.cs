using Moq;
using Domain.Interfaces;
using Application.Features.UsersQueries.Handlers;
using Application.Features.UsersQueries.Queries;

public class GetPostsByUserIdQueryTest
{
    private readonly Mock<IUserRepository> _mockUserRepository;
    private readonly GetPostsByUserIdQueryHandler _handler;

    public GetPostsByUserIdQueryTest()
    {
        _mockUserRepository = new Mock<IUserRepository>();
        _handler = new GetPostsByUserIdQueryHandler(_mockUserRepository.Object);
    }

    [Fact]
    public async Task Handle_ReturnsListOfPostDto_WhenPostsExist()
    {
        var userId = 1;
        var posts = new List<Posts>
        {
            new Posts { Id = 1, Content = "Content 1", UserId = userId, CreatedAt = DateTime.Now },
            new Posts { Id = 2, Content = "Content 2", UserId = userId, CreatedAt = DateTime.Now.AddDays(-1) }
        };

        _mockUserRepository.Setup(repo => repo.GetPostsByUserIdAsync(userId)).ReturnsAsync(posts);

        var query = new GetPostsByUserIdQuery(userId);
        var result = await _handler.Handle(query, CancellationToken.None);

        Assert.NotNull(result);
        Assert.Equal(2, result.Count);
        Assert.All(result, postDto => 
        {
            Assert.Equal(userId, postDto.UserId); 
            Assert.Contains("Content", postDto.Content);
        });
    }

    [Fact]
    public async Task Handle_ReturnsNullWhenNoPostsExist()
    {
        var userId = 999;
        _mockUserRepository.Setup(repo => repo.GetPostsByUserIdAsync(userId)).ReturnsAsync((List<Posts>)null);

        var query = new GetPostsByUserIdQuery(userId);
        var result = await _handler.Handle(query, CancellationToken.None);

        Assert.Null(result);
    }
}
