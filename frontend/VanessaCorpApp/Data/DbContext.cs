using Microsoft.EntityFrameworkCore;
using VanessaCorpApp.Entities;

namespace VanessaCorpApp.Data;

public class ApplicationDbContext : DbContext
{
    public DbSet<AnimalType> AnimalTypes { get; set; }
    public DbSet<Auth> Auth { get; set; }
    public DbSet<City> Cities { get; set; }
    public DbSet<Client> Clients { get; set; }
    public DbSet<PaymentMethod> PaymentMethods { get; set; }
    public DbSet<PharmacyProduct> PharmacyProducts { get; set; }
    public DbSet<Position> Positions { get; set; }
    public DbSet<Branch> Branches { get; set; }
    public DbSet<PickupPoint> PickupPoints { get; set; }
    public DbSet<Employee> Employees { get; set; }
    public DbSet<OnlineOrder> OnlineOrders { get; set; }
    public DbSet<Coupon> Coupons { get; set; }
    public DbSet<Salary> Salaries { get; set; }
    public DbSet<SaleOfPharmacyProduct> SaleOfPharmacyProducts { get; set; }
    public DbSet<PatientByCoupon> PatientByCoupons { get; set; }
    public DbSet<Payment> Payments { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=vanessa_company;Username=postgres;Password=Erwin23154");
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Настройка AnimalType
        modelBuilder.Entity<AnimalType>(entity =>
        {
            entity.HasKey(e => e.IDAnimalType);
            entity.Property(e => e.Type).IsRequired().HasMaxLength(30);
        });

        // Настройка Auth
        modelBuilder.Entity<Auth>(entity =>
        {
            entity.ToTable("auth"); // Убедитесь, что имя таблицы совпадает
            entity.HasKey(e => e.IDAuth);
            entity.Property(e => e.Login).IsRequired().HasMaxLength(100);
            entity.Property(e => e.Password).IsRequired().HasMaxLength(100);
        });


        // Настройка City
        modelBuilder.Entity<City>(entity =>
        {
            entity.HasKey(e => e.IDCity);
            entity.Property(e => e.Name).IsRequired().HasMaxLength(50);
        });

        // Настройка Client
        modelBuilder.Entity<Client>(entity =>
        {
            entity.HasKey(e => e.IDClient);
            entity.Property(e => e.Surname).IsRequired().HasMaxLength(30);
            entity.Property(e => e.Name).IsRequired().HasMaxLength(35);
            entity.Property(e => e.Lastname).IsRequired().HasMaxLength(40);
            entity.Property(e => e.Email).IsRequired().HasMaxLength(100);
        });

        // Настройка PaymentMethod
        modelBuilder.Entity<PaymentMethod>(entity =>
        {
            entity.HasKey(e => e.IDPaymentMethod);
            entity.Property(e => e.Method).IsRequired().HasMaxLength(50);
        });

        // Настройка PharmacyProduct
        modelBuilder.Entity<PharmacyProduct>(entity =>
        {
            entity.HasKey(e => e.IDPharmacyProduct);
            entity.Property(e => e.ProductName).IsRequired().HasMaxLength(50);
            entity.Property(e => e.Price).HasColumnType("MONEY");
        });

        // Настройка Position
        modelBuilder.Entity<Position>(entity =>
        {
            entity.HasKey(e => e.IDPosition);
            entity.Property(e => e.PositionName).IsRequired().HasMaxLength(50);
        });

        // Настройка Branch
        modelBuilder.Entity<Branch>(entity =>
        {
            entity.HasKey(e => e.IDBranch);
            entity.Property(e => e.BranchName).IsRequired().HasMaxLength(50);
            entity.Property(e => e.Address).IsRequired().HasMaxLength(50);

            entity.HasOne(b => b.City)
                .WithMany(c => c.Branches)
                .HasForeignKey(b => b.IDCity);
        });

        // Настройка PickupPoint
        modelBuilder.Entity<PickupPoint>(entity =>
        {
            entity.HasKey(p => p.IDPickupPoints);

            entity.HasOne(p => p.City)
                .WithMany(c => c.PickupPoints)
                .HasForeignKey(p => p.IDCity);
        });

        // Настройка Employee
        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.IDEmployee);
            entity.Property(e => e.Surname).IsRequired().HasMaxLength(25);
            entity.Property(e => e.Name).IsRequired().HasMaxLength(30);
            entity.Property(e => e.LastName).IsRequired().HasMaxLength(35);
            entity.Property(e => e.PassportData).IsRequired().HasMaxLength(20);
            entity.Property(e => e.PhoneNumber).IsRequired().HasMaxLength(20);
            entity.Property(e => e.Email).IsRequired().HasMaxLength(100);

