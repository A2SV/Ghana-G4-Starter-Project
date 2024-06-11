using System.ComponentModel.DataAnnotations;
using Application.Response;
using MediatR;

namespace Application.Features.Users.Requests.Commands
{
    public class LoginUserCommand : IRequest<Result>
<<<<<<< HEAD:backend/Application/Features/UsersCommands/Commands/LoginUserCommand.cs
    {       
        [Required]
        [EmailAddress(ErrorMessage = "A valid email address is required")]
||||||| parent of 26a118a (feat(backend): REstructure):backend/Application/Features/UsersCommands/Commands/LoginUserCommand.cs
    {       
=======
    {
>>>>>>> 26a118a (feat(backend): REstructure):backend/Application/Features/Users/Requests/Commands/LoginUserCommand.cs
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }

        public LoginUserCommand(string email, string password)
        {
            Email = email;
            Password = password;
        }
    }
}