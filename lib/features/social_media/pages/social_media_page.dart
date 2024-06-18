// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';
import 'package:jayani_power/features/social_media/pages/create_post_page.dart';
import 'package:jayani_power/features/social_media/widgets/post_card.dart';
import 'package:jayani_power/models/post_firebase_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SocialMedaPage extends StatefulWidget {
  const SocialMedaPage({super.key});

  @override
  State<SocialMedaPage> createState() => _SocialMedaPageState();
}

class _SocialMedaPageState extends State<SocialMedaPage> {
  @override
  void initState() {
    final userID = context.read<AuthBloc>().state as AuthSuccessState;
    context.read<ProfileBloc>().add(OnGetProfileEvent(userID.uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.watch<ProfileBloc>();
    final userId = Preferences().userUUID;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'COMUNIDAD',
            style: TextStyle(
              color: Colors.white,
              // fontStyle: FontStyle.italic,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          // backgroundColor: const Color(0xff252935),
          backgroundColor: const Color(0xffFF004D),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  createPost(context: context, user: profileBloc.userModel);
                },
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
              const SizedBox(height: 20),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('publicaciones')
                      .orderBy("createdAt", descending: true)
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
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: ListView.builder(
                          itemCount: postfirebaseList.length,
                          itemBuilder: (context, index) {
                            final postCard = postfirebaseList[index];
                            final isLiked = postCard.likedBy.contains(userId);
                            return PostCard(post: postCard, isLiked: isLiked);
                          }),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
