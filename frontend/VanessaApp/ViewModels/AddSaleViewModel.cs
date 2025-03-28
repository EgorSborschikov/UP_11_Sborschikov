using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using VanessaApp.Entities;

namespace VanessaApp.ViewModels;

/// <summary>
/// View model for add sale function
/// </summary>

public class AddSaleViewModel
{
    private VanessaDbContext _context;
    private ClientViewModel _selectedClient;
    public ObservableCollection<SaleItemViewModel> ItemProducts { get; set; }
    public ObservableCollection<ClientViewModel> Clients { get; set; }

    public ClientViewModel SelectedClient
    {
        get => _selectedClient;
        set
        {
            _selectedClient = value;
            OnPropertyChanged(nameof(SelectedClient));
        }
    }
    
    public event PropertyChangedEventHandler PropertyChanged;
    protected void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }

    public AddSaleViewModel()
    {
        _context = new VanessaDbContext();
        ItemProducts = new ObservableCollection<SaleItemViewModel>();
        Clients = new ObservableCollection<ClientViewModel>();
        LoadItems();
        LoadClients();
    }

    private void LoadItems()
    {
        var items = _context.pharmacy_products.ToList();
        var saleItems = items
            .Select(it => new SaleItemViewModel
            {
                ItemId = it.IDPharmacyProduct,
                ItemName = it.ProductName,
                ItemPrice = it.Price,
                IsSelected = false, // Default value
                Quantity = 0, // Default value
            }).ToList();
        ItemProducts.Clear();
        foreach (var saleItem in saleItems)
        {
            ItemProducts.Add(saleItem);
        }
    }

    private void LoadClients()
    {
        var clients = _context.clients
            .Select(c => new ClientViewModel
            {
                ClientId = c.IDClient,
                DisplayName = $"{c.Surname} {c.Name} {c.Lastname}"
            }).ToList();
        Clients.Clear();
        foreach (var client in clients)
        {
            Clients.Add(client);
            Console.WriteLine($"Loaded client: {client.DisplayName}, ID: {client.ClientId}");
        }
    }

    public void Pay()
    {
        Console.WriteLine("Pay method called.");
        if (SelectedClient != null)
        {
            Console.WriteLine($"Selected client: {SelectedClient.DisplayName}, ID: {SelectedClient.ClientId}");
            SaveSale(SelectedClient.ClientId);
        }
        else
        {
            Console.WriteLine("No client selected.");
        }
    }

    private void SaveSale(int clientId)
    {
        try
        {
            foreach (var item in ItemProducts)
            {
                if (item.IsSelected && item.Quantity > 0)
                {
                    Console.WriteLine($"Saving sale: ClientId={clientId}, ProductId={item.ItemId}, Quantity={item.Quantity}");
                    var sale = new sale_of_pharmacy_product
                    {
                        IDClient = clientId,
                        IDPharmacyProduct = item.ItemId,
                        Quantity = item.Quantity
                    };
                    _context.sale_of_pharmacy_products.Add(sale);
                }
            }
            _context.SaveChanges();
            Console.WriteLine("Sales saved successfully.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error saving sales: {ex.Message}");
        }
    }

}

/// <summary>
/// Additional interfaces
/// </summary>
public class SaleItemViewModel : INotifyPropertyChanged
{
    private bool _isSelected;
    private int _quantity;
    
    public int ItemId { get; set; }
    public string? ItemName { get; set; }
    public decimal ItemPrice { get; set; }

    public bool IsSelected
    {
        get => _isSelected;
        set
        {
            _isSelected = value;
            OnPropertyChanged(nameof(IsSelected));
        }
    }

    public int Quantity
    {
        get => _quantity;
        set
        {
            _quantity = value;
            OnPropertyChanged(nameof(Quantity));
        }
    }
    
    public event PropertyChangedEventHandler? PropertyChanged;
    protected void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}

public class ClientViewModel
{
    public int ClientId { get; set; }
    public string DisplayName { get; set; }
}