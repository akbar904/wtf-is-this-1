import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/main.dart';

void main() {
  group('Main', () {
    testWidgets('App initializes with expected title',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text('My Flutter App'), findsOneWidget);
    });

    testWidgets('Counter initialized to 0', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text('0'), findsOneWidget);
    });
  });
}
