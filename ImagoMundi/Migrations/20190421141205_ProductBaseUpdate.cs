using Microsoft.EntityFrameworkCore.Migrations;

namespace ImagoMundi.Migrations
{
    public partial class ProductBaseUpdate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Keywords",
                table: "Maps",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Keywords",
                table: "Globes",
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Keywords",
                table: "Maps");

            migrationBuilder.DropColumn(
                name: "Keywords",
                table: "Globes");
        }
    }
}
