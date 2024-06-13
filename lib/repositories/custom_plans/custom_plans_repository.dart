abstract class CustomPlansRepository {
  Future<bool> generateCustomExercises();

  Future<bool> generateCustomDiet();

  Future<bool> checkUserRoutine();

  Future<bool> checkUserDiet();

  Future<bool> deleteRoutine(String routineId);
}
