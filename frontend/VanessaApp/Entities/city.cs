using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class city
{
    [Key]
    public int IDCity { get; set; }

    [StringLength(50)]
    public string Name { get; set; } = null!;

    [InverseProperty("IDCityNavigation")]
    public virtual ICollection<branch> branches { get; set; } = new List<branch>();

    [InverseProperty("IDCityNavigation")]
    public virtual ICollection<pickup_point> pickup_points { get; set; } = new List<pickup_point>();
}
