import 'package:jayani_power/models/custom_diet_model.dart';
import 'package:jayani_power/models/custom_exercises_model.dart';

abstract class CustomPlansRepository {
  Future<List<CustomExercisesModel>?> generateCustomExercises(String prompt);

  Future<List<CustomDietModel>?> generateCustomDiet(String prompt);
}
