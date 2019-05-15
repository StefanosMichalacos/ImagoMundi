using Microsoft.EntityFrameworkCore.Migrations;

namespace ImagoMundi.Migrations
{
    public partial class two : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Globes_Carts_CartId",
                table: "Globes");

            migrationBuilder.DropForeignKey(
                name: "FK_Maps_Carts_CartId",
                table: "Maps");

            migrationBuilder.DropIndex(
                name: "IX_Maps_CartId",
                table: "Maps");

            migrationBuilder.DropIndex(
                name: "IX_Globes_CartId",
                table: "Globes");

            migrationBuilder.DropColumn(
                name: "CartId",
                table: "Maps");

            migrationBuilder.DropColumn(
                name: "CartId",
                table: "Globes");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "CartId",
                table: "Maps",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CartId",
                table: "Globes",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Maps_CartId",
                table: "Maps",
                column: "CartId");

            migrationBuilder.CreateIndex(
                name: "IX_Globes_CartId",
                table: "Globes",
                column: "CartId");

            migrationBuilder.AddForeignKey(
                name: "FK_Globes_Carts_CartId",
                table: "Globes",
                column: "CartId",
                principalTable: "Carts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Maps_Carts_CartId",
                table: "Maps",
                column: "CartId",
                principalTable: "Carts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
