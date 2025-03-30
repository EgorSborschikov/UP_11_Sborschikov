using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using VanessaApp.Entities;

/// <summary>
/// Create online order view model
/// </summary>

namespace VanessaApp.ViewModels
{
    public class OnlineOrderViewModel : INotifyPropertyChanged
    {
        private readonly VanessaDbContext _context;
        private NewClientViewModel _currentNewClientViewModel;
        private decimal _totalCost;

        public ObservableCollection<OrderItemViewModel> OrderItemProducts { get; set; }
        public ObservableCollection<NewClientViewModel> NewClients { get; set; }
        public ObservableCollection<pickup_point> PickupPoints { get; set; }
        public ObservableCollection<payments_method> PaymentMethods { get; set; }

        private pickup_point _selectedPickupPoint;
        private payments_method _selectedPaymentMethod;

        public pickup_point SelectedPickupPoint
        {
            get => _selectedPickupPoint;
            set
            {
                _selectedPickupPoint = value;
                OnPropertyChanged(nameof(SelectedPickupPoint));
            }
        }

        public payments_method SelectedPaymentMethod
        {
            get => _selectedPaymentMethod;
            set
            {
                _selectedPaymentMethod = value;
                OnPropertyChanged(nameof(SelectedPaymentMethod));
            }
        }

        public decimal TotalCost
        {
            get => _totalCost;
            set
            {
                _totalCost = value;
                OnPropertyChanged(nameof(TotalCost));
            }
        }

        public NewClientViewModel CurrentNewClientViewModel
        {
            get => _currentNewClientViewModel;
            set
            {
                _currentNewClientViewModel = value;
                OnPropertyChanged(nameof(CurrentNewClientViewModel));
            }
        }

        public OnlineOrderViewModel()
        {
            _context = new VanessaDbContext();
            OrderItemProducts = new ObservableCollection<OrderItemViewModel>();
            NewClients = new ObservableCollection<NewClientViewModel>();
            CurrentNewClientViewModel = new NewClientViewModel();
            
            LoadPickupPoints();
            LoadPaymentMethods();
            LoadOrderItems();

            foreach (var item in OrderItemProducts)
            {
                item.PropertyChanged += OrderItem_PropertyChanged;
            }
        }
        
        private void LoadPickupPoints()
        {
            var pickupPoints = _context.pickup_points
                .Include(pp => pp.IDCityNavigation) 
                .ToList();
            PickupPoints = new ObservableCollection<pickup_point>(pickupPoints);
        }


        private void LoadPaymentMethods()
        {
            var paymentMethods = _context.payments_methods.ToList();
            PaymentMethods = new ObservableCollection<payments_method>(paymentMethods);
        }

        private void LoadOrderItems()
        {
            var items = _context.pharmacy_products.ToList();
            var orderItems = items
                .Select(oit => new OrderItemViewModel
                {
                    OrderItemId = oit.IDPharmacyProduct,
                    OrderItemName = oit.ProductName,
                    OrderItemPrice = oit.Price,
                    OrderIsSelected = false,
                    OrderQuantity = 0
                }).ToList();
            OrderItemProducts.Clear();
            foreach (var orderItem in orderItems)
            {
                OrderItemProducts.Add(orderItem);
                orderItem.PropertyChanged += OrderItem_PropertyChanged;
            }
        }

        private void OrderItem_PropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == nameof(OrderItemViewModel.OrderIsSelected) || e.PropertyName == nameof(OrderItemViewModel.OrderQuantity))
            {
                CalculateTotalCost();
            }
        }

        private void CalculateTotalCost()
        {
            TotalCost = OrderItemProducts
                .Where(item  => item.OrderIsSelected && item.OrderQuantity > 0)
                .Sum(item => item.OrderItemPrice * item.OrderQuantity);
        }

        public void CreateNewClient()
        {
            if (string.IsNullOrWhiteSpace(CurrentNewClientViewModel.NewClientSurname) ||
                string.IsNullOrWhiteSpace(CurrentNewClientViewModel.NewClientName) ||
                string.IsNullOrWhiteSpace(CurrentNewClientViewModel.NewClientLastname) ||
                string.IsNullOrWhiteSpace(CurrentNewClientViewModel.NewClientEmail))
            {
                throw new InvalidOperationException("All client fields must be filled.");
            }

            var newClient = new client
            {
                Surname = CurrentNewClientViewModel.NewClientSurname,
                Name = CurrentNewClientViewModel.NewClientName,
                Lastname = CurrentNewClientViewModel.NewClientLastname,
                Email = CurrentNewClientViewModel.NewClientEmail
            };

            _context.clients.Add(newClient);
            _context.SaveChanges();

            CurrentNewClientViewModel.ClientId = newClient.IDClient;
        }

        public void SaveOrder()
        {
            var newOrder = new online_order
            {
                IDClient = CurrentNewClientViewModel.ClientId,
                IDPharmacyProduct = OrderItemProducts.First(item => item.OrderIsSelected).OrderItemId,
                IDPickupPoint = SelectedPickupPoint.IDPickupPoints,
                IDPaymentMethod = SelectedPaymentMethod.IDPaymentMethod
            };

            _context.online_orders.Add(newOrder);
            _context.SaveChanges();
        }

        public event PropertyChangedEventHandler? PropertyChanged;
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }

    public class OrderItemViewModel : INotifyPropertyChanged
    {
        private bool _isSelected;
        private int _quantity;

        public int OrderItemId { get; set; }
        public string? OrderItemName { get; set; }
        public decimal OrderItemPrice { get; set; }

        public bool OrderIsSelected
        {
            get => _isSelected;
            set
            {
                _isSelected = value;
                OnPropertyChanged(nameof(OrderIsSelected));
            }
        }

        public int OrderQuantity
        {
            get => _quantity;
            set
            {
                _quantity = value;
                OnPropertyChanged(nameof(OrderQuantity));
            }
        }

        public event PropertyChangedEventHandler? PropertyChanged;
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }

    public class NewClientViewModel
    {
        public int ClientId { get; set; }
        public string? NewClientSurname { get; set; }
        public string? NewClientName { get; set; }
        public string? NewClientLastname { get; set; }
        public string? NewClientEmail { get; set; }
    }
}
