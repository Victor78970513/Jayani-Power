import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential?> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserCredential?> signUpWithEmailAndPassowrd({
    required String email,
    required String password,
    required String username,
  });

  Future<UserCredential?> signInWithGoogle();

  Future<UserCredential?> signInWithFacebook();

  Future<UserCredential?> signInWithApple();

  Future<bool> signOut();
}
