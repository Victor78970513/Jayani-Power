import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository_impl.dart';

part 'custom_diet_bloc_event.dart';
part 'custom_diet_bloc_state.dart';

class CustomDietBloc extends Bloc<CustomDietEvent, CustomDietState> {
  late CustomPlansRepository _customPlanRepository;
  CustomDietBloc() : super(CustomDietInitialState()) {
    _customPlanRepository = CustomPLansRepositoryImpl();
    //
    on<OnGetCustomDietEvent>(_onGetCustomDietEvent);
    on<OnCheckUserDiet>(_onCheckUserDiet);
  }

  FutureOr<void> _onGetCustomDietEvent(
      OnGetCustomDietEvent event, Emitter<CustomDietState> emit) async {
    emit(CustomDietLoadingState());
    final response = await _customPlanRepository.generateCustomDiet();
    if (response == false) {
      emit(CustomDietErrorState());
    } else {
      emit(CustomDietSuccessState());
    }
  }

  FutureOr<void> _onCheckUserDiet(
      OnCheckUserDiet event, Emitter<CustomDietState> emit) async {
    final response = await _customPlanRepository.checkUserDiet();
    if (response == false) {
      emit(CustomDietInitialState());
    } else {
      emit(CustomDietSuccessState());
    }
  }
}
