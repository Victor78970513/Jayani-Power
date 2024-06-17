import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayani_power/repositories/social_media/social_media_repository.dart';

class SocialMediaRepositoryImpl extends SocialMediaRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<bool> createPost(
      {required String content,
      required DateTime createdAt,
      required String postImage,
      required String profilePictureUrl,
      required String title,
      required String userName}) async {
    final CollectionReference collection =
        firestore.collection("publicaciones");
    try {
      await collection.add({
        "comments": 0,
        "content": content,
        "createdAt": createdAt,
        "likes": 0,
        "post_image": postImage,
        "profilePictureUrl": profilePictureUrl,
        "title": title,
        "user_name": userName,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String> sendPostImageToFIrebase(XFile pathImage) async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child("profile-images");
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    await referenceImageToUpload.putFile(File(pathImage.path));
    final imageUrl = await referenceImageToUpload.getDownloadURL();
    return imageUrl;
  }

  @override
  Future<void> reactToPost(
      {required String userId, required String postId}) async {
    final CollectionReference collection =
        firestore.collection("publicaciones");

    await collection.doc(postId).update({
      "likes": FieldValue.increment(1),
      "likedBy": FieldValue.arrayUnion([userId])
    });
  }

  @override
  Future<void> deleteReaction(
      {required String userId, required String postId}) async {
    final CollectionReference collection =
        firestore.collection("publicaciones");

    await collection.doc(postId).update({
      "likes": FieldValue.increment(-1),
      "likedBy": FieldValue.arrayRemove([userId])
    });
  }

  @override
  Future<void> createComment({
    required String contenido,
    required String userName,
    required String profilePictureUrl,
    required String postId,
  }) async {
    final CollectionReference collection =
        firestore.collection("publicaciones");
    try {
      await collection.doc(postId).collection("comentarios").add({
        "content": contenido,
        "createdAt": DateTime.now(),
        "profilePictureUrl": profilePictureUrl,
        "userName": userName,
      });

      await collection.doc(postId).update({
        "comments": FieldValue.increment(1),
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
