using Application.Common.Models;
using MediatR;

namespace Application.Features.Users.Commands
{
    public class RegisterUserCommand : IRequest<Result>
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Bio { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
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