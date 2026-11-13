import 'package:flutter/foundation.dart';

// currency model class to hold currency details
@immutable
class CurrencyModel {
  final String code;
  final String name;
  final String symbol;
  final String flagEmoji;
  final int rank;

  const CurrencyModel({
    required this.code,
    required this.name,
    required this.symbol,
    required this.flagEmoji,
    required this.rank,
  });

  // top 10 currencies list based on bis fx data..
  static const List<CurrencyModel> topTenCurrencies = [
    CurrencyModel(
      code: 'USD',
      name: 'US Dollar',
      symbol: '\$',
      flagEmoji: '🇺🇸',
      rank: 1,
    ),
    CurrencyModel(
      code: 'EUR',
      name: 'Euro',
      symbol: '€',
      flagEmoji: '🇪🇺',
      rank: 2,
    ),
    CurrencyModel(
      code: 'JPY',
      name: 'Japanese Yen',
      symbol: '¥',
      flagEmoji: '🇯🇵',
      rank: 3,
    ),
    CurrencyModel(
      code: 'GBP',
      name: 'British Pound',
      symbol: '£',
      flagEmoji: '🇬🇧',
      rank: 4,
    ),
    CurrencyModel(
      code: 'CNY',
      name: 'Chinese Renminbi',
      symbol: '¥',
      flagEmoji: '🇨🇳',
      rank: 5,
    ),
    CurrencyModel(
      code: 'AUD',
      name: 'Australian Dollar',
      symbol: 'A\$',
      flagEmoji: '🇦🇺',
      rank: 6,
    ),
    CurrencyModel(
      code: 'CAD',
      name: 'Canadian Dollar',
      symbol: 'C\$',
      flagEmoji: '🇨🇦',
      rank: 7,
    ),
    CurrencyModel(
      code: 'CHF',
      name: 'Swiss Franc',
      symbol: 'CHF',
      flagEmoji: '🇨🇭',
      rank: 8,
    ),
    CurrencyModel(
      code: 'HKD',
      name: 'Hong Kong Dollar',
      symbol: 'HK\$',
      flagEmoji: '🇭🇰',
      rank: 9,
    ),
    CurrencyModel(
      code: 'NZD',
      name: 'New Zealand Dollar',
      symbol: 'NZ\$',
      flagEmoji: '🇳🇿',
      rank: 10,
    ),
  ];

  // helper method to find currency by code
  static CurrencyModel findByCode(String code) {
    return topTenCurrencies.firstWhere(
      (c) => c.code.toUpperCase() == code.toUpperCase(),
      orElse: () => topTenCurrencies.first,
    );
  }
}
