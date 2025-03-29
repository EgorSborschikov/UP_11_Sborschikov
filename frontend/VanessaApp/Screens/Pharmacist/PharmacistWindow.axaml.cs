using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using VanessaApp.Screens.Pharmacist.AddSale;
using VanessaApp.Screens.Pharmacist.ViewSaleReport;
using VanessaApp.ViewModels;

namespace VanessaApp.Screens.Pharmacist;

public partial class PharmacistWindow : Window
{
    public PharmacistWindow()
    {
        InitializeComponent();
        DataContext = new PharmacistViewModel();
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }
    
    private void AddSaleButton_Click(object? sender, RoutedEventArgs e)
    {
        // Add a new Sale
        var addSaleWindow = new AddSaleWindow();
        if (addSaleWindow != null)
        {
            addSaleWindow.Show();
        }
    }

    private void ViewSaleReportButton_Click(object? sender, RoutedEventArgs e)
    {
        // View sale history
        var viewSaleReportWindow = new ViewSaleReportWindow();
        if (viewSaleReportWindow != null)
        {
            viewSaleReportWindow.Show();
        }
    }
}