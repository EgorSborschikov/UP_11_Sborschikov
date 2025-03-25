using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using VanessaApp.Entities;
using VanessaApp.Screens.Admin.AddEmployee;
using VanessaApp.ViewModels;

namespace VanessaApp.Screens.Admin;

/// <summary>
/// Logic of interaction with AdminWindow 
/// </summary>
public partial class AdminWindow : Window
{
    public AdminWindow()
    {
        InitializeComponent();
        DataContext = new AdminWindowViewModel();
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    private async void AddEmployeButtonClick(object? sender, RoutedEventArgs e)
    {
        // Получаем текущий ViewModel
        var _viewModel = (AdminWindowViewModel)DataContext;

        // Создаем и показываем окно добавления сотрудника
        var addEmployeeWindow = new AddEmployeeWindow(_viewModel);
        await addEmployeeWindow.ShowDialog(this);
        
        // После закрытия окна, если сотрудник был успешно добавлен, обновляем DataGrid
        // Обновление DataGrid происходит автоматически при вызове метода AddEmployee в AddEmployeeWindow
    }


    private void EditEmployeButtonClick(object? sender, RoutedEventArgs e)
    {
        // Edit current employee data
    }

    private void DeleteEmployeButtonClick(object? sender, RoutedEventArgs e)
    {
        // Delete current employee
    }
}