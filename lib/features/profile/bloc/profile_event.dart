part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class OnGetProfileEvent extends ProfileEvent {
  final String userID;

  OnGetProfileEvent(this.userID);
}

final class OnEditProfileEvent extends ProfileEvent {
  final String uid;
  final String email;
  final String username;
  final String profilePictureUrl;
  final bool publicProfile;
  final double weight;
  final double height;
  final int age;

  OnEditProfileEvent(
      {required this.uid,
      required this.email,
      required this.username,
      required this.profilePictureUrl,
      required this.publicProfile,
      required this.weight,
      required this.height,
      required this.age});
}
