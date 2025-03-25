using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using VanessaApp.Entities;
using VanessaApp.ViewModels;

namespace VanessaApp.Screens.Admin
{
    public partial class AdminWindow : Window
    {
        private readonly AdminWindowViewModel _viewModel;

        public AdminWindow()
        {
            InitializeComponent();
            _viewModel = new AdminWindowViewModel();
            DataContext = _viewModel;
            EmployeesDataGrid.ItemsSource = _viewModel.Employees;
            PositionComboBox.ItemsSource = _viewModel.Positions;
        }

        private void InitializeComponent()
        {
            AvaloniaXamlLoader.Load(this);
        }

        private void OnAddButtonClicked(object sender, RoutedEventArgs e)
        {
            _viewModel.SelectedEmployee = null;
            _viewModel.IsEmployeePanelVisible = true;
        }

        private void OnEditButtonClicked(object sender, RoutedEventArgs e)
        {
            if (EmployeesDataGrid.SelectedItem is employee selectedEmployee)
            {
                _viewModel.SelectedEmployee = selectedEmployee;
                _viewModel.IsEmployeePanelVisible = true;
            }
        }

        private void OnDeleteButtonClicked(object sender, RoutedEventArgs e)
        {
            if (EmployeesDataGrid.SelectedItem is employee selectedEmployee)
            {
                _viewModel.DeleteEmployee(selectedEmployee);
            }
        }

        private void OnSaveButtonClicked(object sender, RoutedEventArgs e)
        {
            _viewModel.SaveEmployee();
        }

        private void OnCancelButtonClicked(object sender, RoutedEventArgs e)
        {
            _viewModel.IsEmployeePanelVisible = false;
        }
    }
}