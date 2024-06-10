using System.ComponentModel.DataAnnotations;

namespace Application.Contracts.PostRequests
{
    public class CreatePostRequest
    {
        [Required]
        public string Content { get; set; } = string.Empty;
        public string Tag { get; set; } = string.Empty;
        [Required]
        public int UserId { get; set; }
    }
}