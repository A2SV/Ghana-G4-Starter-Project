using System.ComponentModel.DataAnnotations;
using Application.Features.UsersCommands;
using Application.Response;
using MediatR;

namespace Application.Features.Users.Commands
{
    public class RegisterUserCommand : IRequest<Result>
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        public string Bio { get; set; }
        [Required]
        public string Username { get; set; }
        [Required]
        [EmailAddress(ErrorMessage = "A valid email address is required")]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }

        public RegisterUserCommand(string firstName, string lastName, string bio, string username, string email, string password)
        {
            FirstName = firstName;
            LastName = lastName;
            Bio = bio;
            Username = username;
            Email = email;
            Password = password;
        }
    }
}