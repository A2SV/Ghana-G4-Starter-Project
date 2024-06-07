using System.ComponentModel.DataAnnotations;

namespace Application.Contracts.UserRequests
{
    public class ForgotPasswordRequest
    {
        // [Required(ErrorMessage = "Email is required.")]
        // [EmailAddress(ErrorMessage = "A valid email is required.")]
        public string Email { get; set; }
    }
}