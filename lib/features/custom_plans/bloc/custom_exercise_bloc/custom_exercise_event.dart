part of 'custom_exercise_bloc.dart';

@immutable
sealed class CustomExerciseEvent {}

final class OnGenerateCustomExercisePlanEvent extends CustomExerciseEvent {}

final class OnCheckUserRoutine extends CustomExerciseEvent {}
