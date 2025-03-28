using System;
using System.IO;
using System.Linq;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using VanessaApp.Entities;
using QuestPDF.Fluent;
using QuestPDF.Helpers;

namespace VanessaApp.Screens.SpecialistDoctor.AddRecept;

public partial class AddReceptWindow : Window
{
    private readonly VanessaDbContext _context;

    public AddReceptWindow()
    {
        InitializeComponent();
        _context = new VanessaDbContext();
        LoadData();
        QuestPDF.Settings.License = QuestPDF.Infrastructure.LicenseType.Community;
    }

    public void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    private void LoadData()
    {
        LoadCoupons();
        LoadAnimal();
        LoadPharmacyProduct();
        LoadPaymentMethod();
        LoadRegularInspection();
    }

    private void LoadCoupons()
    {
        var coupon = _context.coupons
            .Select(c => new
            {
                c.IDCoupon,
                c.IDClientsNavigation.Surname,
                c.IDClientsNavigation.Name,
                c.IDClientsNavigation.Lastname
            }).ToList();

        var patientComboBox = this.FindControl<ComboBox>("PatientComboBox");
        if (patientComboBox != null)
        {
            patientComboBox.ItemsSource = coupon;
        }
    }

    private void LoadAnimal()
    {
        var animal = _context.animal_types
            .Select(a => new
            {
                a.IDAnimalType,
                a.Type
            }).ToList();

        var animalComboBox = this.FindControl<ComboBox>("AnimalTypeComboBox");
        if (animalComboBox != null)
        {
            animalComboBox.ItemsSource = animal;
        }
    }

    private void LoadPharmacyProduct()
    {
        var product = _context.pharmacy_products
            .Select(p => new
            {
                p.IDPharmacyProduct,
                p.ProductName
            }).ToList();

        var productComboBox = this.FindControl<ComboBox>("PharmacyProductComboBox");
        if (productComboBox != null)
        {
            productComboBox.ItemsSource = product;
        }
    }

    private void LoadPaymentMethod()
    {
        var paymentMethod = _context.payments_methods
            .Select(pm => new
            {
                pm.IDPaymentMethod,
                pm.Method
            }).ToList();

        var paymentMethodComboBox = this.FindControl<ComboBox>("PaymentMethodComboBox");
        if (paymentMethodComboBox != null)
        {
            paymentMethodComboBox.ItemsSource = paymentMethod;
        }
    }

    private void LoadRegularInspection()
    {
        var regularInspectionComboBox = this.FindControl<ComboBox>("RegularInspectionComboBox");
        if (regularInspectionComboBox != null)
        {
            regularInspectionComboBox.ItemsSource = new[] { "Да", "Нет" };
        }
    }

    private void SaveReceptButton_Click(object? sender, RoutedEventArgs e)
    {
        // Debug message
        Console.WriteLine("SaveButton_Click called");

        string? complaints = this.FindControl<TextBox>("ComplaintTextBox")?.Text;
        string? conclusions = this.FindControl<TextBox>("ConclusionTextBox")?.Text;
        string? custody = this.FindControl<TextBox>("CustodyTextBox")?.Text;

        var patientComboBox = this.FindControl<ComboBox>("PatientComboBox");
        if (patientComboBox?.SelectedItem == null)
        {
            Console.WriteLine("No patient selected");
            return;
        }

        var animalComboBox = this.FindControl<ComboBox>("AnimalTypeComboBox");
        if (animalComboBox?.SelectedItem == null)
        {
            Console.WriteLine("No animal type selected");
            return;
        }

        var productComboBox = this.FindControl<ComboBox>("PharmacyProductComboBox");
        if (productComboBox?.SelectedItem == null)
        {
            Console.WriteLine("No main product selected");
            return;
        }

        var paymentMethodComboBox = this.FindControl<ComboBox>("PaymentMethodComboBox");
        if (paymentMethodComboBox?.SelectedItem == null)
        {
            Console.WriteLine("No payment method selected");
            return;
        }

        var regularInspectionComboBox = this.FindControl<ComboBox>("RegularInspectionComboBox");
        if (regularInspectionComboBox?.SelectedItem == null)
        {
            Console.WriteLine("No regular inspection selected");
            return;
        }

        var couponSelectedItem = (dynamic)patientComboBox.SelectedItem;
        int couponId = couponSelectedItem?.IDCoupon;

        var animalSelectedItem = (dynamic)animalComboBox.SelectedItem;
        int animalId = animalSelectedItem?.IDAnimalType;

        var productSelectedItem = (dynamic)productComboBox.SelectedItem;
        int productId = productSelectedItem?.IDPharmacyProduct;

        var paymentSelectedItem = (dynamic)paymentMethodComboBox.SelectedItem;
        int paymentId = paymentSelectedItem?.IDPaymentMethod;

        bool regularInspection = regularInspectionComboBox.SelectedItem.ToString() == "Да";

        var newRecept = new patient_by_coupon()
        {
            IDCoupon = couponId,
            IDAnimalType = animalId,
            IDPharmacyProduct = productId,
            RegularInspection = regularInspection,
            Complaints = complaints,
            Conclusions = conclusions,
            Custody = custody,
        };

        _context.patient_by_coupons.Add(newRecept);
        _context.SaveChanges();

        var newPayment = new payment()
        {
            IDReception = newRecept.IDReception,
            IDPaymentMethod = paymentId,
        };

        _context.payments.Add(newPayment);
        _context.SaveChanges();

        this.Close();
    }

