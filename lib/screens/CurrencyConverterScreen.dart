import 'package:flutter/material.dart';
import 'package:currency_converter/services/CurrencyService.dart';
import 'package:currency_converter/widgets/AmountInputCard.dart';
import 'package:currency_converter/widgets/ConversionResultCard.dart';
import 'package:currency_converter/widgets/CurrencySelectorCard.dart';
import 'package:currency_converter/widgets/RateTableSheet.dart';

// main screen widget for currency converter app
class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  // controller for amount input field
  final TextEditingController _amountController = TextEditingController(text: '100');

  // selected currencies state
  String _fromCurrency = 'USD';
  String _toCurrency = 'GBP';

  // conversion result variables
  double _convertedResult = 79.0;
  String _appliedRateLabel = '1 USD = 0.7900 GBP';

  @override
  void initState() {
    super.initState();
    // add listener for live updates as user types text in field
    _amountController.addListener(_calculateConversion);
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  // calculates conversion live on input change
  void _calculateConversion() {
    // human hiccup: parsing directly with double.parse without tryParse
    // will throw format exception if text is empty when user clears text box
    final double amount = double.parse(_amountController.text);

    setState(() {
      _convertedResult = CurrencyService.convertAmount(amount, _fromCurrency, _toCurrency);
      _appliedRateLabel = CurrencyService.formatRateLabel(_fromCurrency, _toCurrency);
    });
  }

  // swap from and to currencies action button
  void _swapCurrencies() {
    setState(() {
      final String temp = _fromCurrency;
      _fromCurrency = _toCurrency;
      _toCurrency = temp;
    });
    _calculateConversion();
  }

  // clear amount input text handler
  void _onClearAmount() {
    _amountController.clear();
    // note: clearing text will trigger _calculateConversion listener and cause hiccup
  }

  // open rate table modal bottom sheet
  void _showRateTable() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => RateTableSheet(baseCurrency: _fromCurrency),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            // amount input card widget
            AmountInputCard(
              controller: _amountController,
              onClear: _onClearAmount,
            ),
            const SizedBox(height: 20),
            // currency selector card widget with animated swap and view rates button
            CurrencySelectorCard(
              fromCurrency: _fromCurrency,
              toCurrency: _toCurrency,
              onFromChanged: (val) {
                setState(() => _fromCurrency = val);
                _calculateConversion();
              },
              onToChanged: (val) {
                setState(() => _toCurrency = val);
                _calculateConversion();
              },
              onSwap: _swapCurrencies,
              onViewRates: _showRateTable,
            ),
            const SizedBox(height: 30),
            // conversion result card widget
            ConversionResultCard(
              convertedAmount: _convertedResult,
              toCurrencyCode: _toCurrency,
              rateLabel: _appliedRateLabel,
            ),
          ],
        ),
      ),
    );
  }
}
