import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/models/CurrencyModel.dart';
import 'package:currency_converter/models/ExchangeRates.dart';

void main() {
  group('currency model tests', () {
    test('Test 1: should contain 10 currencies', () {
      expect(CurrencyModel.topTenCurrencies.length, 10);
    });

    test('Test 2: find currency by code works.', () {
      final gbp = CurrencyModel.findByCode('GBP');
      expect(gbp.name, 'British Pound');
      expect(gbp.symbol, '£');
      expect(gbp.rank, 4);
    });
  });

  group('exchange rate matrix tests', () {
    test('Test 3: usd to gbp rate is 0.79 from brief', () {
      final rate = ExchangeRates.getCrossRate('USD', 'GBP');
      expect(rate, 0.79);
    });

    test('Test 4: gbp to usd calculates inverse ~1.2658', () {
      final rate = ExchangeRates.getCrossRate('GBP', 'USD');
      expect((rate - (1.0 / 0.79)).abs() < 0.0001, true);
    });

    test('Test 5: same currency rate gives 1.0', () {
      final rate = ExchangeRates.getCrossRate('EUR', 'EUR');
      expect(rate, 1.0);
    });
  });
}
