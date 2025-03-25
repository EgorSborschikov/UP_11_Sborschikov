using System.Collections.ObjectModel;
using System.Linq;
using ReactiveUI;
using VanessaApp.Entities;

namespace VanessaApp.ViewModels
{
    public class AdminWindowViewModel : ReactiveObject
    {
        private readonly VanessaDbContext _context;

        public ObservableCollection<employee> Employees { get; set; }
        public ObservableCollection<position> Positions { get; set; }

        private employee _selectedEmployee;
        public employee SelectedEmployee
        {
            get => _selectedEmployee;
            set { this.RaiseAndSetIfChanged(ref _selectedEmployee, value); }
        }

        private string _surname;
        public string Surname
        {
            get => _surname;
            set { this.RaiseAndSetIfChanged(ref _surname, value); }
        }

        private string _name;
        public string Name
        {
            get => _name;
            set { this.RaiseAndSetIfChanged(ref _name, value); }
        }

        private string _lastName;
        public string LastName
        {
            get => _lastName;
            set { this.RaiseAndSetIfChanged(ref _lastName, value); }
        }

        private string _passportData;
        public string PassportData
        {
            get => _passportData;
            set { this.RaiseAndSetIfChanged(ref _passportData, value); }
        }

        private string _phoneNumber;
        public string PhoneNumber
        {
            get => _phoneNumber;
            set { this.RaiseAndSetIfChanged(ref _phoneNumber, value); }
        }

        private string _email;
        public string Email
        {
            get => _email;
            set { this.RaiseAndSetIfChanged(ref _email, value); }
        }

        private position _selectedPosition;
        public position SelectedPosition
        {
            get => _selectedPosition;
            set { this.RaiseAndSetIfChanged(ref _selectedPosition, value); }
        }

        private string _login;
        public string Login
        {
            get => _login;
            set { this.RaiseAndSetIfChanged(ref _login, value); }
        }

        private string _password;
        public string Password
        {
            get => _password;
            set { this.RaiseAndSetIfChanged(ref _password, value); }
        }

        private bool _isEmployeePanelVisible;
        public bool IsEmployeePanelVisible
        {
            get => _isEmployeePanelVisible;
            set { this.RaiseAndSetIfChanged(ref _isEmployeePanelVisible, value); }
        }

        public AdminWindowViewModel()
        {
            _context = new VanessaDbContext();
            LoadData();
        }

        private void LoadData()
        {
            Employees = new ObservableCollection<employee>(_context.employees.ToList());
            Positions = new ObservableCollection<position>(_context.positions.ToList());
        }

        public void SaveEmployee()
        {
            if (SelectedEmployee == null)
            {
                var newEmployee = new employee
                {
                    Surname = Surname,
                    Name = Name,
                    LastName = LastName,
                    PassportData = PassportData,
                    PhoneNumber = PhoneNumber,
                    Email = Email,
                    IDPosition = SelectedPosition?.IDPosition ?? 0,
                    IDAuthNavigation = new auth
                    {
                        Login = Login,
                        Password = Password
                    }
                };
                _context.employees.Add(newEmployee);
            }
            else
            {
                SelectedEmployee.Surname = Surname;
                SelectedEmployee.Name = Name;
                SelectedEmployee.LastName = LastName;
                SelectedEmployee.PassportData = PassportData;
                SelectedEmployee.PhoneNumber = PhoneNumber;
                SelectedEmployee.Email = Email;
                SelectedEmployee.IDPosition = SelectedPosition?.IDPosition ?? 0;
                SelectedEmployee.IDAuthNavigation.Login = Login;
                SelectedEmployee.IDAuthNavigation.Password = Password;

                _context.employees.Update(SelectedEmployee);
            }
            _context.SaveChanges();
            LoadData();
            IsEmployeePanelVisible = false; // Скрыть панель после сохранения
        }

        public void DeleteEmployee(employee employee)
        {
            _context.employees.Remove(employee);
            _context.SaveChanges();
            LoadData();
        }
    }
}
