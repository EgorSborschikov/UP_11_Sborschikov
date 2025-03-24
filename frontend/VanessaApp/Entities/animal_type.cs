using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

[Table("animal_type")]
public partial class animal_type
{
    [Key]
    public int IDAnimalType { get; set; }

    [StringLength(30)]
    public string Type { get; set; } = null!;

    [InverseProperty("IDAnimalTypeNavigation")]
    public virtual ICollection<patient_by_coupon> patient_by_coupons { get; set; } = new List<patient_by_coupon>();
}
