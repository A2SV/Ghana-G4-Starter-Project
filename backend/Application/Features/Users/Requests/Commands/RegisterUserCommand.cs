<<<<<<< HEAD:backend/Application/Features/UsersCommands/Commands/RegisterUserCommand.cs
using System.ComponentModel.DataAnnotations;
using Application.Features.UsersCommands;
||||||| parent of 26a118a (feat(backend): REstructure):backend/Application/Features/UsersCommands/Commands/RegisterUserCommand.cs
using Application.Features.UsersCommands;
=======
using Application.Features.Users.Requests.Commands;
>>>>>>> 26a118a (feat(backend): REstructure):backend/Application/Features/Users/Requests/Commands/RegisterUserCommand.cs
using Application.Response;
using MediatR;

namespace Application.Features.Users.Requests.Commands
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