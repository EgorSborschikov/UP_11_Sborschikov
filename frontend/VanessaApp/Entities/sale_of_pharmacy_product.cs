using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace VanessaApp.Entities;

public partial class sale_of_pharmacy_product
{
    [Key]
    public int IDSale { get; set; }

    public int IDEmployee { get; set; }

    public int IDClient { get; set; }

    public int IDPharmacyProduct { get; set; }

    [ForeignKey("IDClient")]
    [InverseProperty("sale_of_pharmacy_products")]
    public virtual client IDClientNavigation { get; set; } = null!;

    [ForeignKey("IDEmployee")]
    [InverseProperty("sale_of_pharmacy_products")]
    public virtual employee IDEmployeeNavigation { get; set; } = null!;

    [ForeignKey("IDPharmacyProduct")]
    [InverseProperty("sale_of_pharmacy_products")]
    public virtual pharmacy_product IDPharmacyProductNavigation { get; set; } = null!;
}
