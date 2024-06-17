// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:jayani_power/models/post_firebase_model.dart';

class CommentCard extends StatelessWidget {
  final CommentFirebaseModel comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: comment.profilePictureUrl.isEmpty ||
                    comment.profilePictureUrl == null
                ? Colors.grey
                : Colors.transparent,
            child: comment.profilePictureUrl.isEmpty ||
                    comment.profilePictureUrl == null
                ? const Icon(Icons.person, size: 35)
                : ClipOval(
                    child: FadeInImage(
                      placeholder:
                          const AssetImage("assets/loaders/gym_loading.gif"),
                      image: NetworkImage(comment.profilePictureUrl),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/loaders/gym_loading.gif",
                          fit: BoxFit.cover,
                          width: 120.0,
                          height: 120.0,
                        );
                      },
                      fit: BoxFit.cover,
                      width: 120.0,
                      height: 120.0,
                    ),
                  ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff2A3138),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Text(
                            comment.userName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          comment.createdAt.toString().substring(0, 10),
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      comment.content,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
