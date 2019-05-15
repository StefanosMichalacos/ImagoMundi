using Microsoft.EntityFrameworkCore.Migrations;

namespace ImagoMundi.Migrations
{
    public partial class appdbcontextidentityuser : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Afm",
                table: "AspNetUsers");

        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {



            migrationBuilder.AddColumn<string>(
                name: "Afm",
                table: "AspNetUsers",
                maxLength: 9,
                nullable: true);
        }
    }
}
