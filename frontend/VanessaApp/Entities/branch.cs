using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class branch
{
    [Key]
    public int IDBranch { get; set; }

    public int IDCity { get; set; }

    [StringLength(50)]
    public string BranchName { get; set; } = null!;

    [StringLength(50)]
    public string Address { get; set; } = null!;

    [ForeignKey("IDCity")]
    [InverseProperty("branches")]
    public virtual city IDCityNavigation { get; set; } = null!;

    [InverseProperty("IDBranchNavigation")]
    public virtual ICollection<employee> employees { get; set; } = new List<employee>();
}
