import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_plans_bloc.dart';
import 'package:jayani_power/features/custom_plans/widgets/exercise_card.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomPlansBloc, CustomPlansState>(
      builder: (context, state) {
        if (state is CustomPlansSuccessState) {
          return Scaffold(
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ListView.builder(
<<<<<<< HEAD
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
=======
                  itemCount: state.myRoutine[0].exercises.length,
                  itemBuilder: (context, index) {
                    final exercise = state.myRoutine[0].exercises[index];
                    return ExerciseCard(
                      exercise: exercise.name,
                      series: exercise.series,
                      repeticiones: exercise.repes,
                      level: "Beginner",
                    );
                  }),
            ),
          );
        } else if (state is CustomPlansLoadingState) {
          return const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "GENERANDO RUTINA.......",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 15),
              CircularProgressIndicator(),
            ],
          ));
        } else if (state is CustomPlansErrorState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "OCURRIO UN ERROR INTENTALO DE NUEVO",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<CustomPlansBloc>()
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<CustomPlansBloc>()
                        .add(OnGenerateCustomExercisePlanEvent());
                  },
                  child: const Text("GENERAR RUTINA PERSONALIZADA"))
            ],
          );
        }
      },
>>>>>>> gpt implementation for exercises in test
    );
  }
}
