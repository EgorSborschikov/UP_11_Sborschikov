import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:provider/provider.dart';
import 'package:vanessa_copr_app/models/models.dart';
import '../api/services/auth_provider.dart';
import '../api/services/connect_to_database.dart';

class PharmacistScreen extends StatefulWidget {
  @override
  _PharmacistScreenState createState() => _PharmacistScreenState();
}

class _PharmacistScreenState extends State<PharmacistScreen> {
  List<PharmacyProduct> _products = [];
  final _clientController = TextEditingController();
  int? _selectedProductId;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
  try {
    final result = await connection.execute(
      'SELECT "IDPharmacyProduct", "ProductName", "Price"::numeric '
      'FROM pharmacy_products'
    );
    
    setState(() {
      _products = result.map((row) {
        // Проверка всего row на null
        final id = row[0];
        final name = row[1];
        final price = row[2];


      }).cast<PharmacyProduct>().toList();
    });
  } catch (e) {
    print('Ошибка загрузки товаров: $e');
  }
}

  Future<void> _sellProduct() async {
    if (_selectedProductId == null || _clientController.text.isEmpty) return;

    final user = Provider.of<AuthProvider>(context, listen: false).currentUser;
    if (user == null) return;

    try {
      await connection.execute(
        '''INSERT INTO sale_of_pharmacy_products 
           ("IDEmployee", "IDClient", "IDPharmacyProduct")
           VALUES (@employeeId, @clientId, @productId)''',
        parameters: {
          'employeeId': user.id,
          'clientId': int.parse(_clientController.text),
          'productId': _selectedProductId!,
        },
      );
      // ... остальной код
    } catch (e) {
      // ... обработка ошибок
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Панель фармацевта'),
        actions: [IconButton(icon: Icon(Icons.refresh), onPressed: _loadProducts)],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<int>(
              items: _products.map((p) => DropdownMenuItem(
                value: p.IDPharmacyProduct,
                child: Text('${p.ProductName} - ${p.Price} руб.'),
              )).toList(),
              onChanged: (v) => setState(() => _selectedProductId = v),
            ),
            TextField(
              controller: _clientController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'ID клиента'),
            ),
            ElevatedButton(
              onPressed: _sellProduct,
              child: Text('Оформить продажу'),
            )
          ],
        ),
      ),
    );
  }
}