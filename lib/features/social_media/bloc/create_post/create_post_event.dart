part of 'create_post_bloc.dart';

@immutable
sealed class CreatePostEvent {}

final class OnCreatePostEvent extends CreatePostEvent {
  final String content;
  final DateTime createdAt;
  final XFile? postLocalImage;
  final String profilePictureUrl;
  final String title;
  final String userName;

  OnCreatePostEvent({
    required this.content,
    required this.createdAt,
    this.postLocalImage,
    required this.profilePictureUrl,
    required this.title,
    required this.userName,
  });
}
