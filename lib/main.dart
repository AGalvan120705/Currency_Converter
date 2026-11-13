import 'package:flutter/material.dart';
import 'package:currency_converter/screens/CurrencyConverterScreen.dart';

void main() {
  runApp(const CurrencyConverterApp());
}

// root app widget
class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const CurrencyConverterScreen(),
    );
  }
}
