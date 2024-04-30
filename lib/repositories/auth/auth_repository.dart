import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<bool> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<bool> signUpWithEmailAndPassowrd();

  Future<UserCredential> signInWithGoogle();

  Future<bool> signOut();
}
