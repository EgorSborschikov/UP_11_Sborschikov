class Employee {
  final int id;
  final String fullName;
  final int positionId;
  final int branchId;

  Employee({required this.id, required this.fullName, required this.positionId, required this.branchId});
}

class PharmacyProduct {
  final int IDPharmacyProduct;
  final String ProductName;
  final double Price;

  PharmacyProduct({
    required this.IDPharmacyProduct,
    required this.ProductName,
    required this.Price,
  });
}