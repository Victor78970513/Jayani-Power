import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayani_power/repositories/social_media/social_media_repository.dart';
import 'package:jayani_power/repositories/social_media/social_media_repository_impl.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  late SocialMediaRepository _socialMediaRepository;
  CreatePostBloc() : super(CreatePostInitial()) {
    //
    _socialMediaRepository = SocialMediaRepositoryImpl();
    //
    on<OnCreatePostEvent>(_onCreatePostEvent);
  }

  FutureOr<void> _onCreatePostEvent(
      OnCreatePostEvent event, Emitter<CreatePostState> emit) async {
    emit(CreatePostLoadingState());
    if (event.postLocalImage != null) {
      final postImage = await _socialMediaRepository
          .sendPostImageToFIrebase(event.postLocalImage!);
      final response = await _socialMediaRepository.createPost(
        content: event.content,
        createdAt: event.createdAt,
        postImage: postImage,
        profilePictureUrl: event.profilePictureUrl,
        title: event.title,
        userName: event.userName,
      );
      if (response) {
        emit(CreatePostSuccessState());
      } else {
        emit(CreatePostErrorState());
      }
    } else {
      final response = await _socialMediaRepository.createPost(
        content: event.content,
        createdAt: event.createdAt,
        postImage: "",
        profilePictureUrl: event.profilePictureUrl,
        title: event.title,
        userName: event.userName,
      );
      if (response) {
        emit(CreatePostSuccessState());
      } else {
        emit(CreatePostErrorState());
      }
    }
  }
}
