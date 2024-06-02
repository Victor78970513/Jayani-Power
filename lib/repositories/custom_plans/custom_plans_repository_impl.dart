import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jayani_power/models/custom_exercises_model.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository.dart';
import 'package:dio/dio.dart';

class CustomPLansRepositoryImpl extends CustomPlansRepository {
  Dio dio = Dio();
  @override
  Future<List<CustomExercisesModel>?> generateCustomExercises(
      String prompt) async {
    try {
      final response =
          await dio.post("https://api.openai.com/v1/chat/completions",
              options: Options(headers: {
                'Authorization': 'Bearer ${dotenv.env['GPT_TOKEN']}',
              }),
              data: {
            "model": "gpt-4",
            "messages": [
              {
                "role": "system",
                "content": prompt,
              }
            ]
          });
      List<Exercise> ejercicios = [];
      final List<CustomExercisesModel> customExercisesModel = [];
      final List<dynamic> choices = response.data['choices'];
      for (final choice in choices) {
        final messageContent = jsonDecode(choice['message']['content']);
        for (final rutina in messageContent['rutina']) {
          for (final exercise in rutina['ejercicios']) {
            final ejercicio = Exercise(
              name: exercise["nombre"] ?? "",
              description: exercise["descripcion"] ?? "",
              type: exercise['tipo'] ?? "",
              objective: exercise['objetivo'] ?? "",
              series: exercise['series'] ?? "sin series",
              repes: exercise['repeticiones'] ?? "sin series",
              descanso: exercise['descanso'] ?? "sin series",
            );
            ejercicios.add(ejercicio);
          }
          final custom =
              CustomExercisesModel(day: rutina['dia'], exercises: ejercicios);
          customExercisesModel.add(custom);
          ejercicios = [];
        }
      }
      return customExercisesModel;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
