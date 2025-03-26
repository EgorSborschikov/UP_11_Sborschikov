using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

[Table("auth")]
public partial class auth
{
    [Key]
    public int IDAuth { get; set; }

    [StringLength(100)]
    public string? Login { get; set; } = null!;

    [StringLength(100)]
    public string? Password { get; set; } = null!;

    [InverseProperty("IDAuthNavigation")]
    public virtual ICollection<employee> employees { get; set; } = new List<employee>();
}
