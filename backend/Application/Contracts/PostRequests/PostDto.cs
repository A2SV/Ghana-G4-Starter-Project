using Domain.Entities;

namespace Application.Contracts.PostRequests
{
    public class PostDto
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public int UserId { get; set; }
        public string Tag { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}