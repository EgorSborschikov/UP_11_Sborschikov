import 'package:flutter/material.dart';
import 'package:vanessa_copr_app/api/services/connect_to_database.dart';
import 'package:vanessa_copr_app/models/models.dart';

// Определение маршрутов для каждой роли
const Map<int, String> roleRoutes = {
  1: '/pharmacist',
  2: '/accountant',
  3: '/doctor',
  4: '/duty_doctor',
  5: '/admin',
};

Future<void> navigateBasedOnRole(BuildContext context, int positionId) async {
  final route = roleRoutes[positionId];
  if (route != null) {
    await Navigator.pushNamed(context, route);
  } else {
    throw Exception('Неизвестная роль');
  }
}

Future<Employee> loginEmployee(String login, String password) async {
  try {
    // Логирование параметров для проверки
    print('Login: $login, Password: $password');

    final result = await connection.execute(
      '''
      SELECT e."IDEmployee",
             CONCAT(e."Surname", ' ', e."Name", ' ', e."LastName") AS full_name,
             e."IDPosition",
             e."IDBranch"
      FROM auth a
      JOIN employees e ON a."IDAuth" = e."IDAuth"
      WHERE a."Login" = CAST(@1 AS VARCHAR) AND a."Password" = CAST(@2 AS VARCHAR)
      ''',
      parameters: [login, password],
    );

    if (result.isEmpty) {
      throw Exception('Неверные учетные данные');
    }

    return Employee(
      id: result[0][0] as int,
      fullName: result[0][1] as String,
      positionId: result[0][2] as int,
      branchId: result[0][3] as int,
    );
  } catch (e) {
    print('Ошибка при выполнении запроса: $e');
    throw Exception('Ошибка при входе в систему');
  }
}
