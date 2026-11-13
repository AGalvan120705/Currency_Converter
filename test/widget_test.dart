import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/main.dart';

void main() {
  testWidgets('Test 10: Currency converter screen loads and displays 79.00 GBP for 100 USD', (WidgetTester tester) async {
    // build our app and trigger a frame.
    await tester.pumpWidget(const CurrencyConverterApp());

    // verify app title and default conversion result
    expect(find.text('Currency Converter'), findsOneWidget);
    expect(find.text('79.00 GBP'), findsOneWidget);
  });
}
