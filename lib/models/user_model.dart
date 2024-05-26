import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String username;
  final String profilePictureUrl;
  final DateTime createdAt;
  final DateTime updateAt;
  final bool publicProfile;
  final String weight;
  final String height;
  final String age;
  final String memberType;

  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    required this.profilePictureUrl,
    required this.createdAt,
    required this.updateAt,
    required this.publicProfile,
    required this.weight,
    required this.height,
    required this.age,
    required this.memberType,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      profilePictureUrl: map['profilePictureUrl'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updateAt: (map['updateAt'] as Timestamp).toDate(),
      publicProfile: map['publicProfile'] ?? false,
      weight: map['weight'].toString(),
      height: map['height'].toString(),
      age: map['age'].toString(),
      memberType: map['memberType'],
    );
  }
}
