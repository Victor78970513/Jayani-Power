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
  Future<bool> isNewUser(String userId) async {
    CollectionReference users = usersDb.collection("users");
    final isNew = await users.doc(userId).get();
    if (isNew.exists) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<bool> createUser({
    required String uid,
    required String email,
    required String username,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) async {
    CollectionReference users = usersDb.collection("users");
    DocumentSnapshot userDoc = await users.doc(uid).get();
    try {
      if (userDoc.exists) {
        return true;
      } else {
        await users.doc(uid).set({
          "username": username,
          "email": email,
          "createdAt": createdAt,
          "updatedAt": updatedAt,
          "uid": uid,
          "gender": "",
          "weight": 1,
          "height": 1,
          "memberType": false,
          "physicalLimitations": "",
          "foodRestrictions": "",
          "profilePictureUrl": "",
          "goal": "",
          "age": 16,
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
      log("ESTE ES EL ERROR: $e");
      return null;
    }
  }

  @override
  Future<bool> updateUserData({
    required String username,
    required double weight,
    required double height,
    required String physicalLimitatioons,
    required String foodRestrictions,
    required String profilePictureUrl,
    required String goal,
    required String uid,
  }) async {
    try {
      Map<String, dynamic> userData = {
        'username': username,
        'weight': weight,
        'height': height,
        'physicalLimitations': physicalLimitatioons,
        'foodRestictions': foodRestrictions,
        'profilePictureUrl': profilePictureUrl,
        'goal': goal,
        'updateAt': DateTime.now(),
      };
      await usersDb.collection("users").doc(uid).update(userData);
      return true;
    } on FirebaseException catch (e) {
      log(e.message.toString());
      return false;
    } catch (e) {
      log("ERROR AL ACTUALIZAR DATOS: $e");
      return false;
    }
  }

  @override
  Future<bool> updateUserDataForFirstTime(
      {required String uid,
      required int age,
      required double weight,
      required double height,
      required String gender,
      required String physicalLimitations,
      required String foodRestrictions,
      required String goal}) async {
    try {
      Map<String, dynamic> userData = {
        'age': age,
        'weight': weight,
        'height': height,
        'gender': gender,
        'physicalLimitations': physicalLimitations,
        'foodRestrictions': foodRestrictions,
        'goal': goal,
        'updatedAt': DateTime.now(),
      };
      await usersDb.collection("users").doc(uid).update(userData);
      return true;
    } catch (e) {
      log("ERROR AL ACTUALIZAR DATOS POR PRIMERA VEZ: $e");
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

  @override
  Future<bool> changeToPremium(String uid) async {
    final CollectionReference collection = usersDb.collection("users");
    try {
      await collection.doc(uid).update({"memberType": true});
      return true;
    } catch (e) {
      return false;
    }
  }
}
