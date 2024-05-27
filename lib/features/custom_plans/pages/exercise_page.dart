import 'package:flutter/material.dart';
import 'package:jayani_power/features/custom_plans/widgets/exercise_card.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [ExerciseCard()],
      ),
    );
  }
}
