import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jayani_power/firebase_options.dart';
import 'package:jayani_power/repositories/auth/auth_repository_impl.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

// Mock FirebaseAuth class
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  test("Should return null on login with invalid credentials", () async {
    final mockAuth = MockFirebaseAuth();
    when(mockAuth.signInWithEmailAndPassword(
            email: "non_existent@email.com", password: "wrong_password"))
        .thenThrow(Exception('Invalid email or password'));
    final authRepository = AuthRepositoryImpl(mockAuth);
    final result = await authRepository.loginWithEmailAndPassword(
        email: "non_existent@email.com", password: "wrong_password");
    expect(result, isNull);
  });

  test("Should return null on login with invalid credentials", () async {
    final mockAuth = MockFirebaseAuth();
    when(mockAuth.signInWithEmailAndPassword(
            email: "caca@gmail.com", password: "123456"))
        .thenThrow(Exception('Invalid email or password'));
    final authRepository = AuthRepositoryImpl(mockAuth);
    final result = await authRepository.loginWithEmailAndPassword(
        email: "caca@gmail.com", password: "123456");
    expect(result, null);
  });
}
