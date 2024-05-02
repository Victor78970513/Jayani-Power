part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class OnUserSignInEvent extends AuthEvent {
  final String email;
  final String password;

  OnUserSignInEvent({required this.email, required this.password});
}

final class OnUserSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;

  OnUserSignUpEvent(
      {required this.email, required this.password, required this.username});
}

final class OnUserGoogleSignInEvent extends AuthEvent {}

final class OnUserFacebookSignInEvent extends AuthEvent {}

final class OnUserAppleSignInEvent extends AuthEvent {}

final class OnUserSignOut extends AuthEvent {}
