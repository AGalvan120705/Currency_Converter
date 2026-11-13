import 'package:flutter/material.dart';
import 'package:currency_converter/models/CurrencyModel.dart';
import 'package:currency_converter/models/ExchangeRates.dart';

// modal bottom sheet displaying full exchange rate table for selected base currency
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
      height: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Exchange Rates (Base: $baseCurrency)',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: CurrencyModel.topTenCurrencies.length,
              itemBuilder: (context, index) {
                final currency = CurrencyModel.topTenCurrencies[index];
                final double rate = ExchangeRates.getCrossRate(baseCurrency, currency.code);

                return ListTile(
                  leading: Text(currency.flagEmoji, style: const TextStyle(fontSize: 24)),
                  title: Text('${currency.name} (${currency.code})'),
                  trailing: Text(
                    '1 $baseCurrency = ${rate.toStringAsFixed(4)} ${currency.symbol}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
