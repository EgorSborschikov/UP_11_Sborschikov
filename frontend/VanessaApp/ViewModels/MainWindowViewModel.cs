using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using ReactiveUI;
using VanessaApp.Entities;
using MsBox.Avalonia;
using VanessaApp.Screens.Admin;
using VanessaApp.Screens.DutyDoctor;
using VanessaApp.Screens.Pharmacist;
using VanessaApp.Screens.SpecialistDoctor;

namespace VanessaApp.ViewModels;

/// <summary>
/// Login Window (MainWindow) View Model
/// </summary>
public class MainWindowViewModel : ReactiveObject
{
    // Database context instance
    private readonly VanessaDbContext _context;

    public MainWindowViewModel()
    {
        _context = new VanessaDbContext();
    }

    // Employees authorization
    public async void Login(string? login, string? password)
    {
        try
        {
            Console.WriteLine("Attempting to log in...");

            // Get auth employee data
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

                    // Roles (Positions) authentication
                    switch (employee.IDPosition)
                    {
                        case 1: // Pharmacist Window
                            Console.WriteLine("Pharmacist role selected.");
                            var pharmaticsWindow = new PharmacistWindow();
                            if (pharmaticsWindow != null)
                            {
                                pharmaticsWindow.Show();
                            }
                            break;
                        case 2: // Accountant Window
                            Console.WriteLine("Accountant role selected.");
                            // Открыть окно бухгалтера
                            break;
                        case 3: // Specialist Doctor Window
                            Console.WriteLine("Specialist doctor role selected.");
                            var specialistDoctorWindow = new SpecialistDoctorWindow();
                            if (specialistDoctorWindow != null)
                            {
                                specialistDoctorWindow.Show();
                            }
                            break;
                        case 4: // Duty Doctor Window
                            Console.WriteLine("Duty doctor role selected.");
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
                        case 5: // Admin Window
                            Console.WriteLine("Admin role selected.");
                            var adminWindow = new AdminWindow();
                            if (adminWindow != null)
                            {
                                adminWindow.Show();
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