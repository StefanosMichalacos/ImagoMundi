using Microsoft.EntityFrameworkCore.Migrations;

namespace ImagoMundi.Migrations
{
    public partial class usertest : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Maps_Continents_ContinentId",
                table: "Maps");

            migrationBuilder.DropIndex(
                name: "IX_Maps_ContinentId",
                table: "Maps");

            migrationBuilder.DropColumn(
                name: "ContinentId",
                table: "Maps");

            migrationBuilder.AddColumn<string>(
                name: "AppUserId",
                table: "Orders",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Afm",
                table: "AspNetUsers",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "FirstName",
                table: "AspNetUsers",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LastName",
                table: "AspNetUsers",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Orders_AppUserId",
                table: "Orders",
                column: "AppUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_AspNetUsers_AppUserId",
                table: "Orders",
                column: "AppUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Orders_AspNetUsers_AppUserId",
                table: "Orders");

            migrationBuilder.DropIndex(
                name: "IX_Orders_AppUserId",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "AppUserId",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "Afm",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "FirstName",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "LastName",
                table: "AspNetUsers");

            migrationBuilder.AddColumn<int>(
                name: "ContinentId",
                table: "Maps",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Maps_ContinentId",
                table: "Maps",
                column: "ContinentId");

            migrationBuilder.AddForeignKey(
                name: "FK_Maps_Continents_ContinentId",
                table: "Maps",
                column: "ContinentId",
                principalTable: "Continents",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
