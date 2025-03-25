using System;
using System.Collections.ObjectModel;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using ReactiveUI;
using VanessaApp.Entities;

namespace VanessaApp.ViewModels
{
    public class AdminWindowViewModel : ReactiveObject
    {
        private readonly VanessaDbContext _context;

        // Поле для выбранного сотрудника
        private employee _selectedEmployee;
        public employee SelectedEmployee
        {
            get => _selectedEmployee;
            set => this.RaiseAndSetIfChanged(ref _selectedEmployee, value);
        }

        // Коллекция сотрудников
        private ObservableCollection<employee> _employees;
        public ObservableCollection<employee> Employees
        {
            get => _employees;
            private set => this.RaiseAndSetIfChanged(ref _employees, value); // Сделаем сеттер приватным
        }

        // Конструктор
        public AdminWindowViewModel()
        {
            _context = new VanessaDbContext();
            Employees = new ObservableCollection<employee>();
            LoadEmployees();
        }

        // Метод для получения сотрудников из базы данных
        private IQueryable<employee> GetEmployees()
        {
            return _context.employees
                .Include(e => e.IDBranchNavigation)
                .Include(e => e.IDPositionNavigation)
                .Include(e => e.IDAuthNavigation);
        }

        // Метод для загрузки сотрудников
        private void LoadEmployees()
        {
            try
            {
                // Получаем сотрудников и заполняем коллекцию
                var employeesQuery = GetEmployees().ToList();
                Employees.Clear(); // Очищаем коллекцию перед добавлением новых данных
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
    }
}