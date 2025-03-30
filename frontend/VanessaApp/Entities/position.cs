using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class position
{
    [Key]
    public int IDPosition { get; set; }

    [StringLength(50)]
    public string PositionName { get; set; } = null!;

    [InverseProperty("IDPositionNavigation")]
    public virtual ICollection<employee> employees { get; set; } = new List<employee>();

    [InverseProperty("IDPositionNavigation")]
    public virtual ICollection<salary> salaries { get; set; } = new List<salary>();
}
