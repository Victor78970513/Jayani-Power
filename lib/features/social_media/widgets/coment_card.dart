import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final QueryDocumentSnapshot comment;

  CommentCard({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment['content'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text('Likes: ${comment['likes']}'),
          ],
        ),
      ),
    );
  }
}
