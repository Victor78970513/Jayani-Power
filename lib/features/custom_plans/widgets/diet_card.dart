import 'package:flutter/material.dart';

class DietCard extends StatelessWidget {
  final String plate;
  final int kcal;
  final int preparingTimeMinutes;
  const DietCard(
      {super.key,
      required this.plate,
      required this.kcal,
      required this.preparingTimeMinutes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            plate,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$kcal kcal"),
              SizedBox(
                width: 5,
              ),
              Text("$preparingTimeMinutes minutos")
            ],
          )
        ],
      ),
    );
  }
}
