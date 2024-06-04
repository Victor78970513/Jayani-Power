class CustomExercisesModel {
  final String day;
  final List<Exercise> exercises;

  CustomExercisesModel({
    required this.day,
    required this.exercises,
  });
}

class Exercise {
  final String name;
  final String description;
  final String type;
  final String objective;
  final String series;
  final String repes;
  final String descanso;

  Exercise(
      {required this.name,
      required this.description,
      required this.type,
      required this.objective,
      required this.series,
      required this.repes,
      required this.descanso});
}
