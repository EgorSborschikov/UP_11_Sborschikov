using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class pharmacy_product
{
    [Key]
    public int IDPharmacyProduct { get; set; }

    [StringLength(100)]
    public string ProductName { get; set; } = null!;

    [Column(TypeName = "money")]
    public decimal Price { get; set; }

    [InverseProperty("IDPharmacyProductNavigation")]
    public virtual ICollection<online_order> online_orders { get; set; } = new List<online_order>();

    [InverseProperty("IDPharmacyProductNavigation")]
    public virtual ICollection<patient_by_coupon> patient_by_coupons { get; set; } = new List<patient_by_coupon>();

    [InverseProperty("IDPharmacyProductNavigation")]
    public virtual ICollection<sale_of_pharmacy_product> sale_of_pharmacy_products { get; set; } = new List<sale_of_pharmacy_product>();
}
