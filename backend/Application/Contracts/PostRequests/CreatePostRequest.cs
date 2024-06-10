namespace Application.Contracts.PostRequests
{
    public class CreatePostRequest
    {
        public string Content { get; set; } = string.Empty;
        public string Tag { get; set; } = string.Empty;
        public int UserId { get; set; }
    }
}