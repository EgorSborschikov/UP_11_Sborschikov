using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class payments_method
{
    [Key]
    public int IDPaymentMethod { get; set; }

    [StringLength(50)]
    public string Method { get; set; } = null!;

    [InverseProperty("IDPaymentMethodNavigation")]
    public virtual ICollection<online_order> online_orders { get; set; } = new List<online_order>();

    [InverseProperty("IDPaymentMethodNavigation")]
    public virtual ICollection<payment> payments { get; set; } = new List<payment>();
}
