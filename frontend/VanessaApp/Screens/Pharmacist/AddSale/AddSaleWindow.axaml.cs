using System.Collections.ObjectModel;
using System.Linq;
using Avalonia.Controls;
using Avalonia.Controls.Templates;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
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

   
    
    private void PayButton_Click(object? sender, RoutedEventArgs e)
    {
        
    }
}
