import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jayani_power/features/social_media/widgets/coment_section.dart';

class PostCard extends StatelessWidget {
  final QueryDocumentSnapshot post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(post['content']),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: FadeInImage(
                placeholder: const AssetImage("assets/loaders/gym_loading.gif"),
                image: NetworkImage(post["post_image"]),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/loaders/gym_loading.gif",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(FontAwesomeIcons.heart, size: 30),
                  const SizedBox(width: 5),
                  Text('${post['likes']}'),
                  const SizedBox(width: 20),
                  const Icon(FontAwesomeIcons.commentDots, size: 30),
                  const SizedBox(width: 5),
                  Text('${post['likes']}'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommentsSection(postId: post.id),
            ),
          ],
        ),
      ),
    );
  }
}
