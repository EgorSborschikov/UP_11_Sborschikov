import 'package:flutter/material.dart';
import '../api/services/connect_to_database.dart';

class SpecialistDoctorScreen extends StatefulWidget {
  @override
  _SpecialistDoctorScreenState createState() => _SpecialistDoctorScreenState();
}

class _SpecialistDoctorScreenState extends State<SpecialistDoctorScreen> {
  final _diagnosisController = TextEditingController();
  int? _selectedAppointmentId;


  Future<void> _updateAppointment() async {
    await connection.execute(
      '''UPDATE patient_by_coupon 
         SET "Conclusions" = @diagnosis 
         WHERE "IDReception" = @id''',
      parameters: {
        'diagnosis': _diagnosisController.text,
        'id': _selectedAppointmentId,
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Диагноз сохранен')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Кабинет врача')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            FutureBuilder(
              future: connection.execute('SELECT "IDReception" FROM patient_by_coupon'),
              builder: (ctx, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return DropdownButton<int>(
                  hint: Text('Выберите запись'),
                  items: snapshot.data!.map((row) => DropdownMenuItem(
                    value: row[0] as int,
                    child: Text('Запись №${row[0]}'),
                  )).toList(),
                  onChanged: (v) => _selectedAppointmentId = v,
                );
              }
            ),
            TextField(
              controller: _diagnosisController,
              decoration: InputDecoration(labelText: 'Диагноз и лечение'),
              maxLines: 5,
            ),
            ElevatedButton(
              onPressed: _updateAppointment,
              child: Text('Сохранить'),
            )
          ],
        ),
      ),
    );
  }
}