import 'package:flutter/material.dart';
import 'package:jayani_power/features/custom_plans/widgets/diet_card.dart';

class DietsPage extends StatefulWidget {
  const DietsPage({super.key});

  @override
  State<DietsPage> createState() => _DietsPageState();
}

class _DietsPageState extends State<DietsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const DietCard(
              plate: "Ensalada Cesar",
              kcal: 150,
              preparingTimeMinutes: 30,
            );
          }),
    ));
  }
}
