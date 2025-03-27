using System;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using VanessaApp.Screens.DutyDoctor.AddCoupon;
using VanessaApp.ViewModels;

namespace VanessaApp.Screens.DutyDoctor;

public partial class DutyDoctorWindow : Window
{
    public DutyDoctorWindow()
    {
        InitializeComponent();
        DataContext = new DutyDoctorViewModel();
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    private void AddCouponButtonClick(object? sender, RoutedEventArgs e)
    {
        var addCouponWindow = new AddCouponWindow();
        addCouponWindow.Show();
    }

    private void DeleteAllCouponButtonClick(object? sender, RoutedEventArgs e)
    {
        var dataGrid = this.FindControl<DataGrid>("CouponsDataGrid");

        if (dataGrid != null)
        {
            dataGrid.ItemsSource = null;
            Console.WriteLine("Successfully deleted all coupons");
        }
        else
        {
            // Обработка случая, когда DataGrid не найден
            Console.WriteLine("DataGrid not found");
        }
    }
}