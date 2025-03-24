using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class coupon
{
    [Key]
    public int IDCoupon { get; set; }

    public int IDClients { get; set; }

    public int IDEmployee { get; set; }

    [ForeignKey("IDClients")]
    [InverseProperty("coupons")]
    public virtual client IDClientsNavigation { get; set; } = null!;

    [ForeignKey("IDEmployee")]
    [InverseProperty("coupons")]
    public virtual employee IDEmployeeNavigation { get; set; } = null!;

    [InverseProperty("IDCouponNavigation")]
    public virtual ICollection<patient_by_coupon> patient_by_coupons { get; set; } = new List<patient_by_coupon>();
}
