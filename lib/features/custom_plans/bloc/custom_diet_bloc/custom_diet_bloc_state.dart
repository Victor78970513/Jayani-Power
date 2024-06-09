part of 'custom_diet_bloc_bloc.dart';

@immutable
sealed class CustomDietState {}

final class CustomDietInitialState extends CustomDietState {}

final class CustomDietLoadingState extends CustomDietState {}

final class CustomDietSuccessState extends CustomDietState {}

final class CustomDietErrorState extends CustomDietState {}
