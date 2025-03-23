import 'package:flutter/material.dart';

import '../api/services/connect_to_database.dart';

class DutyDoctorScreen extends StatefulWidget {
  @override
  _DutyDoctorScreenState createState() => _DutyDoctorScreenState();
}

class _DutyDoctorScreenState extends State<DutyDoctorScreen> {
  final _clientController = TextEditingController();
  final _complaintController = TextEditingController();
  int? _selectedDoctorId;

  Future<void> _createAppointment() async {
    await connection.execute(
      '''INSERT INTO coupons ("IDClients", "IDEmployee")
         VALUES (@clientId, @doctorId)''',
      parameters: {
        'clientId': int.parse(_clientController.text),
        'doctorId': _selectedDoctorId!,
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Запись создана')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Приемное отделение')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _clientController,
              decoration: InputDecoration(labelText: 'ID клиента')),
            TextField(
              controller: _complaintController,
              decoration: InputDecoration(labelText: 'Жалобы')),
            FutureBuilder(
              future: connection.execute('SELECT "IDEmployee" FROM employees WHERE "IDPosition" = 3'),
              builder: (ctx, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return DropdownButton<int>(
                  hint: Text('Выберите врача'),
                  items: snapshot.data!.map((row) => DropdownMenuItem(
                    value: row[0] as int,
                    child: Text('Врач №${row[0]}'),
                  )).toList(),
                  onChanged: (v) => _selectedDoctorId = v,
                );
              }
            ),
            ElevatedButton(
              onPressed: _createAppointment,
              child: Text('Создать запись'),
            )
          ],
        ),
      ),
    );
  }
}