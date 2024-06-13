import 'package:cloud_firestore/cloud_firestore.dart';

class PostFirebaseModel {
  final String id;
  final String profilePictureUrl;
  final DateTime createdAt;
  final String postImage;
  final String userName;
  final String title;
  final String content;
  final int likes;
  final int comments;

  PostFirebaseModel({
    required this.id,
    required this.profilePictureUrl,
    required this.createdAt,
    required this.postImage,
    required this.userName,
    required this.title,
    required this.content,
    required this.likes,
    required this.comments,
  });

  factory PostFirebaseModel.fromJson(Map<String, dynamic> json, String id) =>
      PostFirebaseModel(
        id: id,
        profilePictureUrl: json["profilePictureUrl"],
        createdAt: (json["createdAt"] as Timestamp).toDate(),
        postImage: json["post_image"],
        userName: json["user_name"],
        title: json["title"],
        content: json["content"],
        likes: json["likes"],
        comments: json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "profilePictureUrl": profilePictureUrl,
        "createdAt": createdAt,
        "post_image": postImage,
        "user_name": userName,
        "title": title,
        "content": content,
        "likes": likes,
      };
}

//!? THIS IS A SUBCOLLECIION FROM POSTS IN FIREBASE

// To parse this JSON data, do
//
//     final commentFirebaseModel = commentFirebaseModelFromJson(jsonString);

class CommentFirebaseModel {
  final String profilePictureUrl;
  final DateTime createdAt;
  final String userName;
  final String content;

  CommentFirebaseModel({
    required this.profilePictureUrl,
    required this.createdAt,
    required this.userName,
    required this.content,
  });

  factory CommentFirebaseModel.fromJson(Map<String, dynamic> json) =>
      CommentFirebaseModel(
        profilePictureUrl: json["profilePictureUrl"],
        createdAt: (json["createdAt"] as Timestamp).toDate(),
        userName: json["user_name"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "profilePictureUrl": profilePictureUrl,
        "createdAt": createdAt,
        "user_name": userName,
        "content": content,
      };
}
