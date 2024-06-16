import 'package:image_picker/image_picker.dart';

abstract class SocialMediaRepository {
  Future<bool> createPost({
    required String content,
    required DateTime createdAt,
    required String postImage,
    required String profilePictureUrl,
    required String title,
    required String userName,
  });

  Future<String> sendPostImageToFIrebase(XFile pathImage);
}
