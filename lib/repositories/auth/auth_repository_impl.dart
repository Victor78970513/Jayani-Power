import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jayani_power/repositories/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> signUpWithEmailAndPassowrd(
      {required String email,
      required String password,
      required String username}) async {
    try {
      await authdb.createUserWithEmailAndPassword(
          email: email, password: password);
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.add({
        'username': username,
        'email': email,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      await FacebookAuth.instance.logOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Realizar el inicio de sesión con Facebook
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Verificar si el inicio de sesión fue exitoso
      if (loginResult.status == LoginStatus.success) {
        // Obtener las credenciales de autenticación de Facebook
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        // Iniciar sesión en Firebase con las credenciales de Facebook
        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        // Devolver el resultado del inicio de sesión
        return userCredential;
      } else {
        // Manejar el caso en el que el inicio de sesión con Facebook no fue exitoso
        print("El inicio de sesión con Facebook no fue exitoso.");
        return null;
      }
    } catch (e) {
      // Manejar cualquier error que pueda ocurrir durante el inicio de sesión
      print("Error durante el inicio de sesión con Facebook: $e");
      return null;
    }
  }

  @override
  Future<UserCredential> signInWithTwitter() {
    // TODO: implement signInWithTwitter
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }
}

String generateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}
