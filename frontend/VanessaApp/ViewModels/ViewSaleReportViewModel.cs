using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using MsBox.Avalonia;
using VanessaApp.Entities;

namespace VanessaApp.ViewModels;

/// <summary>
/// View model for add sale function
/// </summary>

public class ViewSaleReportViewModel : INotifyPropertyChanged
{
    private readonly VanessaDbContext _context;
    private decimal _totalRevenue;
    public ObservableCollection<SaleReportViewModel> SaleReports { get; set; }
    
    public decimal TotalRevenue
    {
        get => _totalRevenue;
        set
        {
            _totalRevenue = value;
            OnPropertyChanged(nameof(TotalRevenue));
        }
    }
    
    public event PropertyChangedEventHandler PropertyChanged;

    protected virtual void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }

    public ViewSaleReportViewModel()
    {
        _context = new VanessaDbContext();
        SaleReports = new ObservableCollection<SaleReportViewModel>();
        LoadData();
    }

    private void LoadData()
    {
        try
        {
            var sales = _context.sale_of_pharmacy_products
                .Select(sr => new SaleReportViewModel
                {
                    SaleId = sr.IDSale,
                    ClientSurname = sr.IDClientNavigation.Surname,
                    ClientName = sr.IDClientNavigation.Name,
                    ClientLastname = sr.IDClientNavigation.Lastname,
                    SaledProduct = sr.IDPharmacyProductNavigation.ProductName,
                    SaledProductPrice = sr.IDPharmacyProductNavigation.Price,
                    ProductQuantity = sr.Quantity
                }).ToList();

            SaleReports.Clear();
            foreach (var sale in sales)
            {
                SaleReports.Add(sale);
                Console.WriteLine($"Successfully load  {sales.Count} report data");
            }

            try
            {
                TotalRevenue = sales
                    .Where(sl => sl.ProductQuantity >= 0 && sl.SaledProductPrice >= 0)
                    .Sum(sl => sl.ProductQuantity * sl.SaledProductPrice);
            }
            catch (Exception ex)
            {
                MessageBoxManager.GetMessageBoxStandard("Ошибка", "Некорректные данные для расчета итогого дохода").ShowAsync();
                Console.WriteLine($"Error: {TotalRevenue} is null");
            }
        }
        catch (Exception ex)
        {
            MessageBoxManager.GetMessageBoxStandard("Ошибка", "Произошла ошибка загрузки ведомости").ShowAsync();
            Console.WriteLine(ex.Message);
        }
    }
}

/// <summary>
/// Additional interface
/// </summary>
public class SaleReportViewModel
{
    public int SaleId { get; set; }
    public string? ClientSurname { get; set; }
    public string? ClientName { get; set; }
    public string? ClientLastname { get; set; }
    public string? SaledProduct { get; set; }
    public decimal SaledProductPrice { get; set; }
    public int ProductQuantity { get; set; }
}