using System;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using MsBox.Avalonia;
using VanessaApp.Entities;
using VanessaApp.Screens.Admin.AddEmployee;
using VanessaApp.Screens.Admin.DeleteEmployee;
using VanessaApp.Screens.Admin.EditEmployee;
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

    private async void AddEmployeeButtonClick(object? sender, RoutedEventArgs e)
    {
        try
        {
            var _viewModel = new AdminWindowViewModel();
            
            var addEmployeeWindow = new AddEmployeeWindow(_viewModel);
            await addEmployeeWindow.ShowDialog(this);
        }
        catch (Exception ex)
        {
            //MessageBoxManager.GetMessageBoxStandard("Ошибка", "Выберите сотрудника для удаления.").ShowAsync();
        }
    }


    private async void EditEmployeeButtonClick(object? sender, RoutedEventArgs e)
    {
        try
        {
            var _viewModel = (AdminWindowViewModel)DataContext;
            var editEmployeeWindow = new EditEmployeeWindow(_viewModel);
            await editEmployeeWindow.ShowDialog(this);
        }
        catch (Exception ex)
        {
            //MessageBoxManager.GetMessageBoxStandard("Ошибка", "Выберите сотрудника для изменения данных.").ShowAsync();
        }
    }
    
    private async void DeleteEmployeeButtonClick(object? sender, RoutedEventArgs e)
    {
        try
        {
            var _viewModel = (AdminWindowViewModel)DataContext;
            var deleteEmployeeWindow = new DeleteEmployeeWindow(_viewModel);
            await deleteEmployeeWindow.ShowDialog(this);
        }
        catch (Exception ex)
        {
            //MessageBoxManager.GetMessageBoxStandard("Ошибка", "Выберите сотрудника для удаления.").ShowAsync();
        }
    }
}