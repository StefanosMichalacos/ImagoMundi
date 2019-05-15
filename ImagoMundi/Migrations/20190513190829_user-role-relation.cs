using Microsoft.EntityFrameworkCore.Migrations;

namespace ImagoMundi.Migrations
{
    public partial class userrolerelation : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "SteetAddress",
                table: "AspNetUsers",
                newName: "SrteetAddress");

            migrationBuilder.AddColumn<string>(
                name: "UserRole",
                table: "AspNetUsers",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_UserRole",
                table: "AspNetUsers",
                column: "UserRole");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_AspNetRoles_UserRole",
                table: "AspNetUsers",
                column: "UserRole",
                principalTable: "AspNetRoles",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_AspNetRoles_UserRole",
                table: "AspNetUsers");

            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_UserRole",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "UserRole",
                table: "AspNetUsers");

            migrationBuilder.RenameColumn(
                name: "SrteetAddress",
                table: "AspNetUsers",
                newName: "SteetAddress");
        }
    }
}
