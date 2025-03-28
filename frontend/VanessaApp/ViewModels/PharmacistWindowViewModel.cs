using System.Collections.ObjectModel;
using System.Linq;
using VanessaApp.Entities;

namespace VanessaApp.ViewModels;

public class PharmacistWindowViewModel 
{
    private readonly VanessaDbContext _context;
    public ObservableCollection<PharmacyProductsViewModel> PharmacyProducts { get; set; }
    
    public PharmacistWindowViewModel()
    {
        _context = new VanessaDbContext();
        PharmacyProducts = new ObservableCollection<PharmacyProductsViewModel>();
        LoadProducts();
    }
    
    private void LoadProducts()
    {
        var products = _context.pharmacy_products
            .Select(pp => new PharmacyProductsViewModel
            {
                ProductId = pp.IDPharmacyProduct,
                ProductName = pp.ProductName,
                ProductPrice = pp.Price,

            }).ToList();
        PharmacyProducts.Clear();
        foreach (var product in products)
        {
            PharmacyProducts.Add(product);
        }
    }
}

public class PharmacyProductsViewModel
{
    public int ProductId { get; set; }
    public string? ProductName { get; set; }
    public decimal ProductPrice { get; set; }
}