using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using MsBox.Avalonia;
using VanessaApp.Entities;

namespace VanessaApp.ViewModels.AdditionalPharmacistWindowViewModel;

public class CRUDWithProductsViewModel : INotifyPropertyChanged
{
    private readonly VanessaDbContext _context;
    
    // Edit exist current product
    private ObservableCollection<int> _productIds;
    private int _selectedProductId;
    private string _editProductName;
    private decimal _editProductPrice;
    
    public ObservableCollection<int> ProductIds
    {
        get => _productIds;
        set
        {
            _productIds = value;
            OnPropertyChanged(nameof(ProductIds));
        }
    }

    public int SelectedProductId
    {
        get => _selectedProductId;
        set
        {
            _selectedProductId = value;
            OnPropertyChanged(nameof(SelectedProductId));
        }
    }

    public string EditProductName
    {
        get => _editProductName;
        set
        {
            _editProductName = value;
            OnPropertyChanged(nameof(EditProductName));
        }
    }

    public decimal EditProductPrice
    {
        get => _editProductPrice;
        set
        {
            _editProductPrice = value;
            OnPropertyChanged(nameof(EditProductPrice));
        }
    }
    
    // Add new product
    private int _newProductId;
    public int NewProductId
    {
        get => _newProductId;
        set
        {
            _newProductId = value;
            OnPropertyChanged(nameof(NewProductId));
        }
    }
    
    private string _newProductName = string.Empty;
    public string NewProductName
    {
        get => _newProductName;
        set
        {
            _newProductName = value;
            OnPropertyChanged(nameof(NewProductName));
        }
    }

    private decimal _newProductPrice = decimal.Zero;
    public decimal NewProductPrice
    {
        get => _newProductPrice;
        set
        {
            _newProductPrice = value;
            OnPropertyChanged(nameof(NewProductPrice));
        }
    }
    
    //Delete current product
    private ObservableCollection<int> _deleteProductIds;
    private int _selectedDelProductId;
    public ObservableCollection<int> DeleteProductIds
    {
        get => _deleteProductIds;
        set
        {
            _deleteProductIds = value;
            OnPropertyChanged(nameof(DeleteProductIds));
        }
    }

    public int SelectedDelProductId
    {
        get => _selectedDelProductId;
        set
        {
            _selectedDelProductId = value;
            OnPropertyChanged(nameof(SelectedDelProductId));
        }
    }

    public event PropertyChangedEventHandler? PropertyChanged;

    protected void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }

    public CRUDWithProductsViewModel()
    {
        _context = new VanessaDbContext();
        LoadProductIds();
        LoadDeleteProductIds();
    }

    private void LoadProductIds()
    {
        ProductIds = new ObservableCollection<int>(_context.pharmacy_products.Select(p => p.IDPharmacyProduct));
    }
    
    private void LoadDeleteProductIds()
    {
        DeleteProductIds = new ObservableCollection<int>(_context.pharmacy_products.Select(p => p.IDPharmacyProduct));
    }

    // Save edited data of product
    public void SaveProductChanges()
    {
        try
        {
            var productToEdit = _context.pharmacy_products.Find(SelectedProductId);
            if (productToEdit != null)
            {
                productToEdit.ProductName = EditProductName;
                productToEdit.Price = EditProductPrice;
                _context.SaveChanges();
                MessageBoxManager.GetMessageBoxStandard("Успех", "Данные отредактированные").ShowAsync();
                LoadProductIds(); 
            }
        }
        catch(Exception ex)
        {
            MessageBoxManager.GetMessageBoxStandard("Ошибка", ex.Message).ShowAsync();
        }
    }

    // Add new product in database
    public void AddProduct()
    {
        try
        {
            if (string.IsNullOrWhiteSpace(NewProductName))
                throw new Exception("Название товара не может быть пустым");

            if (NewProductName.Length > 100)
                throw new Exception("Название не может превышать 100 символов");

            if (NewProductPrice <= 0)
                throw new Exception("Некорректная цена. Пример: 150.50");

            var product = new pharmacy_product
            {
                IDPharmacyProduct = NewProductId,
                ProductName = NewProductName.Trim(),
                Price = NewProductPrice
            };

            _context.pharmacy_products.Add(product);
            _context.SaveChanges();

            NewProductId = 0;
            NewProductName = string.Empty;
            NewProductPrice = decimal.Zero;

            MessageBoxManager.GetMessageBoxStandard("Успех", "Товар успешно добавлен").ShowAsync();
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка при добавлении товара: {ex.Message}");
            if (ex.InnerException != null)
            {
                Console.WriteLine($"Внутреннее исключение: {ex.InnerException.Message}");
            }
            MessageBoxManager.GetMessageBoxStandard("Ошибка", ex.Message).ShowAsync();
        }
    }

    public void DeleteProduct()
    {
        try
        {
            var productToDelete = _context.pharmacy_products.Find(SelectedDelProductId);
            if (productToDelete != null)
            {
                _context.pharmacy_products.Remove(productToDelete);
                _context.SaveChanges();
                MessageBoxManager.GetMessageBoxStandard("Успех", "Данные удалены").ShowAsync();
                LoadDeleteProductIds(); 
            }
        }
        catch(Exception ex)
        {
            MessageBoxManager.GetMessageBoxStandard("Ошибка", ex.Message).ShowAsync();
        }
    }

}