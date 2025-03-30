using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class VanessaDbContext : DbContext
{
    public VanessaDbContext()
    {
    }

    public VanessaDbContext(DbContextOptions<VanessaDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<animal_type> animal_types { get; set; }

    public virtual DbSet<auth> auths { get; set; }

    public virtual DbSet<branch> branches { get; set; }

    public virtual DbSet<city> cities { get; set; }

    public virtual DbSet<client> clients { get; set; }

    public virtual DbSet<coupon> coupons { get; set; }

    public virtual DbSet<employee> employees { get; set; }

    public virtual DbSet<online_order> online_orders { get; set; }

    public virtual DbSet<patient_by_coupon> patient_by_coupons { get; set; }

    public virtual DbSet<payment> payments { get; set; }

    public virtual DbSet<payments_method> payments_methods { get; set; }

    public virtual DbSet<pharmacy_product> pharmacy_products { get; set; }

    public virtual DbSet<pickup_point> pickup_points { get; set; }

    public virtual DbSet<position> positions { get; set; }

    public virtual DbSet<salary> salaries { get; set; }

    public virtual DbSet<sale_of_pharmacy_product> sale_of_pharmacy_products { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Database=vanessa_company;Username=postgres;Password=Erwin23154");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<animal_type>(entity =>
        {
            entity.HasKey(e => e.IDAnimalType).HasName("animal_type_pkey");
        });

        modelBuilder.Entity<auth>(entity =>
        {
            entity.HasKey(e => e.IDAuth).HasName("auth_pkey");
        });

        modelBuilder.Entity<branch>(entity =>
        {
            entity.HasKey(e => e.IDBranch).HasName("branches_pkey");

            entity.Property(e => e.IDBranch).HasDefaultValueSql("nextval('\"branches_IDBrabch_seq\"'::regclass)");

            entity.HasOne(d => d.IDCityNavigation).WithMany(p => p.branches)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("branches_IDCity_fkey");
        });

        modelBuilder.Entity<city>(entity =>
        {
            entity.HasKey(e => e.IDCity).HasName("cities_pkey");
        });

        modelBuilder.Entity<client>(entity =>
        {
            entity.HasKey(e => e.IDClient).HasName("clinets_pkey");

            entity.Property(e => e.IDClient).HasDefaultValueSql("nextval('\"clinets_IDClient_seq\"'::regclass)");
        });

        modelBuilder.Entity<coupon>(entity =>
        {
            entity.HasKey(e => e.IDCoupon).HasName("coupons_pkey");

            entity.HasOne(d => d.IDClientsNavigation).WithMany(p => p.coupons)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("coupons_IDClients_fkey");

            entity.HasOne(d => d.IDEmployeeNavigation).WithMany(p => p.coupons)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("coupons_IDEmployee_fkey");
        });

        modelBuilder.Entity<employee>(entity =>
        {
            entity.HasKey(e => e.IDEmployee).HasName("employees_pkey");

            entity.Property(e => e.IDEmployee).ValueGeneratedNever();

            entity.HasOne(d => d.IDAuthNavigation).WithMany(p => p.employees)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("employees_IDAuth_fkey");

            entity.HasOne(d => d.IDBranchNavigation).WithMany(p => p.employees)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("employees_IDBranch_fkey");

            entity.HasOne(d => d.IDPositionNavigation).WithMany(p => p.employees)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("employees_IDPosition_fkey");
        });

        modelBuilder.Entity<online_order>(entity =>
        {
            entity.HasKey(e => e.IDOnlineOrder).HasName("online_orders_pkey");

            entity.HasOne(d => d.IDClientNavigation).WithMany(p => p.online_orders)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("online_orders_IDClient_fkey");

            entity.HasOne(d => d.IDPaymentMethodNavigation).WithMany(p => p.online_orders)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("online_orders_IDPaymentMethod_fkey");

            entity.HasOne(d => d.IDPharmacyProductNavigation).WithMany(p => p.online_orders)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("online_orders_IDPharmacyProduct_fkey");

            entity.HasOne(d => d.IDPickupPointNavigation).WithMany(p => p.online_orders)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("online_orders_IDPickupPoint_fkey");
        });

        modelBuilder.Entity<patient_by_coupon>(entity =>
        {
            entity.HasKey(e => e.IDReception).HasName("patient_by_coupon_pkey");

            entity.HasOne(d => d.IDAnimalTypeNavigation).WithMany(p => p.patient_by_coupons)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("patient_by_coupon_IDAnimalType_fkey");

            entity.HasOne(d => d.IDCouponNavigation).WithMany(p => p.patient_by_coupons)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("patient_by_coupon_IDCoupon_fkey");

            entity.HasOne(d => d.IDPharmacyProductNavigation).WithMany(p => p.patient_by_coupons)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("patient_by_coupon_IDPharmacyProduct_fkey");
        });

        modelBuilder.Entity<payment>(entity =>
        {
            entity.HasKey(e => e.IDPayment).HasName("payments_pkey");

            entity.HasOne(d => d.IDPaymentMethodNavigation).WithMany(p => p.payments)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("payments_IDPaymentMethod_fkey");

            entity.HasOne(d => d.IDReceptionNavigation).WithMany(p => p.payments)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("payments_IDReception_fkey");
        });

        modelBuilder.Entity<payments_method>(entity =>
        {
            entity.HasKey(e => e.IDPaymentMethod).HasName("payments_methods_pkey");

            entity.Property(e => e.Method).IsFixedLength();
        });

        modelBuilder.Entity<pharmacy_product>(entity =>
        {
            entity.HasKey(e => e.IDPharmacyProduct).HasName("pharmacy_products_pkey");
        });

        modelBuilder.Entity<pickup_point>(entity =>
        {
            entity.HasKey(e => e.IDPickupPoints).HasName("pickup_points_pkey");

            entity.HasOne(d => d.IDCityNavigation).WithMany(p => p.pickup_points)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("pickup_points_IDCity_fkey");
        });

        modelBuilder.Entity<position>(entity =>
        {
            entity.HasKey(e => e.IDPosition).HasName("positions_pkey");
        });

        modelBuilder.Entity<salary>(entity =>
        {
            entity.HasKey(e => e.IDSalaries).HasName("salaries_pkey");

            entity.HasOne(d => d.IDPositionNavigation).WithMany(p => p.salaries)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("salaries_IDPosition_fkey");
        });

        modelBuilder.Entity<sale_of_pharmacy_product>(entity =>
        {
            entity.HasKey(e => e.IDSale).HasName("sale_of_pharmacy_products_pkey");

            entity.HasOne(d => d.IDClientNavigation).WithMany(p => p.sale_of_pharmacy_products)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("sale_of_pharmacy_products_IDClient_fkey");

            entity.HasOne(d => d.IDPharmacyProductNavigation).WithMany(p => p.sale_of_pharmacy_products)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("sale_of_pharmacy_products_IDPharmacyProduct_fkey");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
