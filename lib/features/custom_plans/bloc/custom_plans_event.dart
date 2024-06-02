part of 'custom_plans_bloc.dart';

@immutable
sealed class CustomPlansEvent {}

final class OnGenerateCustomExercisePlanEvent extends CustomPlansEvent {}

final class OnGenerateCustomDietPlanEvent extends CustomPlansEvent {}
