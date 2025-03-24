using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class online_order
{
    [Key]
    public int IDOnlineOrder { get; set; }

    public int IDClient { get; set; }

    public int IDPharmacyProduct { get; set; }

    public int IDPickupPoint { get; set; }

    [ForeignKey("IDClient")]
    [InverseProperty("online_orders")]
    public virtual client IDClientNavigation { get; set; } = null!;

    [ForeignKey("IDPharmacyProduct")]
    [InverseProperty("online_orders")]
    public virtual pharmacy_product IDPharmacyProductNavigation { get; set; } = null!;

    [ForeignKey("IDPickupPoint")]
    [InverseProperty("online_orders")]
    public virtual pickup_point IDPickupPointNavigation { get; set; } = null!;
}
