using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using MsBox.Avalonia;
using VanessaApp.ViewModels;

namespace VanessaApp.Screens.Admin.DeleteEmployee;

/// <summary>
/// Logic of interaction with DeleteEmployeeWindow
/// </summary>

public partial class DeleteEmployeeWindow : Window
{
    public AdminWindowViewModel ViewModel { get; }

    public DeleteEmployeeWindow(AdminWindowViewModel? viewModel)
    {
        InitializeComponent();
        ViewModel = viewModel;
        DataContext = ViewModel;
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    private void DeleteButton_Click(object? sender, RoutedEventArgs e)
    {
        ViewModel.DeleteEmployee(ViewModel.SelectedEmployeeId);
        this.Close();
    }
}