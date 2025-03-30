using System.Collections.ObjectModel;
using System.Linq;
using VanessaApp.Entities;

namespace VanessaApp.ViewModels;

/// <summary>
/// DutyDoctor-Panel view model
/// </summary>

public class DutyDoctorViewModel
{
    private VanessaDbContext _context;
    public ObservableCollection<CouponViewModel> Coupons { get; set; }
    public DutyDoctorViewModel()
    {
        _context = new VanessaDbContext();
        Coupons = new ObservableCollection<CouponViewModel>();
        LoadCoupons();
    }

    private void LoadCoupons()
    {
        var coupons = _context.coupons
            .Select(c => new CouponViewModel
            {
                IDCoupon = c.IDCoupon,
                ClientsFullName = $"{c.IDClientsNavigation.Surname} {c.IDClientsNavigation.Name} {c.IDClientsNavigation.Lastname}",
                Email = c.IDClientsNavigation.Email,
                EmployeeFullName = $"{c.IDEmployeeNavigation.Surname} {c.IDEmployeeNavigation.Name} {c.IDEmployeeNavigation.LastName}"
            }).ToList();

        Coupons.Clear();
        foreach (var coupon in coupons)
        {
            Coupons.Add(coupon);
        }
    }
}

public class CouponViewModel
{
    public int IDCoupon { get; set; }
    public string? ClientsFullName { get; set; }
    public string? Email { get; set; }
    public string? EmployeeFullName { get; set; }
}