import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jayani_power/features/custom_plans/widgets/exercise_card.dart';

void main() {
  testWidgets('ExerciseCard displays details', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: ExerciseCard(
          exercise: "Jumping Ropes",
          kcal: 110,
          timeInMinutes: 8,
          level: "Beginner"),
    )));

    expect(find.text("Jumping Ropes"), findsOneWidget);
    expect(find.text("110 kcal"), findsOneWidget);
    expect(find.text("8 minutes"), findsOneWidget);
    expect(find.text("Beginner"), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);
  });
}
