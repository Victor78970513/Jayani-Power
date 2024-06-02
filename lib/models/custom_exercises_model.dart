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

// import 'dart:convert';

// class CustomExercisesModel {
//   final String id;
//   final List<Routine> rutina;

//   CustomExercisesModel({
//     required this.id,
//     required this.rutina,
//   });

//   factory CustomExercisesModel.fromJson(Map<String, dynamic> json) {
//     final rutinas = jsonDecode(json['choices']['message']['content']['rutina']);
//     print(rutinas[0]);
//     return CustomExercisesModel(
//       id: json["id"],
//       // rutina: json["choices"][0]["message"]["content"]["rutina"]
//       rutina: List<Routine>.from(rutinas.map((x) {
//         return Routine.fromJson(x);
//       })),
//     );
//   }
// }

// class Routine {
//   final String day;
//   final List<Exercise> exercises;

//   Routine({required this.day, required this.exercises});

//   factory Routine.fromJson(Map<String, dynamic> json) => Routine(
//         day: json["dia"],
//         exercises: List<Exercise>.from(
//             json["ejercicios"].map((exercise) => Exercise.fromJson(exercise))),
//       );
// }

// class Exercise {
//   final String nombre;
//   final String description;
//   final String tipo;
//   final String objetivo;
//   final String series;
//   final String repeticiones;
//   final String descanso;

//   Exercise({
//     required this.nombre,
//     required this.description,
//     required this.tipo,
//     required this.objetivo,
//     required this.series,
//     required this.repeticiones,
//     required this.descanso,
//   });
//   factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
//         nombre: json["nombre"],
//         description: json["descripcion"],
//         tipo: json["tipo"],
//         objetivo: json["objetivo"],
//         series: json["series"].toString(),
//         repeticiones: json["repeticiones"].toString(),
//         descanso: json["descanso"].toString(),
//       );
// }