    private void GenerateDocument_Click(object? sender, RoutedEventArgs e)
    {
        try
        {
            // Retrieve the values from TextBoxes and ComboBoxes
            string? complaints = this.FindControl<TextBox>("ComplaintTextBox")?.Text;
            string? conclusions = this.FindControl<TextBox>("ConclusionTextBox")?.Text;
            string? custody = this.FindControl<TextBox>("CustodyTextBox")?.Text;

            var patientComboBox = this.FindControl<ComboBox>("PatientComboBox");
            var animalComboBox = this.FindControl<ComboBox>("AnimalTypeComboBox");
            var productComboBox = this.FindControl<ComboBox>("PharmacyProductComboBox");
            var regularInspectionComboBox = this.FindControl<ComboBox>("RegularInspectionComboBox");

            // Check if any required fields are null or not selected
            if (string.IsNullOrWhiteSpace(complaints) || string.IsNullOrWhiteSpace(conclusions) ||
                string.IsNullOrWhiteSpace(custody) ||
                patientComboBox?.SelectedItem == null ||
                animalComboBox?.SelectedItem == null ||
                productComboBox?.SelectedItem == null ||
                regularInspectionComboBox?.SelectedItem == null)
            {
                Console.WriteLine("Please fill in all required fields and selections.");
                return;
            }

            // Get selected items from ComboBoxes
            dynamic animalSelectedItem = animalComboBox.SelectedItem;
            dynamic productSelectedItem = productComboBox.SelectedItem;

            // Determine if a regular inspection is selected
            bool regularInspection = regularInspectionComboBox.SelectedItem.ToString() == "Да";

            // File name for the PDF document
            string fileName = "VeterinaryReport.pdf";

            // Ensure the directory exists
            string directoryPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), "Downloads");
            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }

            string filePath = Path.Combine(directoryPath, fileName);

            // Generate the PDF document
            byte[] pdfBytes = Document
                .Create(document =>
                {
                    document.Page(page =>
                    {
                        page.Size(PageSizes.A4);
                        page.Margin(5);

                        page.Header()
                            .Text("Private Veterinary Clinic <<Vanessa>>")
                            .FontSize(20)
                            .Bold();
                        page.Content()
                            .PaddingVertical(5)
                            .Column(column =>
                            {
                                column.Item().Text($"Жалобы: {complaints}");
                                column.Item().Text($"Заключение: {conclusions}");
                                column.Item().Text($"Медицинские рекомендации: {custody}");
                                column.Item().Text($"Тип животного: {animalSelectedItem.Type}");
                                column.Item().Text($"Рекомендуемый препарат: {productSelectedItem.ProductName}");
                                column.Item().Text($"Регулярный осмотр: {(regularInspection ? "Да" : "Нет")}");
                            });
                        page.Footer()
                            .AlignRight()
                            .Text(text =>
                            {
                                text.Span("Дата: ____________");
                                text.Span("Подпись: ____________");
                                text.Span("ФИО врача: ____________");
                            });
                    });
                }).GeneratePdf();

            // Save the PDF bytes to a file
            File.WriteAllBytes(filePath, pdfBytes);

            Console.WriteLine($"Report generated successfully: {filePath}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error generating report: {ex.Message}");
        }
    }
}
