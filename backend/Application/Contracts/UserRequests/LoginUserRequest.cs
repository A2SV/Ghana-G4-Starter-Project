using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Contracts.UsersRequests
{
    public class LoginUserRequest
    {
        
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }
}