using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Persistence.Migrations
{
    /// <inheritdoc />
    public partial class SeedInitialData : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "Bio", "CreatedAt", "Email", "FirstName", "LastName", "PasswordHash", "PasswordResetToken", "PasswordSalt", "UpdatedAt", "Username", "VerificationToken" },
                values: new object[] { 1, "Computer Engineering Student", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "michaeladu@gmail.com", "Michael", "Adu", new byte[] { 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205 }, "None", new byte[] { 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205, 239, 171, 205 }, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "mikkayadu", "akdl8elslejdl" });

            migrationBuilder.InsertData(
                table: "Posts",
                columns: new[] { "Id", "Content", "CreatedAt", "Tag", "UpdatedAt", "UserId" },
                values: new object[] { 1, "My first Post", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "Entertainment", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), 1 });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Posts",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "Id",
                keyValue: 1);
        }
    }
}
