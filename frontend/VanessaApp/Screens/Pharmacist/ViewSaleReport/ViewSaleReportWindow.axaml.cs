using Avalonia.Controls;
using Avalonia.Markup.Xaml;

namespace VanessaApp.Screens.Pharmacist.ViewSaleReport;

public partial class ViewSaleReportWindow : Window
{
    public ViewSaleReportWindow()
    {
        InitializeComponent();
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }
}