            entity.HasOne(e => e.Auth)
                .WithMany(a => a.Employees)
                .HasForeignKey(e => e.IDAuth);

            entity.HasOne(e => e.Branch)
                .WithMany(b => b.Employees)
                .HasForeignKey(e => e.IDBranch);

            entity.HasOne(e => e.Position)
                .WithMany(p => p.Employees)
                .HasForeignKey(e => e.IDPosition);
        });

        // Настройка OnlineOrder
        modelBuilder.Entity<OnlineOrder>(entity =>
        {
            entity.HasKey(o => o.IDOnlineOrder);

            entity.HasOne(o => o.Client)
                .WithMany(c => c.OnlineOrders)
                .HasForeignKey(o => o.IDClient);

            entity.HasOne(o => o.PharmacyProduct)
                .WithMany(p => p.OnlineOrders)
                .HasForeignKey(o => o.IDPharmacyProduct);

            entity.HasOne(o => o.PickupPoint)
                .WithMany(p => p.OnlineOrders)
                .HasForeignKey(o => o.IDPickupPoint);
        });

        // Настройка Coupon
        modelBuilder.Entity<Coupon>(entity =>
        {
            entity.HasKey(c => c.IDCoupon);

            entity.HasOne(c => c.Client)
                .WithMany(cl => cl.Coupons)
                .HasForeignKey(c => c.IDClient);

            entity.HasOne(c => c.Employee)
                .WithMany(e => e.Coupons)
                .HasForeignKey(c => c.IDEmployee);
        });

        // Настройка Salary
        modelBuilder.Entity<Salary>(entity =>
        {
            entity.HasKey(s => s.IDSalary);
            entity.Property(s => s.SalaryAmount).HasColumnType("MONEY");

            entity.HasOne(s => s.Employee)
                .WithMany(e => e.Salaries)
                .HasForeignKey(s => s.IDEmployee);
        });

        // Настройка SaleOfPharmacyProduct
        modelBuilder.Entity<SaleOfPharmacyProduct>(entity =>
        {
            entity.HasKey(s => s.IDSale);

            entity.HasOne(s => s.Client)
                .WithMany(c => c.SaleOfPharmacyProducts)
                .HasForeignKey(s => s.IDClient);

            entity.HasOne(s => s.Employee)
                .WithMany(e => e.SaleOfPharmacyProducts)
                .HasForeignKey(s => s.IDEmployee);

            entity.HasOne(s => s.PharmacyProduct)
                .WithMany(p => p.SaleOfPharmacyProducts)
                .HasForeignKey(s => s.IDPharmacyProduct);
        });

        // Настройка PatientByCoupon
        modelBuilder.Entity<PatientByCoupon>(entity =>
        {
            entity.HasKey(p => p.IDReception);
            entity.Property(p => p.Complaints).IsRequired().HasMaxLength(255);
            entity.Property(p => p.Custody).IsRequired().HasMaxLength(500);
            entity.Property(p => p.Conclusions).HasMaxLength(500);

            entity.HasOne(p => p.AnimalType)
                .WithMany(a => a.PatientByCoupons)
                .HasForeignKey(p => p.IDAnimalType);

            entity.HasOne(p => p.Coupon)
                .WithMany(c => c.PatientByCoupons)
                .HasForeignKey(p => p.IDCoupon);

            entity.HasOne(p => p.PharmacyProduct)
                .WithMany(ph => ph.PatientByCoupons)
                .HasForeignKey(p => p.IDPharmacyProduct);
        });

        // Настройка Payment
        modelBuilder.Entity<Payment>(entity =>
        {
            entity.HasKey(p => p.IDPayment);
            entity.Property(p => p.Price).HasColumnType("MONEY");

            entity.HasOne(p => p.PaymentMethod)
                .WithMany(pm => pm.Payments)
                .HasForeignKey(p => p.IDPaymentMethod);

            entity.HasOne(p => p.PatientByCoupon)
                .WithMany(pbc => pbc.Payments)
                .HasForeignKey(p => p.IDReception);
        });
    }
}