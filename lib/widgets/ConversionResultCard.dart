import 'package:flutter/material.dart';
import 'package:currency_converter/services/CurrencyService.dart';

// card widget to display final converted amount and rate statement
class ConversionResultCard extends StatelessWidget {
  final double convertedAmount;
  final String toCurrencyCode;
  final String rateLabel;

  const ConversionResultCard({
    super.key,
    required this.convertedAmount,
    required this.toCurrencyCode,
    required this.rateLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              'Converted Amount',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 8),
            // fixed in commit 6: format to 2 decimal places using formatConvertedAmount
            Text(
              '${CurrencyService.formatConvertedAmount(convertedAmount)} $toCurrencyCode',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.indigo.shade100),
              ),
              child: Text(
                rateLabel,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.indigo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
