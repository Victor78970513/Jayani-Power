part of 'custom_diet_bloc_bloc.dart';

@immutable
sealed class CustomDietState {}

final class CustomDietBlocInitial extends CustomDietState {}

final class CustomDietLoadingState extends CustomDietState {}

final class CustomDietSuccessState extends CustomDietState {
  final List<CustomDietModel> myDiet;

  CustomDietSuccessState({required this.myDiet});
}

final class CustomPlansDietErrorState extends CustomDietState {}
