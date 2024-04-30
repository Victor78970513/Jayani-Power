import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
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
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
