import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';
import 'package:jayani_power/repositories/auth/auth_repository.dart';
import 'package:jayani_power/repositories/auth/auth_repository_impl.dart';
import 'package:jayani_power/repositories/user/user_repository.dart';
import 'package:jayani_power/repositories/user/user_repository_impl.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthRepository _authRepository;
  late UserRepository _userRepository;
  AuthBloc() : super(AuthInitial()) {
    _authRepository = AuthRepositoryImpl(FirebaseAuth.instance);
    _userRepository = UserRepositoryImpl();

    on<OnUserSignUpEvent>(_onUserSignUpEvent);
    on<OnUserSignInEvent>(_onUserSignIn);
    on<OnUserGoogleSignInEvent>(_onUserGoogleSignInEvent);
    on<OnUserFacebookSignInEvent>(_onUserFacebookSignInEvent);
    on<OnUserSignOut>(_onUserSignOut);
    on<IsUserLoggedIn>(_isUserLoggedIn);
  }

  FutureOr<void> _isUserLoggedIn(
      IsUserLoggedIn event, Emitter<AuthState> emit) async {
    final response = await _authRepository.getCurrentUser();
    if (response != null) {
      final created = await _userRepository.createUser(
        email: response.email ?? "sin correo",
        username: response.displayName ?? "Sin nombre",
        uid: response.uid,
        createdAt: DateTime.now(),
        updateAt: DateTime.now(),
      );
      if (created) {
        Preferences().userUUID = response.uid;
        emit(AuthSuccessState(response.uid));
      } else {
        emit(AuthInitial());
      }
    } else {
      emit(AuthInitial());
    }
  }

  FutureOr<void> _onUserSignIn(
      OnUserSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final response = await _authRepository.loginWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    if (response != null) {
      final created = await _userRepository.createUser(
        email: response.user?.email ?? "sin correo",
        username: response.user?.displayName ?? "Sin nombre",
        uid: response.user!.uid,
        createdAt: DateTime.now(),
        updateAt: DateTime.now(),
      );
      if (created) {
        Preferences().userUUID = response.user!.uid;
        emit(AuthSuccessState(response.user!.uid));
      } else {
        emit(AuthSignUpFailureState("Error al crear cuenta"));
      }
    } else {
      emit(AuthSignInFailureState("Error al Iniciar Sesion"));
    }
  }

  FutureOr<void> _onUserSignOut(
      OnUserSignOut event, Emitter<AuthState> emit) async {
    final response = await _authRepository.signOut();
    if (response) {
      emit(AuthInitial());
    } else {
      emit(AuthSignInFailureState("Error al cerrar sesion"));
    }
  }

  FutureOr<void> _onUserGoogleSignInEvent(
      OnUserGoogleSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final response = await _authRepository.signInWithGoogle();
    if (response != null) {
      final created = await _userRepository.createUser(
        email: response.user?.email ?? "sin correo",
        username: response.user?.displayName ?? "sin nombre",
        uid: response.user!.uid,
        createdAt: DateTime.now(),
        updateAt: DateTime.now(),
      );
      if (created) {
        Preferences().userUUID = response.user!.uid;
        emit(AuthSuccessState(response.user!.uid));
      } else {
        emit(AuthSignUpFailureState("Error al crear cuenta"));
      }
    } else {
      emit(AuthSignInFailureState("Error al iniciar sesion con Google"));
    }
  }

  FutureOr<void> _onUserFacebookSignInEvent(
      OnUserFacebookSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final response = await _authRepository.signInWithFacebook();
    if (response != null) {
      final created = await _userRepository.createUser(
        email: response.user?.email ?? "sin correo",
        username: response.user?.displayName ?? "sin nombre",
        uid: response.user!.uid,
        createdAt: DateTime.now(),
        updateAt: DateTime.now(),
      );
      if (created) {
        Preferences().userUUID = response.user!.uid;
        emit(AuthSuccessState(response.user!.uid));
      } else {
        emit(AuthSignUpFailureState("Error al crear cuenta"));
      }
    } else {
      emit(AuthSignInFailureState("Error al iniciar sesion con Facebook"));
    }
  }

  FutureOr<void> _onUserSignUpEvent(
      OnUserSignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final response = await _authRepository.signUpWithEmailAndPassowrd(
      email: event.email,
      password: event.password,
      username: event.username,
    );
    if (response != null) {
      final created = await _userRepository.createUser(
        email: event.email,
        username: event.username,
        uid: response.user!.uid,
        createdAt: DateTime.now(),
        updateAt: DateTime.now(),
      );
      if (created) {
        Preferences().userUUID = response.user!.uid;
        emit(AuthSuccessState(response.user!.uid));
      } else {
        emit(AuthSignUpFailureState("Error al crear cuenta"));
      }
    } else {
      emit(AuthSignUpFailureState("Error al crear cuenta"));
    }
  }
}
