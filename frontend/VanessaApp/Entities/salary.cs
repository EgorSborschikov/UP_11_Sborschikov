using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class salary
{
    [Key]
    public int IDSalaries { get; set; }

    public int IDPosition { get; set; }

    [Column(TypeName = "money")]
    public decimal Salary { get; set; }

    [ForeignKey("IDPosition")]
    [InverseProperty("salaries")]
    public virtual position IDPositionNavigation { get; set; } = null!;
}
