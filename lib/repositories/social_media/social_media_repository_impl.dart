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
      // DocumentReference postRef = FirebaseFirestore.instance
      //     .collection("publicaciones")
      //     .doc(response.id);
      // await postRef.collection("comentarios").doc("placeholder").set({
      //   'content':
      //       'Este es un comentario de marcador de posición y se puede eliminar.',
      //   'authorId': 'system',
      //   'createdAt': DateTime.now(),
      // });
      // await Future.delayed(const Duration(seconds: 1));
      // await postRef.collection("comentarios").doc("placeholder").delete();
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
}
