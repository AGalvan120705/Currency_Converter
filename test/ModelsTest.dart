import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/models/CurrencyModel.dart';
import 'package:currency_converter/models/ExchangeRates.dart';

void main() {
  group('currency model tests', () {
    test('should contain 10 currencies', () {
      expect(CurrencyModel.topTenCurrencies.length, 10);
    });

    test('find currency by code works.', () {
      final gbp = CurrencyModel.findByCode('GBP');
      expect(gbp.name, 'British Pound');
      expect(gbp.symbol, '£');
      expect(gbp.rank, 4);
    });
  });

  group('exchange rate matrix tests', () {
    test('usd to gbp rate is 0.79 from brief', () {
      final rate = ExchangeRates.getCrossRate('USD', 'GBP');
      expect(rate, 0.79);
    });

    test('gbp to usd calculates inverse ~1.2658', () {
      final rate = ExchangeRates.getCrossRate('GBP', 'USD');
      expect((rate - (1.0 / 0.79)).abs() < 0.0001, true);
    });

    test('same currency rate gives 1.0', () {
      final rate = ExchangeRates.getCrossRate('EUR', 'EUR');
      expect(rate, 1.0);
    });
  });
}
