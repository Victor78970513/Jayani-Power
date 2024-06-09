import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';
import 'package:jayani_power/features/custom_plans/bloc/week/week_cubit.dart';
import 'package:jayani_power/features/custom_plans/widgets/exercise_card.dart';
import 'package:jayani_power/models/exercise_firebase_model.dart';
import 'package:animate_do/animate_do.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SuccessCustomExerciseWidget extends StatelessWidget {
  const SuccessCustomExerciseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weekCubit = context.watch<WeekCubit>().state;
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("rutinas-personalizadas")
            .where("uid", isEqualTo: Preferences().userUUID)
            .where("is_available", isEqualTo: true)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data found'));
          }
          final documentSnapshot = snapshot.data!.docs.first;
          final Map<String, dynamic> data = documentSnapshot.data();
          log(data.toString());
          final List<WorkoutDay> workOutPlan = [];
          data.forEach((key, value) {
            if (key.startsWith('day_')) {
              workOutPlan.add(WorkoutDay.fromJson(value));
            }
          });
          return workOutPlan[weekCubit].exercises.isNotEmpty
              ? FadeIn(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "DURACION DE LA RUTINA: ${workOutPlan[weekCubit].duration}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: workOutPlan[weekCubit].exercises.length,
                          itemBuilder: (context, index) {
                            final exercise =
                                workOutPlan[weekCubit].exercises[index];
                            return ExerciseCard(
                              exercise: exercise,
                              group: workOutPlan[weekCubit].group,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : FadeIn(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "FELICIDADES HOY DESCANSAS!!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Image.asset("assets/loaders/jayani_descanso.gif"),
                    ],
                  ),
                );
        });
  }
}

class LoadingCustomExerciseWidget extends StatelessWidget {
  const LoadingCustomExerciseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "GENERANDO RUTINA",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 15),
          LoadingAnimationWidget.inkDrop(color: Colors.white, size: 50)
        ],
      ),
    );
  }
}

class ErrorCustomExerciseWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const ErrorCustomExerciseWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "OCURRIO UN ERROR INTENTALO DE NUEVO",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text("GENERAR RUTINA PERSONALIZADA"),
        )
      ],
    );
  }
}

class InitialCustomExerciseWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const InitialCustomExerciseWidget({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "POR EL MOMENTO NO TIENES RUTINAS",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text("GENERAR RUTINA PERSONALIZADA"),
        )
      ],
    );
  }
}
