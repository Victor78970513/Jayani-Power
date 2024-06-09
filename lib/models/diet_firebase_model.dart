import 'dart:convert';

class MealPlanDay {
  final String day;
  final List<Meal> meals;

  MealPlanDay({
    required this.day,
    required this.meals,
  });

  factory MealPlanDay.fromJson(Map<String, dynamic> json) => MealPlanDay(
        day: json["day"],
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  List<dynamic> toArray() => [
        {"day": day},
        {"meals": List<dynamic>.from(meals.map((x) => x.toJson()))},
      ];

  Map<String, dynamic> toJson() => {
        "day": day,
        "meals": meals.map((e) => e.toJson()),
      };
}

class Meal {
  final String mealTime;
  final String name;
  final String description;
  final List<Ingredient> ingredients;
  final Macros macros;

  Meal({
    required this.mealTime,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.macros,
  });

  factory Meal.fromRawJson(String str) => Meal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        mealTime: json["meal_time"],
        name: json["name"],
        description: json["description"],
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        macros: Macros.fromJson(json["macros"]),
      );

  Map<String, dynamic> toJson() => {
        "meal_time": mealTime,
        "name": name,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "macros": macros.toJson(),
      };
}

class Ingredient {
  final String name;
  final String quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });

  factory Ingredient.fromRawJson(String str) =>
      Ingredient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
      };
}

class Macros {
  final String proteins;
  final String calories;
  final List<String> vitamins;
  final List<String> minerals;

  Macros({
    required this.proteins,
    required this.calories,
    required this.vitamins,
    required this.minerals,
  });

  factory Macros.fromRawJson(String str) => Macros.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Macros.fromJson(Map<String, dynamic> json) => Macros(
        proteins: json["proteins"],
        calories: json["calories"],
        vitamins: List<String>.from(json["vitamins"].map((x) => x)),
        minerals: List<String>.from(json["minerals"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "proteins": proteins,
        "calories": calories,
        "vitamins": List<dynamic>.from(vitamins.map((x) => x)),
        "minerals": List<dynamic>.from(minerals.map((x) => x)),
      };
}
