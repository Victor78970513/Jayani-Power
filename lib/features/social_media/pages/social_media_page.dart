// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jayani_power/features/social_media/widgets/post_card.dart';
import 'package:jayani_power/models/post_firebase_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SocialMedaPage extends StatelessWidget {
  const SocialMedaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PUBLICACIONES',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xff252935),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.edit,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('publicaciones')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: LoadingAnimationWidget.inkDrop(
                            color: Colors.white, size: 50));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text('No hay publicaciones disponibles.'));
                  }
                  List<PostFirebaseModel> postfirebaseList = [];
                  for (var doc in snapshot.data!.docs) {
                    final data = doc.data();
                    postfirebaseList
                        .add(PostFirebaseModel.fromJson(data, doc.id));
                  }
                  return ListView.builder(
                      itemCount: postfirebaseList.length,
                      itemBuilder: (context, index) {
                        final postCard = postfirebaseList[index];
                        return PostCard(post: postCard);
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
