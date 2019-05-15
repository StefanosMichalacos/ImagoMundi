 using System;
using System.Collections.Generic;
using System.Text;
using ImagoMundi.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace ImagoMundi.Data
{
    public class ApplicationDbContext : IdentityDbContext<AppUser,Role,string>
    {
        public DbSet<Map> Maps { get; set; }
        public DbSet<MapType> MapTypes { get; set; }
        public DbSet<Globe> Globes { get; set; }
        public DbSet<Material> Materials { get; set; }
        public DbSet<Size> Sizes { get; set; }
        public DbSet<Cart> Carts { get; set; }  
        public DbSet<Order> Orders { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<Tax> Taxes { get; set; }
        public DbSet<Discount> Discounts { get; set; }
        public DbSet<AppUser> AppUsers { get; set; }
        public new DbSet<Role> Roles { get; set; }



        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            //--------------  Maps  ------------------
            base.OnModelCreating(builder);
            builder.Entity<Map>(entity =>
            {
                entity.ToTable("Maps");
                entity.HasKey(x => x.Id);

                entity.HasOne(m => m.Country)
                .WithMany(c => c.Maps)
                .HasForeignKey(f => f.CountryId);

                entity.HasOne(m => m.MapType)
                .WithMany(t => t.Maps)
                .HasForeignKey(f => f.MapTypeId);

                entity.HasOne(m => m.Size)
               .WithMany(t => t.Maps)
               .HasForeignKey(f => f.SizeId);

                entity.HasOne(m => m.Material)
               .WithMany(t => t.Maps)
               .HasForeignKey(f => f.MaterialId);

                entity.HasOne(m => m.Discount)
               .WithMany(t => t.Maps)
               .HasForeignKey(f => f.DiscountId);

                entity.HasOne(m => m.Tax)
               .WithMany(t => t.Maps)
               .HasForeignKey(f => f.TaxId);

                entity.HasOne(m => m.Image)
               .WithMany(t => t.Maps)
               .HasForeignKey(f => f.ImageId);
            });

            //--------------  Globes  ------------------
            base.OnModelCreating(builder);
            builder.Entity<Globe>(entity =>
            {

                entity.ToTable("Globes");
                entity.HasKey(x => x.Id);

                entity.HasOne(m => m.Size)
               .WithMany(t => t.Globes)
               .HasForeignKey(f => f.SizeId);

                entity.HasOne(m => m.Material)
               .WithMany(t => t.Globes)
               .HasForeignKey(f => f.MaterialId);

                entity.HasOne(m => m.Discount)
               .WithMany(t => t.Globes)
               .HasForeignKey(f => f.DiscountId);

                entity.HasOne(m => m.Tax)
               .WithMany(t => t.Globes)
               .HasForeignKey(f => f.TaxId);

                entity.HasOne(m => m.Image)
               .WithMany(t => t.Globes)
               .HasForeignKey(f => f.ImageId);
            });
            //--------------------------------
            builder.Entity<Cart>(entity =>
            {
                entity.ToTable("Carts")
                .HasKey(c => c.Id);

                entity.HasOne(c => c.User)
                .WithMany(u => u.Carts)
                .HasForeignKey(c => c.UserId);
                entity.HasOne(c => c.Order)
                .WithMany(o => o.Carts)
                .HasForeignKey(c => c.OrderId);

            });
            //--------------------------------
            builder.Entity<Order>(entity =>
            {
                entity.ToTable("Orders")
                .HasKey(x => x.Id);
            });
            //--------------------------------
            builder.Entity<Country>(entity =>
            {
                entity.ToTable("Countries");
                entity.HasKey(x => x.Id);
            });
            //--------------------------------
            builder.Entity<MapType>(entity =>
            {
                entity.ToTable("MapTypes");
                entity.HasKey(x => x.Id);
            });
            //--------------------------------v
            builder.Entity<Size>(entity =>
            {
                entity.ToTable("Sizes");
                entity.HasKey(x => x.Id);
            });
            //--------------------------------
            builder.Entity<Material>(entity =>
            {
                entity.ToTable("Materials");
                entity.HasKey(x => x.Id);
            });
            //--------------------------------
            builder.Entity<Discount>(entity =>
            {
                entity.ToTable("Discounts");
                entity.HasKey(x => x.Id);
            });
            //--------------------------------
            builder.Entity<Tax>(entity =>
            {
                entity.ToTable("Taxes");
                entity.HasKey(x => x.Id);
            });
            //--------------------------------
            builder.Entity<Image>(entity =>
            {
                entity.ToTable("Images");
                entity.HasKey(x => x.Id);
            });
        }
    }
}