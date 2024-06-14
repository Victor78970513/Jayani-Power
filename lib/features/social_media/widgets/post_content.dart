import 'package:flutter/material.dart';
import 'package:jayani_power/models/post_firebase_model.dart';

class PostContent extends StatelessWidget {
  final PostFirebaseModel post;
  const PostContent({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              post.content,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.5,
              ),
            ),
          ),
          post.postImage.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    color: Colors.red,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: FadeInImage(
                      placeholder:
                          const AssetImage("assets/loaders/gym_loading.gif"),
                      image: NetworkImage(post.postImage),
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/loaders/gym_loading.gif",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
