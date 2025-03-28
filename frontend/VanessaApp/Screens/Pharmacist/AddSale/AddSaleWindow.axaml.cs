using System.Collections.Generic;
using System.Linq;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using Microsoft.EntityFrameworkCore;
using MsBox.Avalonia;
using VanessaApp.Entities;
using VanessaApp.ViewModels;

namespace VanessaApp.Screens.Pharmacist.AddSale;

public partial class AddSaleWindow : Window
{
    private readonly VanessaDbContext _context;
    private List<client> clients;
    private List<SaleProductViewModel> products;
    public AddSaleWindow()
    {
        _context = new VanessaDbContext();
        InitializeComponent();
        LoadClients();
        LoadProducts();
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    private void LoadClients()
    {
        clients = _context.clients.ToList();
        ClientsComboBox.ItemsSource = clients;
    }

    private void LoadProducts()
    {
        var productsFromDb = _context.pharmacy_products
            .Include(pp => new
            {
                pp.IDPharmacyProduct,
                pp.ProductName,
                pp.Price
            }).ToList();

        products = productsFromDb.Select(p => new SaleProductViewModel(p)).ToList();
        ProductsDataGrid.ItemsSource = products;
    }

    // Confirm pay button
    private void PayButton_Click(object? sender, RoutedEventArgs e)
    {
        var selectedClient = ClientsComboBox.SelectedItem as client;
        if (selectedClient == null)
        {
            MessageBoxManager.GetMessageBoxStandard("Предупреждение!", "Выберите клиента").ShowAsync();
            return;
        }

        var selectedProducts = products.Where(p => p.IsSelected).ToList();
        if (!selectedProducts.Any())
        {
            MessageBoxManager.GetMessageBoxStandard("Предупреждение!", "Выберите хотя бы один продукт").ShowAsync();
            return;
        }

        foreach (var product in selectedProducts)
        {
            if (product.Quantity <= 0)
            {
                MessageBoxManager.GetMessageBoxStandard("Ошибка!", "Количество должно быть больше нуля.").ShowAsync();
                return;
            }
        }

        using (var transaction = _context.Database.BeginTransaction())
        {
            foreach (var product in selectedProducts)
            {
                var sale = new sale_of_pharmacy_product()
                {
                    IDClient = selectedClient.IDClient,
                    IDPharmacyProduct = product.IdProduct,
                    Quantity = product.Quantity 
                };
                _context.sale_of_pharmacy_products.Add(sale);
            }
            _context.SaveChanges();
            transaction.Commit();
        }

        MessageBoxManager.GetMessageBoxStandard("Успешно!", "Продажа успешно завершена").ShowAsync();
    }

}