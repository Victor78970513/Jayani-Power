part of 'custom_plans_bloc.dart';

@immutable
sealed class CustomPlansState {}

final class CustomPlansInitial extends CustomPlansState {}

final class CustomPlansLoadingState extends CustomPlansState {}

class CustomPlansSuccessState extends CustomPlansState {
  final List<CustomExercisesModel> myRoutine;

  CustomPlansSuccessState({required this.myRoutine});

  CustomPlansSuccessState copyWith({
    List<CustomExercisesModel>? myRoutine,
  }) =>
      CustomPlansSuccessState(
        myRoutine: myRoutine ?? this.myRoutine,
      );
}

final class CustomPlansErrorState extends CustomPlansState {}
