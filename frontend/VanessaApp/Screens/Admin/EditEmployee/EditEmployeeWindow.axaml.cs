using System;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MsBox.Avalonia;
using VanessaApp.Entities;
using VanessaApp.ViewModels;

namespace VanessaApp.Screens.Admin.EditEmployee;

public partial class EditEmployeeWindow : Window
{
    public AdminWindowViewModel ViewModel { get; }

    
    public EditEmployeeWindow(AdminWindowViewModel? viewModel)
    {
        this.InitializeComponent();
        ViewModel = viewModel;
        DataContext = ViewModel;
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    private void SaveEditDataButton_Click(object sender, RoutedEventArgs e)
    {
        var surname = this.FindControl<TextBox>("SurnameTextBox")?.Text;
        var name = this.FindControl<TextBox>("NameTextBox")?.Text;
        var lastName = this.FindControl<TextBox>("LastNameTextBox")?.Text;
        var passportData = this.FindControl<TextBox>("PassportDataTextBox")?.Text;
        var phoneNumber = this.FindControl<TextBox>("PhoneNumberTextBox")?.Text;
        var email = this.FindControl<TextBox>("EmailTextBox")?.Text;
        var login = this.FindControl<TextBox>("LoginTextBox")?.Text;
        var password = this.FindControl<TextBox>("PasswordTextBox")?.Text;

        if (string.IsNullOrWhiteSpace(surname) ||
            string.IsNullOrWhiteSpace(name) ||
            string.IsNullOrWhiteSpace(lastName) ||
            string.IsNullOrWhiteSpace(passportData) ||
            string.IsNullOrWhiteSpace(phoneNumber) ||
            string.IsNullOrWhiteSpace(email) ||
            string.IsNullOrWhiteSpace(login) ||
            string.IsNullOrWhiteSpace(password))
        {
            MessageBoxManager.GetMessageBoxStandard("Ошибка", "Все поля должны быть заполнены.").ShowAsync();
            return;
        }

        ViewModel.UpdateEmployee(
            ViewModel.SelectedEmployeeId,
            surname,
            name,
            lastName,
            passportData,
            phoneNumber,
            email,
            ViewModel.SelectedBranch.IDBranch,
            ViewModel.SelectedPosition.IDPosition,
            login,
            password);

        this.Close();
    }

}