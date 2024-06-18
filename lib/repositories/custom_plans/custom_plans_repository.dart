import 'package:jayani_power/models/user_model.dart';

abstract class CustomPlansRepository {
  Future<bool> generateCustomExercises(UserModel user);

  Future<bool> generateCustomDiet(UserModel user);

  Future<bool> checkUserRoutine();

  Future<bool> checkUserDiet();

  Future<bool> deleteRoutine(String routineId);

  Future<bool> deleteDiet(String dietId);
}
