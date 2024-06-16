import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String uid;
  final String gender;
  final double weight;
  final double height;
  final String memberType;
  final String physicalLimitations;
  final String foodRestrictions;
  final String profilePictureUrl;
  final String goal;
  final int age;

  UserModel({
    required this.username,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.uid,
    required this.gender,
    required this.weight,
    required this.height,
    required this.memberType,
    required this.physicalLimitations,
    required this.foodRestrictions,
    required this.profilePictureUrl,
    required this.goal,
    required this.age,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map["username"],
      email: map["email"],
      createdAt: (map["createdAt"] as Timestamp).toDate(),
      updatedAt: (map["updatedAt"] as Timestamp).toDate(),
      uid: map["uid"],
      gender: map["gender"],
      weight: double.parse(map["weight"].toString()),
      height: (double.parse(map["height"].toString())),
      memberType: map["memberType"],
      physicalLimitations: map["physicalLimitations"],
      foodRestrictions: map["foodRestrictions"],
      profilePictureUrl: map["profilePictureUrl"],
      goal: map["goal"],
      age: map["age"],
    );
  }
}
