import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanessa_copr_app/pages/login_screen.dart';
import 'package:vanessa_copr_app/pages/specialist_doctor_screen.dart';
import 'api/services/auth_provider.dart';
import 'api/services/connect_to_database.dart';
import 'pages/accountant_screen.dart';
import 'pages/admin_screen.dart';
import 'pages/duty_doctor_screen.dart';
import 'pages/pharmacist_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await connectToDatabase();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: VanessaCorpApp(),
    ),
  );
}

class VanessaCorpApp extends StatelessWidget {
  const VanessaCorpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Vanessa',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/pharmacist': (context) => PharmacistScreen(),
        '/accountant': (context) => AccountantScreen(),
        '/doctor': (context) => SpecialistDoctorScreen(),
        '/duty_doctor': (context) => DutyDoctorScreen(),
        '/admin': (context) => AdminScreen(),
      },
    );
  }
}
