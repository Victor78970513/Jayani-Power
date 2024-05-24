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
    final auth = FacebookAuth.instance;
    final rawNonce = _generateNonce();
    final nonce = _sha256ofString(rawNonce);
    final result = await auth.login(nonce: nonce);
    final accessToken = result.accessToken;
    if (accessToken == null) {
      return null;
    }
    if (accessToken.type == AccessTokenType.limited) {
      final oauthCredential = OAuthProvider("facebook.com").credential(
        idToken: accessToken.tokenString,
        rawNonce: rawNonce,
      );
      final user =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      print(user);
      return user;
    } else {
      final oauthCredential =
          FacebookAuthProvider.credential(accessToken.tokenString);
      final user =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      print(user);
      return user;
    }
  }

  @override
  Future<UserCredential> signInWithApple() async {
    final rawNonce = _generateNonce();
    final nonce = _sha256ofString(rawNonce);
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

String _generateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

String _sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}
