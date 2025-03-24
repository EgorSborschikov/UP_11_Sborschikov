using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class payment
{
    [Key]
    public int IDPayment { get; set; }

    public int IDReception { get; set; }

    public int IDPaymentMethod { get; set; }

    [Column(TypeName = "money")]
    public decimal Price { get; set; }

    [ForeignKey("IDPaymentMethod")]
    [InverseProperty("payments")]
    public virtual payments_method IDPaymentMethodNavigation { get; set; } = null!;

    [ForeignKey("IDReception")]
    [InverseProperty("payments")]
    public virtual patient_by_coupon IDReceptionNavigation { get; set; } = null!;
}
