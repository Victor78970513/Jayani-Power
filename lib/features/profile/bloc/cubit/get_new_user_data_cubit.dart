import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:jayani_power/repositories/user/user_repository.dart';
import 'package:jayani_power/repositories/user/user_repository_impl.dart';

part 'get_new_user_data_state.dart';

class GetNewUserDataCubit extends Cubit<GetNewUserDataState> {
  late UserRepository _userRepository;
  GetNewUserDataCubit() : super(GetNewUserDataInitial()) {
    _userRepository = UserRepositoryImpl();
  }

  Future<void> setData({
    required String uid,
    required int age,
    required double weight,
    required double height,
    required String gender,
    required String physicalLimitations,
    required String foodRestrictions,
    required String goal,
  }) async {
    emit(GetNewUserDataLoading());
    final response = await _userRepository.updateUserDataForFirstTime(
      uid: uid,
      age: age,
      weight: weight,
      height: height,
      gender: gender,
      physicalLimitations: physicalLimitations,
      foodRestrictions: foodRestrictions,
      goal: goal,
    );

    if (response) {
      emit(GetNewUserDataSucess());
    } else {
      emit(GetNewUserDataError());
    }
  }
}
