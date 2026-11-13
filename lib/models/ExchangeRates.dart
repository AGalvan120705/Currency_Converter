// fixed exchange rate table relative to usd base
class ExchangeRates {
  // usd base rates table hardcoded for the assignment
  static const Map<String, double> baseRatesVsUsd = {
    'USD': 1.0,
    'GBP': 0.79,   // brief example rate 1 usd = 0.79 gbp
    'EUR': 0.92,   // 1 usd = 0.92 eur
    'JPY': 152.50, // 1 usd = 152.5 yen
    'CNY': 7.24,   // china renminbi rate
    'AUD': 1.52,   // aussie dollar
    'CAD': 1.38,   // canadian dollar
    'CHF': 0.88,   // swiss franc
    'HKD': 7.77,   // hong kong dollar
    'NZD': 1.67,   // kiwi dollar
  };

  // calculates cross rate between from and to currencies.
  static double getCrossRate(String fromCode, String toCode) {
    final double? fromRate = baseRatesVsUsd[fromCode.toUpperCase()];
    final double? toRate = baseRatesVsUsd[toCode.toUpperCase()];

    if (fromRate == null || toRate == null || fromRate == 0) {
      return 1.0;
    }

    return toRate / fromRate;
  }
}
