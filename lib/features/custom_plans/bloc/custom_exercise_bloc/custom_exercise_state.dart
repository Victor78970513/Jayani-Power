part of 'custom_exercise_bloc.dart';

@immutable
sealed class CustomExerciseState {}

final class CustomPlansInitial extends CustomExerciseState {}

final class CustomExerciseLoadingState extends CustomExerciseState {}

final class CustomExerciseSuccessState extends CustomExerciseState {}

final class CustomExerciseErrorState extends CustomExerciseState {}
