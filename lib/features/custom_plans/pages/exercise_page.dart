import 'package:flutter/material.dart';
import 'package:jayani_power/features/custom_plans/widgets/exercise_card.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "EXERCISE",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                // Spacer(),
                Text("See all",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Container(
              child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) => ExerciseCard(
                        exercise: "Jumping Ropes",
                        kcal: 110,
                        timeInMinutes: 8,
                        level: "Beginner",
                      )),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
