using System;
using System.Collections.Generic;
using System.Linq;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using VanessaApp.ViewModels;

namespace VanessaApp.Screens.Pharmacist.AddSale;

/// <summary>
/// Logic of interaction with AddSaleWindow
/// </summary>

public partial class AddSaleWindow : Window
{
    private readonly AddSaleViewModel _viewModel;
    public AddSaleWindow()
    {
        InitializeComponent();
        _viewModel = new AddSaleViewModel();
        DataContext = _viewModel;
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    // Confirm pay button
    private void PayButton_Click(object? sender, RoutedEventArgs e)
    {
        Console.WriteLine("Pay button clicked.");
        _viewModel.Pay();
    }
}