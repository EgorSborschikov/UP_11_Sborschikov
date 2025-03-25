using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using MsBox.Avalonia;
using VanessaApp.ViewModels;

namespace VanessaApp.Screens.Admin.AddEmployee;

public partial class AddEmployeeWindow : Window
{
    public AdminWindowViewModel ViewModel { get; }
    public AddEmployeeWindow(AdminWindowViewModel? viewModel)
    {
        this.InitializeComponent();
        ViewModel = new AdminWindowViewModel();
        DataContext = ViewModel;
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    private void SaveButton_Click(object? sender, RoutedEventArgs e)
    {
        //Logic of Save new employee data
        
        //Get data from form
        var surname = this.FindControl<TextBox>("SurnameTextBox")?.Text;
        var name = this.FindControl<TextBox>("NameTextBox")?.Text;
        var lastName = this.FindControl<TextBox>("LastNameTextBox")?.Text;
        var passportData = this.FindControl<TextBox>("PassportDataTextBox")?.Text;
        var phoneNumber = this.FindControl<TextBox>("PhoneNumberTextBox")?.Text;
        var email = this.FindControl<TextBox>("EmailTextBox")?.Text;
        var login = this.FindControl<TextBox>("LoginTextBox")?.Text;
        var password = this.FindControl<TextBox>("PasswordTextBox")?.Text;

        // Check in attribute is not null
        if (string.IsNullOrWhiteSpace(surname) ||
            string.IsNullOrWhiteSpace(name) ||
            string.IsNullOrWhiteSpace(lastName) ||
            string.IsNullOrWhiteSpace(passportData) ||
            string.IsNullOrWhiteSpace(phoneNumber) ||
            string.IsNullOrWhiteSpace(email) ||
            string.IsNullOrWhiteSpace(login) ||
            string.IsNullOrWhiteSpace(password))
        {
            // If attribute is null...
            MessageBoxManager.GetMessageBoxStandard("Ошибка", "Все поля должны быть заполнены.").ShowAsync();
            return;
        }

        // Data broadcast in ViewModel
        ViewModel.AddEmployee(
            surname,
            name,
            lastName,
            passportData,
            phoneNumber,
            email,
            ViewModel.SelectedBranch.IDBranch,
            ViewModel.SelectedPosition.IDPosition,
            login,
            password
        );

        // Close window after savind
        this.Close();
    }
}