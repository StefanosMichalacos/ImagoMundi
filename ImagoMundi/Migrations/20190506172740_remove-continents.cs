using Microsoft.EntityFrameworkCore.Migrations;

namespace ImagoMundi.Migrations
{
    public partial class removecontinents : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Countries_Continents_ContinentId",
                table: "Countries");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Continents",
                table: "Continents");

            migrationBuilder.RenameTable(
                name: "Continents",
                newName: "Continent");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Continent",
                table: "Continent",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Countries_Continent_ContinentId",
                table: "Countries",
                column: "ContinentId",
                principalTable: "Continent",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Countries_Continent_ContinentId",
                table: "Countries");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Continent",
                table: "Continent");

            migrationBuilder.RenameTable(
                name: "Continent",
                newName: "Continents");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Continents",
                table: "Continents",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Countries_Continents_ContinentId",
                table: "Countries",
                column: "ContinentId",
                principalTable: "Continents",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
