import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile_creation/main.dart';

void main() {
  testWidgets('Profile screen renders all required elements', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify AppBar title
    expect(find.text('My Profile'), findsOneWidget);

    // Verify field labels
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Points'), findsOneWidget);

    // Verify field values
    expect(find.text('Diluka'), findsOneWidget);
    expect(find.text('diluka.w@nsbm.ac.lk'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // Verify icons
    expect(find.byIcon(Icons.mail), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Verify FloatingActionButton exists
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
