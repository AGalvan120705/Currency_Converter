import 'package:currency_converter/models/ExchangeRates.dart';

// service to handle currency conversion math and rate labels
class CurrencyService {
  // calculate raw converted amount for input
  static double convertAmount(double amount, String fromCode, String toCode) {
    final rate = ExchangeRates.getCrossRate(fromCode, toCode);
    return amount * rate;
  }

  // format applied exchange rate label string for ui..
  static String formatRateLabel(String fromCode, String toCode) {
    final rate = ExchangeRates.getCrossRate(fromCode, toCode);
    return '1 $fromCode = ${rate.toStringAsFixed(4)} $toCode';
  }
}
