import 'package:flutter/material.dart';
import 'package:jayani_power/features/custom_plans/widgets/diet_card.dart';

class DietsPage extends StatelessWidget {
  const DietsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return DietCard(
                plate: "Ensalada Cesar",
                kcal: 150,
                preparingTimeMinutes: 30,
              );
            }),
      ),
    );
  }
}
