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
    public AddSaleWindow()
    {
        
        InitializeComponent();
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    // Confirm pay button
    private void PayButton_Click(object? sender, RoutedEventArgs e)
    {
        
    }
}