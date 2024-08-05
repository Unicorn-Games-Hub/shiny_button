import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shiny_button/shiny_button.dart';

void main() {
  testWidgets('ShinyButton renders correctly and responds to tap',
      (WidgetTester tester) async {
    bool buttonPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ShinyButton(
            onPressed: () {
              buttonPressed = true;
            },
            label: 'Subscribe and Play',
            icon: Icon(Icons.play_arrow, color: Colors.white),
            backgroundColor: Colors.green,
            textColor: Colors.white,
          ),
        ),
      ),
    );

    // Verify that the label is displayed correctly
    expect(find.text('Subscribe and Play'), findsOneWidget);

    // Verify that the icon is displayed correctly
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);

    // Tap the button and verify that the onPressed callback is triggered
    await tester.tap(find.byType(ShinyButton));
    await tester.pump();

    expect(buttonPressed, isTrue);
  });

  testWidgets('ShinyButton shader mask animation works',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ShinyButton(
            onPressed: () {},
            label: 'Subscribe and Play',
            icon: Icon(Icons.play_arrow, color: Colors.white),
            backgroundColor: Colors.green,
            textColor: Colors.white,
          ),
        ),
      ),
    );

    // Verify the ShaderMask widget exists
    expect(find.byType(ShaderMask), findsOneWidget);
  });
}
