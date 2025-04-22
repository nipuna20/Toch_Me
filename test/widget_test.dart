import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touch_me/main.dart';

void main() {
  testWidgets('Onboarding screen shows first title',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TouchMeApp());

    // Check if the first onboarding title is present
    expect(
      find.text(
          'Timeless Sophistication,\nEach Moment Transcends Expectations'),
      findsOneWidget,
    );

    // Tap the "Continue" button
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Check if second onboarding screen appears
    expect(
      find.text('Where Tranquility Meets Luxury,\nOne Treatment at a Time.'),
      findsOneWidget,
    );
  });
}
