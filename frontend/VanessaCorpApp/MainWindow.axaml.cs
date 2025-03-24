using System;
using System.Data.Entity;
using System.Linq;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using VanessaCorpApp.Data;
using MessageBox.Avalonia;
using MessageBox.Avalonia.DTO;
using MessageBox.Avalonia.Enums;
using EntityFrameworkQueryableExtensions = Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions;

namespace VanessaCorpApp;

public partial class MainWindow : Window
{
    private readonly ApplicationDbContext _context;
    public MainWindow(ApplicationDbContext context)
    {
        this.InitializeComponent();
        _context = context;
    }

    private void InitializeComponent(){
        AvaloniaXamlLoader.Load(this);
    }

    private async void OnLoginClicked(object sender, RoutedEventArgs e)
    {
        try
        {
            var login = LoginTextBox.Text;
            var password = PasswordBox.Text;

            var auth = EntityFrameworkQueryableExtensions.Include(_context.Auth
                    .Include(a => a.Employees), auth => auth.Employees)
                .FirstOrDefault(a => a.Login == login && a.Password == password);

            if (auth != null)
            {
                var employee = auth.Employees?.FirstOrDefault();
                if (employee != null)
                {
                    NavigateBasedOnRole(employee.IDPosition);
                }
                else
                {
                    // Обработка случая, когда у авторизованного пользователя нет сотрудников
                    var messageBoxResult = await MessageBoxManager.GetMessageBoxStandardWindow(
                        new MessageBoxStandardParams
                        {
                            ContentTitle = "Ошибка",
                            ContentMessage = "У данного пользователя нет связанных сотрудников.",
                            ButtonDefinitions = ButtonEnum.Ok,
                            WindowStartupLocation = WindowStartupLocation.CenterOwner
                        }).ShowDialog(this);
                }
            }
            else
            {
                // Обработка ошибки аутентификации
                var messageBoxResult = await MessageBoxManager.GetMessageBoxStandardWindow(
                    new MessageBoxStandardParams
                    {
                        ContentTitle = "Ошибка",
                        ContentMessage = "Неверные учетные данные.",
                        ButtonDefinitions = ButtonEnum.Ok,
                        WindowStartupLocation = WindowStartupLocation.CenterOwner
                    }).ShowDialog(this);
            }
        }
        catch (Exception ex)
        {
            // Обработка исключений
            var messageBoxResult = await MessageBoxManager.GetMessageBoxStandardWindow(
                new MessageBoxStandardParams
                {
                    ContentTitle = "Ошибка",
                    ContentMessage = $"Произошла ошибка: {ex.Message}",
                    ButtonDefinitions = ButtonEnum.Ok,
                    WindowStartupLocation = WindowStartupLocation.CenterOwner
                }).ShowDialog(this);
        }
    }

    private void NavigateBasedOnRole(int positionId)
    {
        // Навигация в зависимости от роли
        switch (positionId)
        {
            case 1: // Администратор
                // Переход на страницу администратора
                break;
            case 2: // Менеджер
                // Переход на страницу менеджера
                break;
            default:
                // Переход на общую страницу
                break;
        }
    }

}