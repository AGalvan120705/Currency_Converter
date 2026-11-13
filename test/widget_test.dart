import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/main.dart';

void main() {
  testWidgets('Hello World smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that Hello World text is present.
    expect(find.text('Hello World'), findsOneWidget);
  });
}
