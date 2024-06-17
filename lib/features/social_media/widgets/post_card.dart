import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';
import 'package:jayani_power/features/social_media/bloc/cubit/show_comments_cubit.dart';
import 'package:jayani_power/features/social_media/widgets/coment_section.dart';
import 'package:jayani_power/features/social_media/widgets/post_card_button.dart';
import 'package:jayani_power/features/social_media/widgets/post_content.dart';
import 'package:jayani_power/features/social_media/widgets/post_header.dart';
import 'package:jayani_power/models/post_firebase_model.dart';
import 'package:jayani_power/repositories/social_media/social_media_repository_impl.dart';

class PostCard extends StatelessWidget {
  final PostFirebaseModel post;
  final bool isLiked;

  const PostCard({
    super.key,
    required this.post,
    required this.isLiked,
  });

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
                  PostActions(
                    post: post,
                    isLiked: isLiked,
                  ),
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
  final bool isLiked;
  const PostActions({
    super.key,
    required this.post,
    required this.isLiked,
  });

  final PostFirebaseModel post;

  @override
  Widget build(BuildContext context) {
    final userId = Preferences().userUUID;

    return Column(
      children: [
        Row(children: [
          PostCardText(titleOnTap: () {}, title: "${post.likes} reaciones"),
          PostCardText(
              titleOnTap: () {
                context.read<ShowCommentsCubit>().showComments();
              },
              title: "${post.comments} Comentarios"),
        ]),
        const Divider(),
        Row(
          children: [
            PostCardButton(
                iconData: isLiked
                    ? const Icon(
                        FontAwesomeIcons.heartCircleXmark,
                        size: 30,
                        color: Colors.red,
                      )
                    : const Icon(
                        FontAwesomeIcons.heart,
                        size: 30,
                        color: Colors.white,
                      ),
                iconPressed: () {
                  if (isLiked) {
                    SocialMediaRepositoryImpl()
                        .deleteReaction(userId: userId, postId: post.id);
                  } else {
                    SocialMediaRepositoryImpl()
                        .reactToPost(userId: userId, postId: post.id);
                  }
                },
                iconText: "Reacionar"),
            PostCardButton(
                iconData: const Icon(FontAwesomeIcons.commentDots,
                    size: 30, color: Colors.white),
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
