import 'package:flutter/material.dart';

void main() {
  runApp(const VanessaCorp());
}

class VanessaCorp extends StatelessWidget {
  const VanessaCorp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vanessa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}