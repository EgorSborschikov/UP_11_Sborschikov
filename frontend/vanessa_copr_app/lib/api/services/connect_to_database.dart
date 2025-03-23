import 'package:postgres/postgres.dart';

import '../config/config.dart';

late Connection connection;

Future<void> connectToDatabase() async {
  try {
    connection = await Connection.open(
      Endpoint(
        host: host,
        database: database,
        username: user,
        password: password,
      ),
    );
    print('Connection to the database established.');
  } catch (e) {
    print('Error connecting to the database: $e');
  }
}