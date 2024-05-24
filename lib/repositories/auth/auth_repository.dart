import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<bool> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<bool> signUpWithEmailAndPassowrd({
    required String email,
    required String password,
    required String username,
  });

  Future<UserCredential?> signInWithGoogle();

  Future<UserCredential?> signInWithFacebook();

  Future<UserCredential> signInWithApple();

  Future<bool> signOut();
}
