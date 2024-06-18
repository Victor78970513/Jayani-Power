part of 'custom_diet_bloc_bloc.dart';

@immutable
sealed class CustomDietEvent {}

final class OnGetCustomDietEvent extends CustomDietEvent {
  final UserModel user;

  OnGetCustomDietEvent({required this.user});
}

final class OnCheckUserDiet extends CustomDietEvent {}

final class OnDeleteUserDiet extends CustomDietEvent {
  final String dietId;

  OnDeleteUserDiet(this.dietId);
}
