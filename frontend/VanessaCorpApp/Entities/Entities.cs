using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VanessaCorpApp.Entities;

public class AnimalType
{
    [Key]
    public int IDAnimalType { get; set; }
    public string Type { get; set; }

    public ICollection<PatientByCoupon> PatientByCoupons { get; set; }
}

public class Auth
{
    [Key]
    public int IDAuth { get; set; }
    public string Login { get; set; }
    public string Password { get; set; }

    public ICollection<Employee> Employees { get; set; }
}

public class City
{
    [Key]
    public int IDCity { get; set; }
    public string Name { get; set; }

    public ICollection<Branch> Branches { get; set; }
    public ICollection<PickupPoint> PickupPoints { get; set; }
}

public class Client
{
    [Key]
    public int IDClient { get; set; }
    public string Surname { get; set; }
    public string Name { get; set; }
    public string Lastname { get; set; }
    public string Email { get; set; }

    public ICollection<OnlineOrder> OnlineOrders { get; set; }
    public ICollection<Coupon> Coupons { get; set; }
    public ICollection<SaleOfPharmacyProduct> SaleOfPharmacyProducts { get; set; }
}

public class PaymentMethod
{
    [Key]
    public int IDPaymentMethod { get; set; }
    public string Method { get; set; }

    public ICollection<Payment> Payments { get; set; }
}

public class PharmacyProduct
{
    [Key]
    public int IDPharmacyProduct { get; set; }
    public string ProductName { get; set; }
    public decimal Price { get; set; }

    public ICollection<OnlineOrder> OnlineOrders { get; set; }
    public ICollection<SaleOfPharmacyProduct> SaleOfPharmacyProducts { get; set; }
    public ICollection<PatientByCoupon> PatientByCoupons { get; set; }
}

public class Position
{
    [Key]
    public int IDPosition { get; set; }
    public string PositionName { get; set; }

    public ICollection<Employee> Employees { get; set; }
}

public class Branch
{
    [Key]
    public int IDBranch { get; set; }
    public int IDCity { get; set; }
    public string BranchName { get; set; }
    public string Address { get; set; }

    [ForeignKey("IDCity")]
    public City City { get; set; }
    public ICollection<Employee> Employees { get; set; }
}

public class PickupPoint
{
    [Key]
    public int IDPickupPoints { get; set; }
    public int IDCity { get; set; }

    [ForeignKey("IDCity")]
    public City City { get; set; }
    public ICollection<OnlineOrder> OnlineOrders { get; set; }
}

public class Employee
{
    [Key]
    public int IDEmployee { get; set; }
    public int IDBranch { get; set; }
    public int IDPosition { get; set; }
    public int IDAuth { get; set; }
    public string Surname { get; set; }
    public string Name { get; set; }
    public string LastName { get; set; }
    public string PassportData { get; set; }
    public string PhoneNumber { get; set; }
    public string Email { get; set; }

    [ForeignKey("IDAuth")]
    public Auth Auth { get; set; }
    [ForeignKey("IDBranch")]
    public Branch Branch { get; set; }
    [ForeignKey("IDPosition")]
    public Position Position { get; set; }
    public ICollection<Coupon> Coupons { get; set; }
    public ICollection<Salary> Salaries { get; set; }
    public ICollection<SaleOfPharmacyProduct> SaleOfPharmacyProducts { get; set; }
}

public class OnlineOrder
{
    [Key]
    public int IDOnlineOrder { get; set; }
    public int IDClient { get; set; }
    public int IDPharmacyProduct { get; set; }
    public int IDPickupPoint { get; set; }

    [ForeignKey("IDClient")]
    public Client Client { get; set; }
    [ForeignKey("IDPharmacyProduct")]
    public PharmacyProduct PharmacyProduct { get; set; }
    [ForeignKey("IDPickupPoint")]
    public PickupPoint PickupPoint { get; set; }
}

public class Coupon
{
    [Key]
    public int IDCoupon { get; set; }
    public int IDClient { get; set; }
    public int IDEmployee { get; set; }

    [ForeignKey("IDClient")]
    public Client Client { get; set; }
    [ForeignKey("IDEmployee")]
    public Employee Employee { get; set; }
    public ICollection<PatientByCoupon> PatientByCoupons { get; set; }
}

public class Salary
{
    [Key]
    public int IDSalary { get; set; }
    public int IDEmployee { get; set; }
    public decimal SalaryAmount { get; set; }

    [ForeignKey("IDEmployee")]
    public Employee Employee { get; set; }
}

public class SaleOfPharmacyProduct
{
    [Key]
    public int IDSale { get; set; }
    public int IDEmployee { get; set; }
    public int IDClient { get; set; }
    public int IDPharmacyProduct { get; set; }

    [ForeignKey("IDEmployee")]
    public Employee Employee { get; set; }
    [ForeignKey("IDClient")]
    public Client Client { get; set; }
    [ForeignKey("IDPharmacyProduct")]
    public PharmacyProduct PharmacyProduct { get; set; }
}

public class PatientByCoupon
{
    [Key]
    public int IDReception { get; set; }
    public int IDCoupon { get; set; }
    public int IDAnimalType { get; set; }
    public int IDPharmacyProduct { get; set; }
    public bool RegularInspection { get; set; }
    public string Complaints { get; set; }
    public string Custody { get; set; }
    public string Conclusions { get; set; }

    [ForeignKey("IDAnimalType")]
    public AnimalType AnimalType { get; set; }
    [ForeignKey("IDCoupon")]
    public Coupon Coupon { get; set; }
    [ForeignKey("IDPharmacyProduct")]
    public PharmacyProduct PharmacyProduct { get; set; }
    public ICollection<Payment> Payments { get; set; }
}

public class Payment
{
    [Key]
    public int IDPayment { get; set; }
    public int IDReception { get; set; }
    public int IDPaymentMethod { get; set; }
    public decimal Price { get; set; }

    [ForeignKey("IDPaymentMethod")]
    public PaymentMethod PaymentMethod { get; set; }
    [ForeignKey("IDReception")]
    public PatientByCoupon PatientByCoupon { get; set; }
}