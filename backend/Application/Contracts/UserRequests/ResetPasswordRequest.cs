using System.ComponentModel.DataAnnotations;

namespace Application.Contracts.UserRequests
{
    public class ResetPasswordRequest
    {
        // [Required(ErrorMessage = "Token is required.")]
        
        public string Email { get; set; }
        public string Token { get; set; }

        // [Required(ErrorMessage = "New password is required.")]
        // [MinLength(8, ErrorMessage = "New Password must be at least 8 characters long.")]
        public string NewPassword { get; set; }
    }
}