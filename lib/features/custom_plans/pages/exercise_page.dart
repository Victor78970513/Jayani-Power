import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_exercise_bloc/custom_exercise_bloc.dart';
import 'package:jayani_power/features/custom_plans/widgets/state_exercies_widgets.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  void initState() {
    super.initState();
  }

  void getGptRoutine() => context
      .read<CustomExerciseBloc>()
      .add(OnGenerateCustomExercisePlanEvent());
  void checkRoutine() =>
      context.read<CustomExerciseBloc>().add(OnCheckUserRoutine());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomExerciseBloc, CustomExerciseState>(
      builder: (context, state) {
        switch (state) {
          case CustomExerciseSuccessState():
            return SuccessCustomExerciseWidget(onPressed: checkRoutine);
          case CustomExerciseLoadingState():
            return const LoadingCustomExerciseWidget();

          case CustomExerciseErrorState():
            return ErrorCustomExerciseWidget(onPressed: getGptRoutine);

          default:
            return InitialCustomExerciseWidget(onPressed: getGptRoutine);
        }
      },
    );
  }
}
