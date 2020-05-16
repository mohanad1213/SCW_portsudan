using Microsoft.EntityFrameworkCore.Migrations;

namespace csdbeapp.dashboard.Data.Migrations
{
    public partial class addOrderToPost : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Order",
                table: "Post",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Order",
                table: "Post");
        }
    }
}
