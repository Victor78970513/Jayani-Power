import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:jayani_power/models/user_model.dart';
import 'package:jayani_power/repositories/user/user_repository.dart';
import 'package:jayani_power/repositories/user/user_repository_impl.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late UserRepository _userRepository;
  ProfileBloc() : super(ProfileInitial()) {
    _userRepository = UserRepositoryImpl();

    //
    on<OnGetProfileEvent>(_onGetProfileEvent);
    on<OnEditProfileEvent>(_onEditProfileEvent);
  }

  FutureOr<void> _onGetProfileEvent(
      OnGetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    final user = await _userRepository.getUserData(event.userID);
    if (user != null) {
      emit(ProfileSuccessState(user));
    } else {
      emit(ProfileErrorState());
    }
  }

  FutureOr<void> _onEditProfileEvent(
      OnEditProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    final response = await _userRepository.updateUser(
      // uid: event.uid,
      uid: "RcByT422zQhADRACv1SGOQFKfuj2",
      email: event.email,
      username: event.username,
      profilePictureUrl: event.profilePictureUrl,
      publicProfile: event.publicProfile,
      weight: event.weight,
      height: event.height,
      age: event.age,
    );
    if (response) {
      add(OnGetProfileEvent(event.uid));
    } else {
      emit(ProfileErrorState());
    }
  }
}
