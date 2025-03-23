import 'package:flutter/material.dart';

import '../api/services/connect_to_database.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _positionController = TextEditingController();

  Future<void> _createEmployee() async {
    await connection.execute((ctx) async {
      final authResult = await ctx.execute(
        '''INSERT INTO auth ("Login", "Password") 
           VALUES (@login, @password)
           RETURNING "IDAuth"''',
        parameters: {
          'login': _loginController.text,
          'password': _passwordController.text,
        },
      );
      
      await ctx.execute(
        '''INSERT INTO employees ("IDAuth", "IDPosition")
           VALUES (@authId, @positionId)''',
        parameters: {
          'authId': authResult[0][0],
          'positionId': int.parse(_positionController.text),
        },
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Сотрудник создан')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Администрирование')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _loginController, decoration: InputDecoration(labelText: 'Логин')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Пароль')),
            TextField(controller: _positionController, decoration: InputDecoration(labelText: 'ID должности')),
            ElevatedButton(
              onPressed: _createEmployee,
              child: Text('Зарегистрировать сотрудника'),
            )
          ],
        ),
      ),
    );
  }
}