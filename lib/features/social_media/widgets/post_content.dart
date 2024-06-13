import 'package:flutter/material.dart';
import 'package:jayani_power/models/post_firebase_model.dart';

class PostContent extends StatelessWidget {
  final PostFirebaseModel post;
  const PostContent({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                child: SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: FadeInImage(
                    placeholder:
                        const AssetImage("assets/loaders/gym_loading.gif"),
                    image: NetworkImage(post.postImage),
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
    );
  }
}
