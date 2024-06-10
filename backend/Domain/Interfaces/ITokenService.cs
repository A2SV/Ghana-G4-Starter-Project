using System.Security.Claims;

namespace Domain.Interfaces
{
    public interface ITokenService
    {
        string GeneratePasswordResetToken(string email);
        ClaimsPrincipal GetPrincipalFromToken(string token);
    }
}