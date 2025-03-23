import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanessa_copr_app/api/services/login_employee.dart';
import '../api/services/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _handleLogin() async {
  try {
    final employee = await loginEmployee(
      _loginController.text,
      _passwordController.text,
    );
    
    // Правильный способ доступа к провайдеру
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.setUser(employee);
    
    Navigator.pushReplacementNamed(
      context, 
      roleRoutes[employee.positionId]!
    );
  } catch (e) {
    // Обработка ошибки
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _loginController,
                decoration: InputDecoration(labelText: 'Логин'),
                validator: (v) => v!.isEmpty ? 'Введите логин' : null,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Пароль'),
                validator: (v) => v!.isEmpty ? 'Введите пароль' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _handleLogin,
                child: _isLoading 
                  ? CircularProgressIndicator()
                  : Text('Войти'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}