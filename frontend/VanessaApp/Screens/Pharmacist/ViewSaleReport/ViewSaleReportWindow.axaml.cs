using System;
using System.IO;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using VanessaApp.ViewModels;
using System.Linq;
using MsBox.Avalonia;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using Path = System.IO.Path;

namespace VanessaApp.Screens.Pharmacist.ViewSaleReport;

/// <summary>
/// Logic of interaction with ViewSaleReportWindow
/// </summary>

public partial class ViewSaleReportWindow : Window
{
    private readonly ViewSaleReportViewModel _viewModel;
    public ViewSaleReportWindow()
    {
        InitializeComponent();
        _viewModel = new ViewSaleReportViewModel();
        DataContext = _viewModel;
        
        QuestPDF.Settings.License = QuestPDF.Infrastructure.LicenseType.Community;
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }

    private void CreateDocument_Click(object? sender, RoutedEventArgs e)
    {
        //Logic of create PDF-document
        try
        {
            string? fileName = "SalesReport.pdf";
            string directoryPath =
                Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), "Downloads");

            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }

            string filePath = Path.Combine(directoryPath, fileName);

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
                            .Table(table =>
                            {
                                table.ColumnsDefinition(columns =>
                                {
                                    columns.RelativeColumn();
                                    columns.RelativeColumn();
                                    columns.RelativeColumn();
                                    columns.RelativeColumn();
                                    columns.RelativeColumn();
                                    columns.RelativeColumn();
                                    columns.RelativeColumn();
                                });
                                table.Header(header =>
                                {
                                    header.Cell().Text("№").FontSize(12).FontColor(Colors.Black);
                                    header.Cell().Text("Фамилия").FontSize(12).FontColor(Colors.Black);
                                    header.Cell().Text("Имя").FontSize(12).FontColor(Colors.Black);
                                    header.Cell().Text("Отчество").FontSize(12).FontColor(Colors.Black);
                                    header.Cell().Text("Товар").FontSize(12).FontColor(Colors.Black);
                                    header.Cell().Text("Цена за единицу товара").FontSize(12).FontColor(Colors.Black);
                                    header.Cell().Text("Количество").FontSize(12).FontColor(Colors.Black);
                                });

                                foreach (var report in _viewModel.SaleReports)
                                {
                                    table.Cell().Text(report.SaleId.ToString()).FontSize(10);
                                    table.Cell().Text(report.ClientSurname ?? string.Empty).FontSize(10);
                                    table.Cell().Text(report.ClientName ?? string.Empty).FontSize(10);
                                    table.Cell().Text(report.ClientLastname ?? string.Empty).FontSize(10);
                                    table.Cell().Text(report.SaledProduct ?? string.Empty).FontSize(10);
                                    table.Cell().Text(report.SaledProductPrice).FontSize(10);
                                    table.Cell().Text(report.ProductQuantity.ToString()).FontSize(10);
                                }
                            });
                        page.Footer()
                            .AlignRight()
                            .Text(text =>
                            {
                                text.Span("Итоговая выручка:");
                                text.Span(_viewModel.TotalRevenue.ToString("C")).FontSize(14).FontColor(Colors.Black);
                            });
                    });
                }).GeneratePdf();
            File.WriteAllBytes(filePath, pdfBytes);
            MessageBoxManager.GetMessageBoxStandard("Успешно!","Отчет сформирован").ShowAsync();
            Console.WriteLine($"Report generated successfully: {filePath}");
        }
        catch (Exception ex)
        {
            MessageBoxManager.GetMessageBoxStandard("Ошибка!","Произошла ошибка в формировании отчета").ShowAsync();
            Console.WriteLine($"Error generating report: {ex.Message}");
        }
    }
}