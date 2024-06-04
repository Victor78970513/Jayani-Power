part of 'custom_plans_bloc.dart';

@immutable
sealed class CustomPlansState {}

final class CustomPlansInitial extends CustomPlansState {}

final class CustomPlansExerciseLoadingState extends CustomPlansState {}

final class CustomPlansExerciseSuccessState extends CustomPlansState {
  final List<CustomExercisesModel> myRoutine;

  CustomPlansExerciseSuccessState({required this.myRoutine});

  CustomPlansExerciseSuccessState copyWith({
    List<CustomExercisesModel>? myRoutine,
  }) =>
      CustomPlansExerciseSuccessState(
        myRoutine: myRoutine ?? this.myRoutine,
      );
}

final class CustomPlansExerciseErrorState extends CustomPlansState {}

final class CustomPlansDietLoadingState extends CustomPlansState {}

final class CustomPlansDietSuccessState extends CustomPlansState {
  final List<CustomDietModel> myDiet;

  CustomPlansDietSuccessState({required this.myDiet});
}

final class CustomPlansDietErrorState extends CustomPlansState {}
