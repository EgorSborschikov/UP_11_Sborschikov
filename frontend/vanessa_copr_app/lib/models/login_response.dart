class LoginResponse {
  final String employeeId;
  final String fullName;
  final String position;
  final String branchId;

  LoginResponse({
    required this.employeeId,
    required this.fullName,
    required this.position,
    required this.branchId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        employeeId: json["employee_id"],
        fullName: json["full_name"],
        position: json["position"],
        branchId: json["branch_id"],
      );
}