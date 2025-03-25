using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using MsBox.Avalonia;
using ReactiveUI;
using VanessaApp.Entities;

namespace VanessaApp.ViewModels;

/// <summary>
/// Admin-Panel view model
/// </summary>
public class AdminWindowViewModel : ReactiveObject
{
    private readonly VanessaDbContext _context;

    // Attribute for current employee
    private object _selectedEmployee;
    public object SelectedEmployee
    {
        get => _selectedEmployee;
        set => this.RaiseAndSetIfChanged(ref _selectedEmployee, value);
    }

    // Employees collection
    private ObservableCollection<object> _employees;
    public ObservableCollection<object> Employees
    {
        get => _employees;
        private set => this.RaiseAndSetIfChanged(ref _employees, value); // Сделаем сеттер приватным
    }
    
    public ObservableCollection<string> Branches { get; set; }
    public ObservableCollection<string> Positions { get; set; }


    public branch SelectedBranch { get; set; }
    public position SelectedPosition { get; set; }
        
    public AdminWindowViewModel()
    {
        _context = new VanessaDbContext();
        Employees = new ObservableCollection<object>();
        LoadEmployees();
        LoadBranches();
        LoadPositions();
    }

    // Get employees data from Database
    private IQueryable<object> GetEmployees()
    {
        
        return _context.employees
            .Include(e => e.IDBranchNavigation)
            .Include(e => e.IDPositionNavigation)
            .Include(e => e.IDAuthNavigation)
            .Select(e => new
            {
                e.IDEmployee,
                e.Surname,
                e.Name,
                e.LastName,
                e.PassportData,
                e.PhoneNumber,
                e.Email,
                e.IDBranchNavigation.BranchName,
                e.IDPositionNavigation.PositionName,
                AuthLogin = e.IDAuthNavigation.Login,
                AuthPassword = e.IDAuthNavigation.Password,
            });
    }

    // Load employees data
    private void LoadEmployees()
    {
        try
        {
            // Get data and upload collection
            var employeesQuery = GetEmployees().ToList();
            Employees.Clear(); // Clean collection before add new data
            foreach (var emp in employeesQuery)
            {
                Employees.Add(emp);
            }
            Console.WriteLine($"Loaded {Employees.Count} employees.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error loading employees: {ex.Message}");
        }
    }

    public void AddEmployee(
        string surname, 
        string name, 
        string lastName, 
        string passportData, 
        string phoneNumber, 
        string email, 
        int branchId, 
        int positionId, 
        string login, 
        string password)
    {
        try
        {
            using (var transaction = _context.Database.BeginTransaction())
            {
                var auth = new auth
                {
                    Login = login,
                    Password = password
                };
                _context.auths.Add(auth);
                _context.SaveChanges();

                var employee = new employee
                {
                    Surname = surname,
                    Name = name,
                    LastName = lastName,
                    PassportData = passportData,
                    PhoneNumber = phoneNumber,
                    Email = email,
                    IDBranch = branchId,
                    IDPosition = positionId,
                    IDAuth = auth.IDAuth
                };
                _context.employees.Add(employee);
                _context.SaveChanges();
                
                transaction.Commit();
                Console.WriteLine("Transaction committed.");
                
                LoadEmployees();
                Console.WriteLine("Success added new employee.");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error adding employee: {ex.Message}");
            MessageBoxManager.GetMessageBoxStandard("Ошибка", "Произошла ошибка при добавлении сотрудника. Попробуйте повторить позднее").ShowAsync();
        }
    }

    private void LoadBranches()
    {
        var branches = GetBranches().ToList();
        Branches = new ObservableCollection<string>(branches);
        Console.WriteLine($"Loaded {Branches.Count} branches");
    }

    private void LoadPositions()
    {
        var positions = GetPositions().ToList();
        Positions = new ObservableCollection<string>(positions);
        Console.WriteLine($"Loaded {Positions.Count} positions");
    }


    public IEnumerable<string> GetBranches()
    {
        return _context.branches.Select(b => b.BranchName).ToList();
    }

    public IEnumerable<string> GetPositions()
    {
        return _context.positions.Select(p => p.PositionName).ToList();
    }
}