using System;
using System.Collections.ObjectModel;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using ReactiveUI;
using VanessaApp.Entities;
using MsBox.Avalonia;
using VanessaApp.Screens.Admin;
using VanessaApp.Screens.DutyDoctor;
using VanessaApp.Screens.SpecialistDoctor;

namespace VanessaApp.ViewModels;

/// <summary>
/// Login Window (MainWindow) View Model
/// </summary>
public class MainWindowViewModel : ReactiveObject
{
    private readonly VanessaDbContext _context;

    public MainWindowViewModel()
    {
        _context = new VanessaDbContext();
    }

    public async void Login(string? login, string? password)
    {
        try
        {
            Console.WriteLine("Attempting to log in...");

            var auth = await _context.auths
                .Include(a => a.employees)
                .ThenInclude(e => e.IDPositionNavigation)
                .FirstOrDefaultAsync(a => a.Login == login && a.Password == password);

            if (auth != null)
            {
                Console.WriteLine("Auth found.");

                var employee = auth.employees.FirstOrDefault();
                if (employee != null)
                {
                    Console.WriteLine("Employee found.");

                    switch (employee.IDPosition)
                    {
                        case 1: // Фармацевт-консультант
                            Console.WriteLine("Pharmacist role selected.");
                            // Открыть окно фармацевта
                            break;
                        case 2: // Бухгалтер
                            Console.WriteLine("Accountant role selected.");
                            // Открыть окно бухгалтера
                            break;
                        case 3: // Врач-специалист
                            Console.WriteLine("Specialist doctor role selected.");
                            var specialistDoctorWindow = new SpecialistDoctorWindow();
                            if (specialistDoctorWindow != null)
                            {
                                specialistDoctorWindow.Show();
                            }
                            break;
                        case 4: // Дежурный врач приемного отделения
                            Console.WriteLine("Duty doctor role selected.");
                            // Открыть окно дежурного врача
                            var dutyDoctorWindow = new DutyDoctorWindow();
                            if (dutyDoctorWindow != null)
                            {
                                dutyDoctorWindow.Show();
                            }
                            else
                            {
                                Console.WriteLine("Failed to initialize DutyDoctorWindow.");
                            }
                            break;
                        case 5: // Администратор внутреннего учета
                            Console.WriteLine("Admin role selected.");
                            var adminWindow = new AdminWindow();
                            if (adminWindow != null)
                            {
                                adminWindow.Show();
                                //this.Hide();
                            }
                            else
                            {
                                Console.WriteLine("Failed to initialize AdminWindow.");
                            }
                            break;
                        default:
                            Console.WriteLine("Invalid position.");
                            await MessageBoxManager.GetMessageBoxStandard("Ошибка", "Должности не существует!").ShowAsync();
                            break;
                    }
                }
                else
                {
                    Console.WriteLine("Employee not found.");
                    await MessageBoxManager.GetMessageBoxStandard("Ошибка", "Сотрудник не найден!").ShowAsync();
                }
            }
            else
            {
                Console.WriteLine("Invalid login or password.");
                await MessageBoxManager.GetMessageBoxStandard("Ошибка", "Неверный логин или пароль!").ShowAsync();
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
            await MessageBoxManager.GetMessageBoxStandard("Ошибка", $"Ошибка: {ex.Message}").ShowAsync();
        }
    }
}