part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final String uid;
  final bool isNewUser;
  AuthSuccessState(this.uid, this.isNewUser);
}

final class AuthSignInFailureState extends AuthState {
  final String message;

  AuthSignInFailureState(this.message);
}

final class AuthSignUpFailureState extends AuthState {
  final String message;

  AuthSignUpFailureState(this.message);
}
