using System;
using System.Collections.ObjectModel;
using System.Linq;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using Microsoft.EntityFrameworkCore;
using VanessaApp.Entities;
using VanessaApp.Screens.SpecialistDoctor.AddRecept;
using VanessaApp.ViewModels;

namespace VanessaApp.Screens.SpecialistDoctor;

/// <summary>
/// Logic of interaction with SpecialistDoctorWindow
/// </summary>

public partial class SpecialistDoctorWindow : Window
{
    public SpecialistDoctorWindow()
    {
        InitializeComponent();
        DataContext = new SpecialistDoctorViewModel();
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    private void AddReceptButton_Click(object? sender, RoutedEventArgs e)
    {
        // Open window for create recept
        var addReceptWindow = new AddReceptWindow();
        addReceptWindow.Show();
    }

    private void DeleteDataButton_Click(object? sender, RoutedEventArgs e)
    {
        // DataGrid clear
        var dataGrid = this.FindControl<DataGrid>("PatienByCouponDataGrid");

        if (dataGrid != null)
        {
            dataGrid.ItemsSource = null;
            Console.WriteLine("Successfully deleted all coupons");
        }
        else
        {
            // If DataGrid not found
            Console.WriteLine("DataGrid not found");
        }
    }
}