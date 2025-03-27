using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class client
{
    [Key]
    public int IDClient { get; set; }

    [StringLength(30)]
    public string Surname { get; set; } = null!;

    [StringLength(35)]
    public string Name { get; set; } = null!;

    [StringLength(40)]
    public string Lastname { get; set; } = null!;

    [StringLength(100)]
    public string Email { get; set; } = null!;

    [InverseProperty("IDClientsNavigation")]
    public virtual ICollection<coupon> coupons { get; set; } = new List<coupon>();

    [InverseProperty("IDClientNavigation")]
    public virtual ICollection<online_order> online_orders { get; set; } = new List<online_order>();

    [InverseProperty("IDClientNavigation")]
    public virtual ICollection<sale_of_pharmacy_product> sale_of_pharmacy_products { get; set; } = new List<sale_of_pharmacy_product>();
}
