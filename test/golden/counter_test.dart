import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:itba_damm/counter.dart';

void main() {
  group('Counter Widget Tests', () {
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('MyHomePage has correct title', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verify that the app bar has the correct title
      expect(find.text('Flutter ITBA Demo Home Page'), findsOneWidget);
    });

    testWidgets('FloatingActionButton has correct tooltip',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Find the FloatingActionButton
      final fab = find.byType(FloatingActionButton);

      // Verify that the FloatingActionButton has the correct tooltip
      expect(tester.widget<FloatingActionButton>(fab).tooltip, 'Increment');
    });

    testWidgets('Counter text is displayed correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verify that the explanatory text is displayed
      expect(find.text('You have pushed the button this many times:'),
          findsOneWidget);
    });

    testWidgets('MyHomePage matches golden image', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MyApp());

      // Compare with golden file
      await expectLater(
        find.byType(MyHomePage),
        matchesGoldenFile('my_home_page_golden.png'),
      );
    });

    testWidgets('MyHomePage with incremented counter matches golden image',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MyApp());

      // Increment the counter
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      // Compare with golden file
      await expectLater(
        find.byType(MyHomePage),
        matchesGoldenFile('my_home_page_incremented_golden.png'),
      );
    });
  });
}
