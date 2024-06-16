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
    required String username,
    required double weight,
    required double height,
    required String physicalLimitatioons,
    required String foodRestrictions,
    required String profilePictureUrl,
    required String goal,
    required String uid,
  });

  Future<String> updateProfileImage(XFile imagePath);
}
