using System;
using System.Linq;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using Microsoft.EntityFrameworkCore;
using VanessaApp.Entities;

namespace VanessaApp.Screens.DutyDoctor.AddCoupon;

public partial class AddCouponWindow : Window
{
    private VanessaDbContext _context;

    public AddCouponWindow()
    {
        InitializeComponent();
        _context = new VanessaDbContext();
        LoadEmployees();
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    private void LoadEmployees()
    {
        var employees = _context.employees
            .Where(e => e.IDPosition == 3)
            .Select(e => new
            {
                e.IDEmployee, 
                FullName = $"{e.Surname} {e.Name} {e.LastName}"
            }).ToList();

        var comboBox = this.FindControl<ComboBox>("SpecialistComboBox");
        if (comboBox != null)
        {
            comboBox.ItemsSource = employees;
        }
    }

    private void SaveButton_Click(object sender, RoutedEventArgs e)
    {
        // Debug message
        Console.WriteLine("SaveButton_Click called");

        string? surname = this.FindControl<TextBox>("SurnameTextBox")?.Text;
        string? name = this.FindControl<TextBox>("NameTextBox")?.Text;
        string? lastName = this.FindControl<TextBox>("PatronymicTextBox")?.Text;
        string? email = this.FindControl<TextBox>("EmailTextBox")?.Text;

        var comboBox = this.FindControl<ComboBox>("SpecialistComboBox");
        if (comboBox?.SelectedItem == null)
        {
            // Обработка случая, когда специалист не выбран
            Console.WriteLine("No specialist selected");
            return;
        }

        var selectedItem = (dynamic)comboBox.SelectedItem;
        int employeeId = selectedItem.IDEmployee;

        var newClient = new client
        {
            Surname = surname,
            Name = name,
            Lastname = lastName,
            Email = email,
        };
        _context.clients.Add(newClient);
        _context.SaveChanges();

        var newCoupon = new coupon
        {
            IDClients = newClient.IDClient,
            IDEmployee = employeeId,
        };
        _context.coupons.Add(newCoupon);
        _context.SaveChanges();

        this.Close();
    }


}