import 'package:flutter/material.dart';

import '../api/services/connect_to_database.dart';

class AccountantScreen extends StatefulWidget {
  @override
  _AccountantScreenState createState() => _AccountantScreenState();
}

class _AccountantScreenState extends State<AccountantScreen> {
  List<Map<String, dynamic>> _transactions = [];

  Future<void> _loadTransactions() async {
    final result = await connection.execute(
      '''SELECT p."IDPayment", p."Price"::numeric, pm."Method" 
         FROM payments p
         JOIN payments_methods pm ON p."IDPaymentMethod" = pm."IDPaymentMethod"''');
    
    setState(() {
      _transactions = result.map((row) => {
        'id': row[0],
        'amount': row[1],
        'method': row[2],
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Финансовый учет')),
      body: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text('Платеж №${_transactions[i]['id']}'),
          subtitle: Text('${_transactions[i]['method']}'),
          trailing: Text('${_transactions[i]['amount']} руб.'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadTransactions,
        child: Icon(Icons.refresh),
      ),
    );
  }
}