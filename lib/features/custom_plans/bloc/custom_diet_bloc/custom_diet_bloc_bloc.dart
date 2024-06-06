import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/core/constants/gpt_prompt.dart';
import 'package:jayani_power/models/custom_diet_model.dart';
import 'package:flutter/material.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository_impl.dart';

part 'custom_diet_bloc_event.dart';
part 'custom_diet_bloc_state.dart';

class CustomDietBloc extends Bloc<CustomDietEvent, CustomDietState> {
  late CustomPlansRepository _customPlanRepository;
  CustomDietBloc() : super(CustomDietBlocInitial()) {
    _customPlanRepository = CustomPLansRepositoryImpl();
    //
    on<OnGetCustomDietEvent>(_onGetCustomDietEvent);
  }

  FutureOr<void> _onGetCustomDietEvent(
      OnGetCustomDietEvent event, Emitter<CustomDietState> emit) async {
    emit(CustomDietLoadingState());
    final prompt = GptPromtConstats.customDiet();
    final response = await _customPlanRepository.generateCustomDiet(prompt);
    if (response == null) {
      emit(CustomPlansDietErrorState());
    } else {
      emit(CustomDietSuccessState(myDiet: response));
    }
  }
}
