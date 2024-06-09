import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayani_power/models/user_model.dart';
import 'package:jayani_power/repositories/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  FirebaseFirestore usersDb = FirebaseFirestore.instance;
  @override
  Future<bool> createUser({
    required String uid,
    required String email,
    required String username,
    required DateTime createdAt,
    required DateTime updateAt,
  }) async {
    CollectionReference users = usersDb.collection("users");
    DocumentSnapshot userDoc = await users.doc(uid).get();
    try {
      if (userDoc.exists) {
        return true;
      } else {
        await users.doc(uid).set({
          "uid": uid,
          "email": email,
          "username": username,
          "profilePictureUrl": "",
          "createdAt": createdAt,
          "updateAt": updateAt,
          "publicProfile": true,
          "weight": 1,
          "height": 1,
          "age": 16,
          "memberType": "estandar"
        });
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<UserModel?> getUserData(String uid) async {
    CollectionReference users = usersDb.collection("users");
    try {
      final response = await users.doc(uid).get();
      if (response.exists) {
        log(response.data().toString());
        return UserModel.fromMap(response.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<bool> updateUserData({
    required String uid,
    required String email,
    required String username,
    required String profilePictureUrl,
    required bool publicProfile,
    required double weight,
    required double height,
    required int age,
  }) async {
    try {
      Map<String, dynamic> userData = {
        'email': email,
        'username': username,
        'profilePictureUrl': profilePictureUrl,
        'publicProfile': publicProfile,
        'weight': weight,
        'height': height,
        'age': age,
        'updateAt': DateTime.now(),
      };
      await usersDb.collection("users").doc(uid).update(userData);
      return true;
    } on FirebaseException catch (e) {
      log(e.message.toString());
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<String> updateProfileImage(XFile imagePath) async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child("profile-images");
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    await referenceImageToUpload.putFile(File(imagePath.path));
    final imageUrl = await referenceImageToUpload.getDownloadURL();
    return imageUrl;
  }
}
