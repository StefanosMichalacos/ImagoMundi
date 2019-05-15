using Microsoft.EntityFrameworkCore.Migrations;

namespace ImagoMundi.Migrations
{
    public partial class sku2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ProductId",
                table: "Carts");

            migrationBuilder.AddColumn<string>(
                name: "ProductSKU",
                table: "Carts",
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ProductSKU",
                table: "Carts");

            migrationBuilder.AddColumn<int>(
                name: "ProductId",
                table: "Carts",
                nullable: false,
                defaultValue: 0);
        }
    }
}
