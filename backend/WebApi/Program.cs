using Application.Features.Users.Commands;
using Domain.Interfaces;
using Persistence.Configurations;
using Persistence.Repositories;
using Infrastructure.Security;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using Persistence;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Application.Features.UsersCommands;
using Infrastructure.Settings;
using System.Reflection;
using Application.Features.UsersQueries.Queries;
using Application.Features.PostCommands.Commands;
using Application.Features.PostQueries.Queries;
using Infrastructure.EmailService;
using DotNetEnv;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
DotNetEnv.Env.Load();
var host = System.Environment.GetEnvironmentVariable("HOST");
var user_id = System.Environment.GetEnvironmentVariable("USER_ID");
var password = System.Environment.GetEnvironmentVariable("PASSWORD");
var database = System.Environment.GetEnvironmentVariable("DATABASE");
var port = System.Environment.GetEnvironmentVariable("PORT");
var pooling = System.Environment.GetEnvironmentVariable("POOLING");

var connectionString = $"Host={host}; Database={user_id};Username={user_id};Password={password};"; ;
Console.WriteLine(connectionString);
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseNpgsql($"Host=postgres; Database=GhanaStarterProject;Username=postgres;Password={password};Port=5432"));

builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IPostRepository, PostRepository>();
builder.Services.AddScoped<IPasswordHasher, PasswordHasher>();

builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(Assembly.GetExecutingAssembly()));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(RegisterUserCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(typeof(LoginUserCommand).Assembly));
builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(
    typeof(GetPostsByUserIdQuery).Assembly,
    typeof(Program).Assembly
));

builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(
    typeof(GetPostByIdQuery).Assembly,
    typeof(Program).Assembly
));

builder.Services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(
    typeof(CreatePostCommand).Assembly,
    typeof(Program).Assembly
));

// Email Service
builder.Services.AddSingleton<IEmailService, EmailService>();
builder.Services.AddScoped<ITokenService, TokenService>();

builder.Services.AddAuthentication(options =>
    {
        options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
        options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    }).AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateIssuerSigningKey = true,
            ValidateLifetime = true,
            ValidIssuer = builder.Configuration["Jwt:Issuer"],
            ValidAudience = builder.Configuration["Jwt:Audience"],
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
        };
    });

// Configure Swagger
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "My API", Version = "v1" });
});

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
    app.UseSwagger();
    app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1"));
}

//app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();