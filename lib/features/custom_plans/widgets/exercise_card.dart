import 'package:flutter/material.dart';
import 'package:jayani_power/models/exercise_firebase_model.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final String group;

  const ExerciseCard({
    super.key,
    required this.exercise,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff43444A),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.8,
                    child: Text(
                      exercise.sett,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  // SvgPicture.asset("assets/icons/jayani_logo.svg", width: 20)
                ],
              ),
              const Divider(color: Color(0xffFF004D)),
              Text(
                exercise.description,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(exercise.series,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  Container(
                    width: 2,
                    height: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    exercise.reps,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 2,
                    height: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      group,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
