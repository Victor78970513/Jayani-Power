import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_exercise_bloc/custom_exercise_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/week/week_cubit.dart';
import 'package:jayani_power/features/custom_plans/widgets/exercise_card.dart';
import 'package:jayani_power/models/exercise_firebase_model.dart';
import 'package:animate_do/animate_do.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SuccessCustomExerciseWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const SuccessCustomExerciseWidget({super.key, required this.onPressed});

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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hubo un error buscando tu dieta",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: onPressed,
                    child: const Text("BUSCAR SI TIENES ALGUNA DIETA"),
                  )
                ],
              ),
            );
          }
          final documentSnapshot = snapshot.data!.docs.first;
          final Map<String, dynamic> data = documentSnapshot.data();
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
                        child: Row(
                          children: [
                            Text(
                              "DURACION: ${workOutPlan[weekCubit].duration}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  context.read<CustomExerciseBloc>().add(
                                      OnDeleteUserRoutine(
                                          snapshot.data!.docs.first.id));
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color(0xffFF004D),
                                  size: 40,
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                              workOutPlan[weekCubit].exercises.length + 1,
                          itemBuilder: (context, index) {
                            if (index ==
                                workOutPlan[weekCubit].exercises.length) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Powered by ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(width: 5),
                                    SvgPicture.asset(
                                      "assets/icons/jayani_logo.svg",
                                      width: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    Image.asset(
                                      "assets/icons/gpt_logo.png",
                                      width: 40,
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              final exercise =
                                  workOutPlan[weekCubit].exercises[index];
                              return ExerciseCard(
                                exercise: exercise,
                                group: workOutPlan[weekCubit].group,
                              );
                            }
                          },
                        ),
                      ),
                      Container(height: 80)
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
