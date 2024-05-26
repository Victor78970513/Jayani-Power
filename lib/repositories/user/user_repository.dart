import 'package:image_picker/image_picker.dart';
import 'package:jayani_power/models/user_model.dart';

abstract class UserRepository {
  Future<bool> createUser({
    required String uid,
    required String email,
    required String username,
    required DateTime createdAt,
    required DateTime updateAt,
  });
  Future<UserModel?> getUserData(String uid);

  Future<bool> updateUserData({
    required String uid,
    required String email,
    required String username,
    required String profilePictureUrl,
    required bool publicProfile,
    required double weight,
    required double height,
    required int age,
  });

  Future<String> updateProfileImage(XFile imagePath);
}
