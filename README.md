# Currency Converter Mobile Application

A mobile application developed using Flutter and Dart

---
## Project Overview

A mobile app that lets users convert monetary amounts between the top 10 most traded currencies in real time using a fixed exchange rate table with dynamic cross-rate calculations.

---

## Architecture & Code Organisation

The application follows clean software engineering principles with separation of concerns:

```
lib/
├── models/
│   ├── CurrencyModel.dart      # Currency model class
│   └── ExchangeRates.dart      # Base exchange rates
├── services/
│   └── CurrencyService.dart    # Math calculations and rate formatting
├── widgets/
│   ├── AmountInputCard.dart    # Amount input card
│   ├── CurrencySelectorCard.dart # Currency selection card
│   ├── ConversionResultCard.dart # Converted amount result
│   └── RateTableSheet.dart     # Exchange rates modal
└── screens/
    └── CurrencyConverterScreen.dart # Main screen lifecycle
```

---

## Top 10 Global Currencies & Exchange Rate Reference

All exchange rates are hardcoded relative to a USD base rate (`1.0 USD`):

| Rank | Currency Name | Code | Symbol | Flag | Fixed Rate (1 USD) |
| :---: | :--- | :---: | :---: | :---: | :---: |
| 1 | United States Dollar | `USD` | `$` | 🇺🇸 | `1.0000` |
| 2 | Euro | `EUR` | `€` | 🇪🇺 | `0.9200` |
| 3 | Japanese Yen | `JPY` | `¥` | 🇯🇵 | `152.5000` |
| 4 | British Pound | `GBP` | `£` | 🇬🇧 | `0.7900` |
| 5 | Chinese Renminbi | `CNY` | `¥` | 🇨🇳 | `7.2400` |
| 6 | Australian Dollar | `AUD` | `A$` | 🇦🇺 | `1.5200` |
| 7 | Canadian Dollar | `CAD` | `C$` | 🇨🇦 | `1.3800` |
| 8 | Swiss Franc | `CHF` | `CHF` | 🇨🇭 | `0.8800` |
| 9 | Hong Kong Dollar | `HKD` | `HK$` | 🇭🇰 | `7.7700` |
| 10 | New Zealand Dollar | `NZD` | `NZ$` | 🇳🇿 | `1.6700` |

### Exchange Rate Data Source Reference

> Bank for International Settlements (BIS). (2022). *Triennial Central Bank Survey: Foreign exchange turnover in 2022*. Bank for International Settlements. https://www.bis.org/publ/rpfx22.htm
>
> European Central Bank (ECB). (2026). *Euro foreign exchange reference rates*. European Central Bank. https://www.ecb.europa.eu/stats/policy_and_exchange_rates/euro_reference_exchange_rates/html/index.en.html

---

## Git Commit Log Summary

| Commit | Summary | Key Files |
| :--- | :--- | :--- |
| **Commit 1** | Domain models and exchange matrix | `CurrencyModel.dart`, `ExchangeRates.dart` |
| **Commit 2** | Conversion service and math logic | `CurrencyService.dart`, `currency_service_test.dart` |
| **Commit 3** | Main screen and state management | `CurrencyConverterScreen.dart`, `main.dart` |
| **Commit 4** | Modular UI cards and styling | `AmountInputCard.dart`, `ConversionResultCard.dart` |
| **Commit 5** | Currency selection and swap animation | `CurrencySelectorCard.dart`, `RateTableSheet.dart` |
| **Commit 6** | Input sanitisation and rounding fix | `CurrencyService.dart`, `CurrencyConverterScreen.dart` |
| **Commit 7** | Code documentation and README | `README.md`, test suite |

---

## Testing & Execution Instructions

### 1. Run Test Suite
```bash
flutter test --reporter=expanded
```

### 2. Run Application
```bash
flutter run
```
