using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class pickup_point
{
    [Key]
    public int IDPickupPoints { get; set; }

    public int IDCity { get; set; }

    [ForeignKey("IDCity")]
    [InverseProperty("pickup_points")]
    public virtual city IDCityNavigation { get; set; } = null!;

    [InverseProperty("IDPickupPointNavigation")]
    public virtual ICollection<online_order> online_orders { get; set; } = new List<online_order>();
}
