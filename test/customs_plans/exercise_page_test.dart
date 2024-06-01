import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jayani_power/features/custom_plans/pages/exercise_page.dart';
import 'package:jayani_power/features/custom_plans/widgets/exercise_card.dart';
import 'package:jayani_power/main.dart';

void main() {
  testWidgets('Exercise Page has a title and list of exercises',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: ExercisePage()));
    final textFinder = find.text("EXERCISE");

    expect(textFinder, findsAny);
    expect(find.text("See all"), findsOneWidget);
    expect(find.byType(ExerciseCard), findsNWidgets(9));
  });
}
