using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;
using Domain.Interfaces;
using Infrastructure.Settings;

public class EmailService : IEmailService
{
    private readonly EmailSettings _emailSettings;

    public EmailService(IOptions<EmailSettings> emailSettings)
    {
        _emailSettings = emailSettings.Value;
    }

    public async Task SendEmailAsync(string to, string subject, string body)
    {
        var fromAddress = new MailAddress(_emailSettings.FromEmail, "Your App Name");
        var toAddress = new MailAddress(to);

        using (var smtpClient = new SmtpClient
               {
                   Host = "smtp.gmail.com",
                   Port = 587,
                   EnableSsl = true,
                   DeliveryMethod = SmtpDeliveryMethod.Network,
                   UseDefaultCredentials = false,
                   Credentials = new NetworkCredential(fromAddress.Address, _emailSettings.EmailPassword)
               })
        using (var message = new MailMessage(fromAddress, toAddress)
               {
                   Subject = subject,
                   Body = body,
                   IsBodyHtml = true
               })
        {
            await smtpClient.SendMailAsync(message);
        }
    }
}