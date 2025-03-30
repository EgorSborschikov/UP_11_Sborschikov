using System.Collections.ObjectModel;
using System.Linq;
using VanessaApp.Entities;

namespace VanessaApp.ViewModels;

/// <summary>
/// Pharmacist-Main-Panel view model
/// </summary>

public class PharmacistViewModel
{
    private VanessaDbContext _context;
    public ObservableCollection<ProductViewModel> Products { get; set; }

    public PharmacistViewModel()
    {
        _context = new VanessaDbContext();
        Products = new ObservableCollection<ProductViewModel>();
        LoadProducts();
    }

    private void LoadProducts()
    {
        var products = _context.pharmacy_products
            .Select(p => new ProductViewModel
            {
                ID = p.IDPharmacyProduct,
                Name = p.ProductName,
                Price = p.Price,
            }).ToList();
        Products.Clear();
        foreach (var product in products)
        {
            Products.Add(product);
        }
    }
}

public class ProductViewModel
{
    public int ID { get; set; }
    public string? Name { get; set; }
    public decimal Price { get; set; }
}