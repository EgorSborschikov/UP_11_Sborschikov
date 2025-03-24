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

    public int IDEmployee { get; set; }

    [Column(TypeName = "money")]
    public decimal Salaries { get; set; }

    [ForeignKey("IDEmployee")]
    [InverseProperty("salaries")]
    public virtual employee IDEmployeeNavigation { get; set; } = null!;
}
