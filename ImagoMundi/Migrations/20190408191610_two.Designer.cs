﻿// <auto-generated />
using System;
using ImagoMundi.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace ImagoMundi.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    [Migration("20190408191610_two")]
    partial class two
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.1.8-servicing-32085")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("ImagoMundi.Models.Cart", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("CartId");

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<string>("Name");

                    b.Property<int>("ProductId");

                    b.Property<int>("Quantity");

                    b.Property<Guid>("UpdatedById");

                    b.Property<int>("UserId");

                    b.HasKey("Id");

                    b.ToTable("Carts");
                });

            modelBuilder.Entity("ImagoMundi.Models.Continent", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<string>("Name");

                    b.Property<Guid>("UpdatedById");

                    b.HasKey("Id");

                    b.ToTable("Continents");
                });

            modelBuilder.Entity("ImagoMundi.Models.Country", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("ContinentId");

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<string>("Name");

                    b.Property<Guid>("UpdatedById");

                    b.HasKey("Id");

                    b.HasIndex("ContinentId");

                    b.ToTable("Countries");
                });

            modelBuilder.Entity("ImagoMundi.Models.Discount", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<string>("Name");

                    b.Property<float>("Percentage");

                    b.Property<Guid>("UpdatedById");

                    b.HasKey("Id");

                    b.ToTable("Discounts");
                });

            modelBuilder.Entity("ImagoMundi.Models.Globe", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<int>("DiscountId");

                    b.Property<int>("ImageId");

                    b.Property<int>("MaterialId");

                    b.Property<string>("Name");

                    b.Property<float>("Price");

                    b.Property<int>("Quantity");

                    b.Property<int>("Sales");

                    b.Property<int>("SizeId");

                    b.Property<int>("TaxId");

                    b.Property<Guid>("UpdatedById");

                    b.HasKey("Id");

                    b.HasIndex("DiscountId");

                    b.HasIndex("ImageId");

                    b.HasIndex("MaterialId");

                    b.HasIndex("SizeId");

                    b.HasIndex("TaxId");

                    b.ToTable("Globes");
                });

            modelBuilder.Entity("ImagoMundi.Models.Image", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<int>("ImageId");

                    b.Property<string>("Name");

                    b.Property<string>("Path");

                    b.Property<Guid>("UpdatedById");

                    b.HasKey("Id");

                    b.ToTable("Images");
                });

            modelBuilder.Entity("ImagoMundi.Models.Map", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("ContinentId");

                    b.Property<int>("CountryId");

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<int>("DiscountId");

                    b.Property<int>("ImageId");

                    b.Property<int>("MapTypeId");

                    b.Property<int>("MaterialId");

                    b.Property<string>("Name");

                    b.Property<float>("Price");

                    b.Property<int>("Quantity");

                    b.Property<int>("Sales");

                    b.Property<int>("SizeId");

                    b.Property<int>("TaxId");

                    b.Property<Guid>("UpdatedById");

                    b.HasKey("Id");

                    b.HasIndex("ContinentId");

                    b.HasIndex("CountryId");

                    b.HasIndex("DiscountId");

                    b.HasIndex("ImageId");

                    b.HasIndex("MapTypeId");

                    b.HasIndex("MaterialId");

                    b.HasIndex("SizeId");

                    b.HasIndex("TaxId");

                    b.ToTable("Maps");
                });

            modelBuilder.Entity("ImagoMundi.Models.MapType", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<string>("Name");

                    b.Property<Guid>("UpdatedById");

                    b.HasKey("Id");

                    b.ToTable("MapTypes");
                });

            modelBuilder.Entity("ImagoMundi.Models.Material", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<string>("Name");

                    b.Property<string>("Type");

                    b.Property<Guid>("UpdatedById");

                    b.HasKey("Id");

                    b.ToTable("Materials");
                });

            modelBuilder.Entity("ImagoMundi.Models.Order", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Address");

                    b.Property<int>("CartId");

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<int>("DiscountId");

                    b.Property<int>("ImageId");

                    b.Property<string>("Name");

                    b.Property<string>("PaymentType");

                    b.Property<int>("StatusId");

                    b.Property<float>("TotalPrice");

                    b.Property<Guid>("UpdatedById");

                    b.Property<int>("UserId");

                    b.HasKey("Id");

                    b.HasIndex("StatusId");

                    b.ToTable("Orders");
                });

            modelBuilder.Entity("ImagoMundi.Models.ProductBought", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("CartId");

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<string>("Name");

                    b.Property<int>("ProductId");

                    b.Property<int>("Quantity");

                    b.Property<Guid>("UpdatedById");

                    b.Property<int>("UserId");

                    b.HasKey("Id");

                    b.ToTable("ProductsBought");
                });

            modelBuilder.Entity("ImagoMundi.Models.Size", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<string>("Name");

                    b.Property<Guid>("UpdatedById");

                    b.HasKey("Id");

                    b.ToTable("Sizes");
                });

            modelBuilder.Entity("ImagoMundi.Models.Status", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<string>("Name");

                    b.Property<Guid>("UpdatedById");

                    b.HasKey("Id");

                    b.ToTable("Statuses");
                });

            modelBuilder.Entity("ImagoMundi.Models.Tax", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<Guid>("CreatedById");

                    b.Property<DateTime?>("DateCreated");

                    b.Property<DateTime?>("DateUpdated");

                    b.Property<string>("Description");

                    b.Property<string>("Name");

                    b.Property<float>("Percentage");

                    b.Property<Guid>("UpdatedById");

                    b.HasKey("Id");

                    b.ToTable("Taxes");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRole", b =>
                {
                    b.Property<string>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken();

                    b.Property<string>("Name")
                        .HasMaxLength(256);

                    b.Property<string>("NormalizedName")
                        .HasMaxLength(256);

                    b.HasKey("Id");

                    b.HasIndex("NormalizedName")
                        .IsUnique()
                        .HasName("RoleNameIndex")
                        .HasFilter("[NormalizedName] IS NOT NULL");

                    b.ToTable("AspNetRoles");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("ClaimType");

                    b.Property<string>("ClaimValue");

                    b.Property<string>("RoleId")
                        .IsRequired();

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetRoleClaims");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUser", b =>
                {
                    b.Property<string>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int>("AccessFailedCount");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken();

                    b.Property<string>("Email")
                        .HasMaxLength(256);

                    b.Property<bool>("EmailConfirmed");

                    b.Property<bool>("LockoutEnabled");

                    b.Property<DateTimeOffset?>("LockoutEnd");

                    b.Property<string>("NormalizedEmail")
                        .HasMaxLength(256);

                    b.Property<string>("NormalizedUserName")
                        .HasMaxLength(256);

                    b.Property<string>("PasswordHash");

                    b.Property<string>("PhoneNumber");

                    b.Property<bool>("PhoneNumberConfirmed");

                    b.Property<string>("SecurityStamp");

                    b.Property<bool>("TwoFactorEnabled");

                    b.Property<string>("UserName")
                        .HasMaxLength(256);

                    b.HasKey("Id");

                    b.HasIndex("NormalizedEmail")
                        .HasName("EmailIndex");

                    b.HasIndex("NormalizedUserName")
                        .IsUnique()
                        .HasName("UserNameIndex")
                        .HasFilter("[NormalizedUserName] IS NOT NULL");

                    b.ToTable("AspNetUsers");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("ClaimType");

                    b.Property<string>("ClaimValue");

                    b.Property<string>("UserId")
                        .IsRequired();

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserClaims");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.Property<string>("LoginProvider")
                        .HasMaxLength(128);

                    b.Property<string>("ProviderKey")
                        .HasMaxLength(128);

                    b.Property<string>("ProviderDisplayName");

                    b.Property<string>("UserId")
                        .IsRequired();

                    b.HasKey("LoginProvider", "ProviderKey");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserLogins");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.Property<string>("UserId");

                    b.Property<string>("RoleId");

                    b.HasKey("UserId", "RoleId");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetUserRoles");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.Property<string>("UserId");

                    b.Property<string>("LoginProvider")
                        .HasMaxLength(128);

                    b.Property<string>("Name")
                        .HasMaxLength(128);

                    b.Property<string>("Value");

                    b.HasKey("UserId", "LoginProvider", "Name");

                    b.ToTable("AspNetUserTokens");
                });

            modelBuilder.Entity("ImagoMundi.Models.Country", b =>
                {
                    b.HasOne("ImagoMundi.Models.Continent", "Continent")
                        .WithMany("Countries")
                        .HasForeignKey("ContinentId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("ImagoMundi.Models.Globe", b =>
                {
                    b.HasOne("ImagoMundi.Models.Discount", "Discount")
                        .WithMany("Globes")
                        .HasForeignKey("DiscountId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("ImagoMundi.Models.Image", "Image")
                        .WithMany("Globes")
                        .HasForeignKey("ImageId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("ImagoMundi.Models.Material", "Material")
                        .WithMany("Globes")
                        .HasForeignKey("MaterialId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("ImagoMundi.Models.Size", "Size")
                        .WithMany("Globes")
                        .HasForeignKey("SizeId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("ImagoMundi.Models.Tax", "Tax")
                        .WithMany("Globes")
                        .HasForeignKey("TaxId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("ImagoMundi.Models.Map", b =>
                {
                    b.HasOne("ImagoMundi.Models.Continent")
                        .WithMany("Maps")
                        .HasForeignKey("ContinentId");

                    b.HasOne("ImagoMundi.Models.Country", "Country")
                        .WithMany("Maps")
                        .HasForeignKey("CountryId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("ImagoMundi.Models.Discount", "Discount")
                        .WithMany("Maps")
                        .HasForeignKey("DiscountId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("ImagoMundi.Models.Image", "Image")
                        .WithMany("Maps")
                        .HasForeignKey("ImageId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("ImagoMundi.Models.MapType", "MapType")
                        .WithMany("Maps")
                        .HasForeignKey("MapTypeId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("ImagoMundi.Models.Material", "Material")
                        .WithMany("Maps")
                        .HasForeignKey("MaterialId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("ImagoMundi.Models.Size", "Size")
                        .WithMany("Maps")
                        .HasForeignKey("SizeId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("ImagoMundi.Models.Tax", "Tax")
                        .WithMany("Maps")
                        .HasForeignKey("TaxId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("ImagoMundi.Models.Order", b =>
                {
                    b.HasOne("ImagoMundi.Models.Status")
                        .WithMany("Orders")
                        .HasForeignKey("StatusId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole")
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole")
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });
#pragma warning restore 612, 618
        }
    }
}
