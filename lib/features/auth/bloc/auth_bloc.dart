import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/repositories/auth/auth_repository.dart';
import 'package:jayani_power/repositories/auth/auth_repository_impl.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthRepository _authRepository;
  AuthBloc() : super(AuthInitial()) {
    _authRepository = AuthRepositoryImpl();

    on<OnUserSignInEvent>(_onUserSignIn);
    on<OnUserGoogleSignInEvent>(_onUserGoogleSignInEvent);
    on<OnUserSignOut>(_onUserSignOut);
  }

  FutureOr<void> _onUserSignIn(
      OnUserSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    final response = await _authRepository.loginWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    if (response) {
      emit(AuthSuccessState());
    } else {
      emit(AuthFailureState());
    }
  }

  FutureOr<void> _onUserGoogleSignInEvent(
      OnUserGoogleSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    // await Future.delayed(const Duration(seconds: 1));
    final response = await _authRepository.signInWithGoogle();
    if (response.user != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthFailureState());
    }
  }

  FutureOr<void> _onUserSignOut(
      OnUserSignOut event, Emitter<AuthState> emit) async {
    final response = await _authRepository.signOut();
    if (response) {
      emit(AuthInitial());
    } else {
      emit(AuthFailureState());
    }
  }
}
