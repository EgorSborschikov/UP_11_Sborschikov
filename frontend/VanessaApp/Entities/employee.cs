using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class employee
{
    [Key]
    public int IDEmployee { get; set; }

    public int IDBranch { get; set; }

    public int IDPosition { get; set; }

    public int IDAuth { get; set; }

    [StringLength(25)]
    public string Surname { get; set; } = null!;

    [StringLength(30)]
    public string Name { get; set; } = null!;

    [StringLength(35)]
    public string LastName { get; set; } = null!;

    [StringLength(20)]
    public string PassportData { get; set; } = null!;

    [StringLength(20)]
    public string PhoneNumber { get; set; } = null!;

    [StringLength(100)]
    public string Email { get; set; } = null!;

    [ForeignKey("IDAuth")]
    [InverseProperty("employees")]
    public virtual auth IDAuthNavigation { get; set; } = null!;

    [ForeignKey("IDBranch")]
    [InverseProperty("employees")]
    public virtual branch IDBranchNavigation { get; set; } = null!;

    [ForeignKey("IDPosition")]
    [InverseProperty("employees")]
    public virtual position IDPositionNavigation { get; set; } = null!;

    [InverseProperty("IDEmployeeNavigation")]
    public virtual ICollection<coupon> coupons { get; set; } = new List<coupon>();

    [InverseProperty("IDEmployeeNavigation")]
    public virtual ICollection<salary> salaries { get; set; } = new List<salary>();

    [InverseProperty("IDEmployeeNavigation")]
    public virtual ICollection<sale_of_pharmacy_product> sale_of_pharmacy_products { get; set; } = new List<sale_of_pharmacy_product>();
}
