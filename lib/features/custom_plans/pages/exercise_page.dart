import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_exercise_bloc/custom_exercise_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/week/week_cubit.dart';
import 'package:jayani_power/features/custom_plans/widgets/exercise_card.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    final weekCubit = context.watch<WeekCubit>().state;
    return BlocBuilder<CustomExerciseBloc, CustomExerciseState>(
      builder: (context, state) {
        if (state is CustomExerciseSuccessState) {
          return Scaffold(
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: state.myRoutine[weekCubit].exercises.length,
                  itemBuilder: (context, index) {
                    final exercise =
                        state.myRoutine[weekCubit].exercises[index];
                    return ExerciseCard(
                      exercise: exercise.name,
                      series: exercise.series,
                      repeticiones: exercise.repes,
                      level: "Beginner",
                    );
                  }),
            ),
          );
        } else if (state is CustomExerciseLoadingState) {
          return const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "GENERANDO RUTINA.......",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              SizedBox(height: 15),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ));
        } else if (state is CustomExerciseErrorState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "OCURRIO UN ERROR INTENTALO DE NUEVO",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<CustomExerciseBloc>()
                        .add(OnGenerateCustomExercisePlanEvent());
                  },
                  child: const Text("GENERAR RUTINA PERSONALIZADA"))
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "POR EL MOMENTO NO TIENES RUTINAS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<CustomExerciseBloc>()
                        .add(OnGenerateCustomExercisePlanEvent());
                  },
                  child: const Text("GENERAR RUTINA PERSONALIZADA"))
            ],
          );
        }
      },
    );
  }
}
