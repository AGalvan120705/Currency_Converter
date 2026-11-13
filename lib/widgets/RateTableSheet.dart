import 'package:flutter/material.dart';

// rate table sheet widget - initial scaffold
class RateTableSheet extends StatelessWidget {
  final String baseCurrency;

  const RateTableSheet({
    super.key,
    required this.baseCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Exchange Rates for $baseCurrency',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text('rate table list details coming soon..'),
        ],
      ),
    );
  }
}
