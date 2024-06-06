import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:jayani_power/core/constants/gpt_prompt.dart';
import 'package:jayani_power/models/custom_exercises_model.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository_impl.dart';

part 'custom_exercise_event.dart';
part 'custom_exercise_state.dart';

class CustomExerciseBloc
    extends Bloc<CustomExerciseEvent, CustomExerciseState> {
  late CustomPlansRepository _customPlanRepository;
  CustomExerciseBloc() : super(CustomPlansInitial()) {
    _customPlanRepository = CustomPLansRepositoryImpl();
    //
    on<OnGenerateCustomExercisePlanEvent>(_onGenerateCustomExercisePlanEvent);
    // on<OnGenerateCustomDietPlanEvent>(_onGenerateCustomDietPlanEvent);
  }

  FutureOr<void> _onGenerateCustomExercisePlanEvent(
      OnGenerateCustomExercisePlanEvent event,
      Emitter<CustomExerciseState> emit) async {
    emit(CustomExerciseLoadingState());
    final prompt = GptPromtConstats.customExercise();
    final response =
        await _customPlanRepository.generateCustomExercises(prompt);
    if (response == null) {
      emit(CustomExerciseErrorState());
    } else {
      emit(CustomExerciseSuccessState(myRoutine: response));
    }
  }

  // FutureOr<void> _onGenerateCustomDietPlanEvent(
  //     OnGenerateCustomDietPlanEvent event,
  //     Emitter<CustomPlansState> emit) async {
  //   emit(CustomPlansDietLoadingState());
  //   final prompt = GptPromtConstats.customDiet();
  //   final response = await _customPlanRepository.generateCustomDiet(prompt);
  //   if (response == null) {
  //     emit(CustomPlansDietErrorState());
  //   } else {
  //     emit(CustomPlansDietSuccessState(myDiet: response));
  //   }
  // }
}
