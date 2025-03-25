using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using MsBox.Avalonia;
using VanessaApp.Entities;
using VanessaApp.ViewModels;

namespace VanessaApp;

/// <summary>
/// Logic of interaction with LoginWindow(MainWindow)
/// </summary>
public partial class MainWindow : Window
{
    private readonly MainWindowViewModel _viewModel;
    public MainWindow()
    {
        _viewModel = new MainWindowViewModel();
        InitializeComponent();
        DataContext = _viewModel;
    }
    
    private void OnLoginClick(object sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (LoginBox != null && PasswordBox != null)
        {
            string? login = LoginBox.Text;
            string? password = PasswordBox.Text;
            _viewModel.Login(login, password);
        }
        else
        {
            MessageBoxManager.GetMessageBoxStandard("Ошибка", "Элементы интерфейса проинциализировались с ошибкой!").ShowAsync();
        }
    }
}