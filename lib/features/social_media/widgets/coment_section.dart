import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jayani_power/features/social_media/widgets/coment_card.dart';

class CommentsSection extends StatelessWidget {
  final String postId;

  const CommentsSection({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('publicaciones')
          .doc(postId)
          .collection('comentarios')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text('No hay comentarios.');
        }

        return Column(
          children: snapshot.data!.docs.map((doc) {
            return CommentCard(comment: doc);
          }).toList(),
        );
      },
    );
  }
}
