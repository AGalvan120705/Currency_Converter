import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/services/CurrencyService.dart';

void main() {
  group('currency service conversion tests', () {
    test('100 usd to gbp should equal 79.0', () {
      final result = CurrencyService.convertAmount(100, 'USD', 'GBP');
      expect(result, 79.0);
    });

    test('100 gbp to usd should calculate ~126.58', () {
      final result = CurrencyService.convertAmount(100, 'GBP', 'USD');
      expect((result - 126.5822).abs() < 0.01, true);
    });

    test('200 usd to gbp should equal 158.0', () {
      final result = CurrencyService.convertAmount(200, 'USD', 'GBP');
      expect(result, 158.0);
    });

    test('rate label format works.', () {
      final label = CurrencyService.formatRateLabel('USD', 'GBP');
      expect(label, '1 USD = 0.7900 GBP');
    });
  });
}
