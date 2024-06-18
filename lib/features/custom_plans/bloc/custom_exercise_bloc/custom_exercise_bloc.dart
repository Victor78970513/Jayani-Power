import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:jayani_power/models/user_model.dart';
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
    on<OnCheckUserRoutine>(_onCheckUserRoutine);
    on<OnDeleteUserRoutine>(_onDeleteUserRoutine);
  }

  FutureOr<void> _onGenerateCustomExercisePlanEvent(
      OnGenerateCustomExercisePlanEvent event,
      Emitter<CustomExerciseState> emit) async {
    emit(CustomExerciseLoadingState());
    final response =
        await _customPlanRepository.generateCustomExercises(event.user);
    if (response == false) {
      emit(CustomExerciseErrorState());
    } else {
      emit(CustomExerciseSuccessState());
    }
  }

  FutureOr<void> _onCheckUserRoutine(
      OnCheckUserRoutine event, Emitter<CustomExerciseState> emit) async {
    emit(CustomExerciseLoadingState());
    final response = await _customPlanRepository.checkUserRoutine();
    if (response == false) {
      emit(CustomPlansInitial());
    } else {
      emit(CustomExerciseSuccessState());
    }
  }

  FutureOr<void> _onDeleteUserRoutine(
      OnDeleteUserRoutine event, Emitter<CustomExerciseState> emit) async {
    emit(CustomExerciseLoadingState());
    final response = await _customPlanRepository.deleteRoutine(event.routineId);
    if (response == false) {
      emit(CustomExerciseSuccessState());
    } else {
      emit(CustomPlansInitial());
    }
  }
}
