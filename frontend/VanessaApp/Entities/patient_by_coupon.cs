using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

[Table("patient_by_coupon")]
public partial class patient_by_coupon
{
    [Key]
    public int IDReception { get; set; }

    public int IDCoupon { get; set; }

    public int IDAnimalType { get; set; }

    public int IDPharmacyProduct { get; set; }

    public bool RegularInspection { get; set; }

    [StringLength(255)]
    public string Complaints { get; set; } = null!;

    [StringLength(500)]
    public string? Conclusions { get; set; }

    [StringLength(500)]
    public string Custody { get; set; } = null!;

    [ForeignKey("IDAnimalType")]
    [InverseProperty("patient_by_coupons")]
    public virtual animal_type IDAnimalTypeNavigation { get; set; } = null!;

    [ForeignKey("IDCoupon")]
    [InverseProperty("patient_by_coupons")]
    public virtual coupon IDCouponNavigation { get; set; } = null!;

    [ForeignKey("IDPharmacyProduct")]
    [InverseProperty("patient_by_coupons")]
    public virtual pharmacy_product IDPharmacyProductNavigation { get; set; } = null!;

    [InverseProperty("IDReceptionNavigation")]
    public virtual ICollection<payment> payments { get; set; } = new List<payment>();
}
