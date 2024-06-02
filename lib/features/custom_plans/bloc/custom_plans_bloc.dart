import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:jayani_power/core/constants/gpt_prompt.dart';
import 'package:jayani_power/models/custom_exercises_model.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository_impl.dart';

part 'custom_plans_event.dart';
part 'custom_plans_state.dart';

class CustomPlansBloc extends Bloc<CustomPlansEvent, CustomPlansState> {
  late CustomPlansRepository _customPlanRepository;
  CustomPlansBloc() : super(CustomPlansInitial()) {
    _customPlanRepository = CustomPLansRepositoryImpl();
    //
    on<OnGenerateCustomExercisePlanEvent>(_onGenerateCustomExercisePlanEvent);
  }

  FutureOr<void> _onGenerateCustomExercisePlanEvent(
      OnGenerateCustomExercisePlanEvent event,
      Emitter<CustomPlansState> emit) async {
    emit(CustomPlansLoadingState());
    final prompt = GptPromtConstats.customExercise();
    final response =
        await _customPlanRepository.generateCustomExercises(prompt);
    if (response == null) {
      emit(CustomPlansErrorState());
    } else {
      emit(CustomPlansSuccessState(myRoutine: response));
    }
  }
}
