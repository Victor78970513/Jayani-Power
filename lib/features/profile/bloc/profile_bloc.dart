import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayani_power/models/user_model.dart';
import 'package:jayani_power/repositories/user/user_repository.dart';
import 'package:jayani_power/repositories/user/user_repository_impl.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserModel? userModel;
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
      userModel = user;
      emit(ProfileSuccessState(user));
    } else {
      emit(ProfileErrorState());
    }
  }

  FutureOr<void> _onEditProfileEvent(
      OnEditProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    if (event.localImage != null) {
      final image = await _userRepository.updateProfileImage(event.localImage!);
      final response = await _userRepository.updateUserData(
        uid: event.uid,
        username: event.username,
        profilePictureUrl: image,
        weight: event.weight,
        height: event.height,
        physicalLimitatioons: event.physicalLimitations,
        foodRestrictions: event.foodRestrictions,
        goal: event.goal,
      );
      if (response) {
        add(OnGetProfileEvent(event.uid));
      } else {
        emit(ProfileErrorState());
      }
    } else {
      final response = await _userRepository.updateUserData(
        uid: event.uid,
        username: event.username,
        profilePictureUrl: event.profilePictureUrl,
        weight: event.weight,
        height: event.height,
        physicalLimitatioons: event.physicalLimitations,
        foodRestrictions: event.foodRestrictions,
        goal: event.goal,
      );
      if (response) {
        add(OnGetProfileEvent(event.uid));
      } else {
        emit(ProfileErrorState());
      }
    }
  }
}
