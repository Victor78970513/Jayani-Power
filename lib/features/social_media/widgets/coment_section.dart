import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';
import 'package:jayani_power/features/social_media/bloc/cubit/show_comments_cubit.dart';
import 'package:jayani_power/features/social_media/widgets/coment_card.dart';
import 'package:jayani_power/models/post_firebase_model.dart';
import 'package:jayani_power/repositories/social_media/social_media_repository_impl.dart';

class CommentsSection extends StatefulWidget {
  final String postId;

  const CommentsSection({super.key, required this.postId});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  final TextEditingController commentCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = context.watch<ProfileBloc>().userModel;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('publicaciones')
          .doc(widget.postId)
          .collection('comentarios')
          .orderBy("createdAt", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffCEB2C1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: commentCtrl,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Introduce tu comentario",
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        context.read<ShowCommentsCubit>().showComments();
                        await SocialMediaRepositoryImpl().createComment(
                          contenido: commentCtrl.text,
                          userName: user?.username ?? "Unknow",
                          profilePictureUrl: user?.profilePictureUrl ?? "",
                          postId: widget.postId,
                        );
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Color(0xffFF004D),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text('No hay comentarios.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  )),
            ],
          );
        }
        final List<CommentFirebaseModel> comments = [];
        for (var doc in snapshot.data!.docs) {
          final data = doc.data() as Map<String, dynamic>;
          comments.add(CommentFirebaseModel.fromJson(data));
        }
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffCEB2C1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: commentCtrl,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Introduce tu comentario",
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      context.read<ShowCommentsCubit>().showComments();
                      await SocialMediaRepositoryImpl().createComment(
                        contenido: commentCtrl.text,
                        userName: user?.username ?? "Unknow",
                        profilePictureUrl: user?.profilePictureUrl ?? "",
                        postId: widget.postId,
                      );
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Color(0xffFF004D),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: List.generate(comments.length, (index) {
                final comment = comments[index];
                return CommentCard(comment: comment);
              }),
            ),
          ],
        );
      },
    );
  }
}
