class WorkoutDay {
  final String day;
  final String group;
  final List<Exercise> exercises;
  final String cals;
  final String duration;

  WorkoutDay({
    required this.day,
    required this.group,
    required this.exercises,
    required this.cals,
    required this.duration,
  });
  Map<String, dynamic> toJson() {
    return {
      'exercises': exercises.map((exercise) => exercise.toMap()).toList(),
      'day': day,
      'cals': cals,
      'duration': duration,
      'group': group,
    };
  }

  factory WorkoutDay.fromJson(Map<String, dynamic> json) {
    return WorkoutDay(
      day: json['day'] ?? "sin dia",
      group: json['group'] ?? "sin grupo",
      exercises: (json['exercises'] as List)
          .map((exerciseData) => Exercise.fromJson(exerciseData))
          .toList(),
      cals: json['cals'] ?? "sin calories",
      duration: json['duration'] ?? "sin duracion",
    );
  }
}

class Exercise {
  final String sett;
  final String description;
  final String series;
  final String reps;

  Exercise({
    required this.sett,
    required this.description,
    required this.series,
    required this.reps,
  });

  Map<String, dynamic> toMap() {
    return {
      'set': sett,
      'description': description,
      'series': series,
      'reps': reps,
    };
  }

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      sett: json['set'] ?? "sin nombre",
      description: json['description'] ?? "sin descripcion",
      series: json['series'] ?? "sin series",
      reps: json['reps'] ?? "sin repes",
    );
  }
}
