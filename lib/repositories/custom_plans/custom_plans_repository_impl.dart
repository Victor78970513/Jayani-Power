import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jayani_power/core/constants/gpt_prompt.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';
import 'package:jayani_power/models/diet_firebase_model.dart';
import 'package:jayani_power/models/exercise_firebase_model.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository.dart';
import 'package:dio/dio.dart';

class CustomPLansRepositoryImpl extends CustomPlansRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Dio dio = Dio();
  @override
  Future<bool> generateCustomExercises() async {
    final uid = Preferences().userUUID;
    final CollectionReference collection =
        firestore.collection("rutinas-personalizadas");
    try {
      final response = await gptApiCall(GptPromtConstats.customExercise());
      final jsonParser =
          json.decode(response.data["choices"][0]["message"]["content"]);
      List<WorkoutDay> workOutPlan = (jsonParser as List)
          .map((data) => WorkoutDay.fromJson(data))
          .toList();
      log(response.data.toString());
      log("EMPIEZA LA CREACION EN FIREBASE");
      final created = await collection.add({
        "is_available": true,
        "uid": uid,
        "day_1": workOutPlan[0].toJson(),
        "day_2": workOutPlan[1].toJson(),
        "day_3": workOutPlan[2].toJson(),
        "day_4": workOutPlan[3].toJson(),
        "day_5": workOutPlan[4].toJson(),
      });
      return created.id.isEmpty ? false : true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> generateCustomDiet() async {
    final uid = Preferences().userUUID;
    final CollectionReference collection =
        firestore.collection("dietas-personalizadas");
    try {
      final response = await gptApiCall(GptPromtConstats.customDiet());
      final jsonParser =
          json.decode(response.data["choices"][0]["message"]["content"]);
      List<MealPlanDay> mealPlan = (jsonParser as List)
          .map((data) => MealPlanDay.fromJson(data))
          .toList();
      log("EMPIEZA LA CREACION EN FIREBASE");
      final created = await collection.add({
        "is_available": true,
        "uid": uid,
        "day_1": mealPlan[0].toJson(),
        "day_2": mealPlan[1].toJson(),
        "day_3": mealPlan[2].toJson(),
        "day_4": mealPlan[3].toJson(),
        "day_5": mealPlan[4].toJson(),
      });
      return created.id.isEmpty ? false : true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> checkUserRoutine() async {
    final CollectionReference collection =
        firestore.collection("rutinas-personalizadas");
    try {
      final doc = await getFirebaseDoc(collection);
      if (doc.docs.isEmpty) {
        return false;
      }
      return true;
    } catch (e) {
      log("CHECK ROUTINE: $e");
      return false;
    }
  }

  @override
  Future<bool> checkUserDiet() async {
    final CollectionReference collection =
        firestore.collection("dietas-personalizadas");
    try {
      final doc = await getFirebaseDoc(collection);
      if (doc.docs.isEmpty) {
        return false;
      }
      return true;
    } catch (e) {
      log("CHECK DIET: $e");
      return false;
    }
  }

  Future<QuerySnapshot> getFirebaseDoc(CollectionReference collection) async {
    return await collection
        .where("uid", isEqualTo: Preferences().userUUID)
        .where("is_available", isEqualTo: true)
        .get();
  }

  Future<Response<dynamic>> gptApiCall(prompt) async {
    return await dio.post("https://api.openai.com/v1/chat/completions",
        options: Options(headers: {
          'Authorization': 'Bearer ${dotenv.env['GPT_TOKEN']}',
        }),
        data: {
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content": prompt,
            }
          ]
        });
  }

  @override
  Future<bool> deleteRoutine(String routineId) async {
    final CollectionReference collection =
        firestore.collection("rutinas-personalizadas");
    try {
      await collection.doc(routineId).update({
        "is_available": false,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
