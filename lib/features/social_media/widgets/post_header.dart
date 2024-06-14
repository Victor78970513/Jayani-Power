import 'package:flutter/material.dart';
import 'package:jayani_power/models/post_firebase_model.dart';

class PostHeader extends StatelessWidget {
  final PostFirebaseModel post;
  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: FadeInImage(
            placeholder: const AssetImage("assets/loaders/gym_loading.gif"),
            image: NetworkImage(post.profilePictureUrl),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/loaders/gym_loading.gif",
                fit: BoxFit.cover,
                width: 40.0,
                height: 40.0,
              );
            },
            fit: BoxFit.cover,
            width: 40.0,
            height: 40.0,
          ),
        ),
      ),
      title: Text(
        post.userName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 3.0,
        ),
      ),
      trailing: Text(
        (post.createdAt).toString().substring(0, 10),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        post.title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
