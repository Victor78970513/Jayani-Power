import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jayani_power/features/social_media/widgets/coment_section.dart';

class PostCard extends StatelessWidget {
  final QueryDocumentSnapshot post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   post['title'],
            //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: FadeInImage(
                      placeholder:
                          const AssetImage("assets/loaders/gym_loading.gif"),
                      image: NetworkImage(post["profilePictureUrl"]),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/loaders/gym_loading.gif",
                          fit: BoxFit.cover,
                          width: 120.0,
                          height: 120.0,
                        );
                      },
                      fit: BoxFit.cover,
                      width: 40.0,
                      height: 40.0,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    Text(post["user_name"]),
                    Text((post["createdAt"] as Timestamp)
                        .toDate()
                        .toString()
                        .substring(0, 10)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(post['content']),
            const SizedBox(height: 10),
            Text('Likes: ${post['likes']}'),
            const SizedBox(height: 10),
            CommentsSection(postId: post.id),
          ],
        ),
      ),
    );
  }
}
