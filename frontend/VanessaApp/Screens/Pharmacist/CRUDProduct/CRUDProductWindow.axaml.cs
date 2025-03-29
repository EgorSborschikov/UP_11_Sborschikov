using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using VanessaApp.ViewModels.AdditionalPharmacistWindowViewModel;

namespace VanessaApp.Screens.Pharmacist.CRUDProduct;

public partial class CRUDProductWindow : Window
{
    public CRUDWithProductsViewModel ViewModel { get; }
    public CRUDProductWindow()
    {
        InitializeComponent();
        
        ViewModel = new CRUDWithProductsViewModel();
        DataContext = ViewModel;
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }
    
    // Save edit selected product
    private void SaveEditButton_Click(object? sender, RoutedEventArgs e)
    {
        ViewModel.SaveProductChanges();
    }

    // Add new product in database
    private void AddProductButton_Click(object? sender, RoutedEventArgs e)
    {
        ViewModel.AddProduct();
    }

    private void SaveDeleteButton_Click(object? sender, RoutedEventArgs e)
    {
        ViewModel.DeleteProduct();
    }
}
