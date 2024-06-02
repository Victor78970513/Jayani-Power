import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String exercise;
  final String series;
  final String repeticiones;
  final String level;

  const ExerciseCard({
    super.key,
    required this.exercise,
    required this.series,
    required this.repeticiones,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffFDA3B5),
                borderRadius: BorderRadius.circular(20)),
            width: 90,
            child: Image.asset("assets/icons/google_icon.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise,
                    style: const TextStyle(color: Colors.black, fontSize: 20)),
                SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "$series series",
                        style: const TextStyle(color: Colors.black),
                      ),
                      const Text("|"),
                      Text("$repeticiones repeticiones")
                    ],
                  ),
                ),
                Text(level)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
