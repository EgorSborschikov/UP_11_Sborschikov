using VanessaApp.Entities;

namespace VanessaApp.ViewModels;

public class SaleProductViewModel 
{
    public int IdProduct { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
    public bool IsSelected { get; set; }
    public int Quantity { get; set; }
    
    public SaleProductViewModel(pharmacy_product product)
    {
        IdProduct = product.IDPharmacyProduct;
        Name = product.ProductName;
        Price = product.Price;
        IsSelected = false; // Default value
        Quantity = 1; //Default value
    }
}