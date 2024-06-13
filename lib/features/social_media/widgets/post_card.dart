import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jayani_power/features/social_media/bloc/cubit/show_comments_cubit.dart';
import 'package:jayani_power/features/social_media/widgets/coment_section.dart';
import 'package:jayani_power/features/social_media/widgets/post_card_button.dart';
import 'package:jayani_power/features/social_media/widgets/post_content.dart';
import 'package:jayani_power/features/social_media/widgets/post_header.dart';
import 'package:jayani_power/models/post_firebase_model.dart';

class PostCard extends StatelessWidget {
  final PostFirebaseModel post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowCommentsCubit(),
      child: BlocBuilder<ShowCommentsCubit, bool>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              margin: const EdgeInsets.all(10),
              color: const Color(0xff424449),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostHeader(post: post),
                  PostContent(post: post),
                  PostActions(post: post),
                  const SizedBox(height: 5),
                  if (state)
                    FadeIn(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CommentsSection(postId: post.id),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PostActions extends StatelessWidget {
  const PostActions({
    super.key,
    required this.post,
  });

  final PostFirebaseModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          PostCardText(titleOnTap: () {}, title: "${post.likes} reaciones"),
          PostCardText(
              titleOnTap: () {}, title: "${post.comments} Comentarios"),
        ]),
        const Divider(),
        // const Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 10),
        //   child: Divider(color: Color(0xffFF004D)),
        // ),
        Row(
          children: [
            PostCardButton(
                iconData: FontAwesomeIcons.heart,
                iconPressed: () {},
                iconText: "Reacionar"),
            PostCardButton(
                iconData: FontAwesomeIcons.commentDots,
                iconPressed: () {
                  context.read<ShowCommentsCubit>().showComments();
                },
                iconText: "Comentar"),
          ],
        ),
      ],
    );
  }
}
