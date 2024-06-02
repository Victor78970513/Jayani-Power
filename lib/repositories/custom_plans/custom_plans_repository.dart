import 'package:jayani_power/models/custom_exercises_model.dart';

abstract class CustomPlansRepository {
  Future<List<CustomExercisesModel>?> generateCustomExercises(String prompt);
}
