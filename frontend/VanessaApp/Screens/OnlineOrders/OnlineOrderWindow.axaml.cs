using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using VanessaApp.Entities;
using VanessaApp.ViewModels;

namespace VanessaApp.Screens.OnlineOrders;

public partial class OnlineOrderWindow : Window
{
    private OnlineOrderViewModel _viewModel;
    public OnlineOrderWindow()
    {
        InitializeComponent();
        _viewModel = new OnlineOrderViewModel();
        DataContext = _viewModel;
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    private void SaveOrderButton_Click(object? sender, RoutedEventArgs e)
    {
        // Execute online order
        _viewModel.CreateNewClient();
        _viewModel.SaveOrder();
    }
}