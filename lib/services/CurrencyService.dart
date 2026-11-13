import 'package:currency_converter/models/ExchangeRates.dart';

// service to handle currency conversion math and rate labels
class CurrencyService {
  // calculate raw converted amount for input
  static double convertAmount(double amount, String fromCode, String toCode) {
    final rate = ExchangeRates.getCrossRate(fromCode, toCode);
    return amount * rate;
  }

  // safely parse text input into double defaulting to 0.0 if empty or invalid..
  static double parseInputAmount(String text) {
    final cleaned = text.trim();
    if (cleaned.isEmpty) return 0.0;
    return double.tryParse(cleaned) ?? 0.0;
  }

  // format converted amount to 2 decimal places
  static String formatConvertedAmount(double amount) {
    return amount.toStringAsFixed(2);
  }

  // format applied exchange rate label string for ui..
  static String formatRateLabel(String fromCode, String toCode) {
    final rate = ExchangeRates.getCrossRate(fromCode, toCode);
    return '1 $fromCode = ${rate.toStringAsFixed(4)} $toCode';
  }
}
