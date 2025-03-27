using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Input;
using Microsoft.EntityFrameworkCore;
using VanessaApp.Entities;
using VanessaApp.Screens.SpecialistDoctor.AddRecept;

namespace VanessaApp.ViewModels;

public class SpecialistDoctorViewModel
{
    private readonly VanessaDbContext _context;
    public ObservableCollection<PatientByCouponsViewModel> Receipts { get; set; }

    public SpecialistDoctorViewModel()
    {
        _context = new VanessaDbContext();
        Receipts = new ObservableCollection<PatientByCouponsViewModel>();
        LoadPatiens();
    }

    private void LoadPatiens()
    {
        var patientByCoupons = _context.patient_by_coupons
            .Select(p => new PatientByCouponsViewModel
            {
                IDRecept = p.IDReception,
                ClientsFullName = $"{p.IDCouponNavigation.IDClientsNavigation.Surname} {p.IDCouponNavigation.IDClientsNavigation.Name} {p.IDCouponNavigation.IDClientsNavigation.Lastname}",
                AnimalType = p.IDAnimalTypeNavigation.Type,
                PharmacyProduct = p.IDPharmacyProductNavigation.ProductName,
                RegularInspection = p.RegularInspection,
                Complaints = p.Complaints,
                Conclusions = p.Conclusions,
                Custody = p.Custody,
            }).ToList();
        Receipts.Clear();
        foreach (var patientByCoupon in patientByCoupons)
        {
            Receipts.Add(patientByCoupon);
        }
    }
}

public class PatientByCouponsViewModel
{
    public int IDRecept { get; set; }
    public string? ClientsFullName { get; set; }
    public string? AnimalType { get; set; }
    public string? PharmacyProduct {get; set;}
    public bool RegularInspection { get; set; }
    public string? Complaints { get; set; }
    public string? Conclusions {get; set;}
    public string? Custody { get; set; }
}