import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/services/CurrencyService.dart';

void main() {
  group('currency service conversion tests', () {
    test('Test 6: 100 usd to gbp should equal 79.0', () {
      final result = CurrencyService.convertAmount(100, 'USD', 'GBP');
      expect(result, 79.0);
    });

    test('Test 7: 100 gbp to usd should calculate ~126.58', () {
      final result = CurrencyService.convertAmount(100, 'GBP', 'USD');
      expect((result - 126.5822).abs() < 0.01, true);
    });

    test('Test 8: 200 usd to gbp should equal 158.0', () {
      final result = CurrencyService.convertAmount(200, 'USD', 'GBP');
      expect(result, 158.0);
    });

    test('Test 9: rate label format works.', () {
      final label = CurrencyService.formatRateLabel('USD', 'GBP');
      expect(label, '1 USD = 0.7900 GBP');
    });

    test('Test 11: empty input string returns 0.0 without crash.', () {
      final parsed = CurrencyService.parseInputAmount('');
      expect(parsed, 0.0);
    });

    test('Test 12: format converted amount rounds to 2 decimal places.', () {
      final formatted = CurrencyService.formatConvertedAmount(126.582278);
      expect(formatted, '126.58');
    });
  });
}
