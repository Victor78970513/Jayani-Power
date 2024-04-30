part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class OnUserSignInEvent extends AuthEvent {
  final String email;
  final String password;

  OnUserSignInEvent({required this.email, required this.password});
}

final class OnUserGoogleSignInEvent extends AuthEvent {}

final class OnUserSignOut extends AuthEvent {}
