using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using VanessaCorpApp.Data;
namespace VanessaCorpApp.Screens.Admin;

public partial class AdminWindow : Window
{
    private readonly ApplicationDbContext _context;

    public AdminWindow(ApplicationDbContext context)
    {
        this.InitializeComponent();
        _context = context;
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }
}