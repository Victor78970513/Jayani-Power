import 'dart:developer';

import 'package:jayani_power/repositories/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  FirebaseAuth authdb = FirebaseAuth.instance;

  @override
  Future<bool> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await authdb.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (response.user == null) return false;
      log("TODO SALIO BIEN CHOQUITO");
      return true;
    } catch (e) {
      log("ERRRRRRRRRORRRRRR");
      return false;
    }
  }

  @override
  Future<bool> signUpWithEmailAndPassowrd() {
    // TODO: implement signUpWithEmailAndPassowrd
    throw UnimplementedError();
  }
}
