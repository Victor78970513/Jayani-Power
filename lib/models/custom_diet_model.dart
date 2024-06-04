class CustomDietModel {
  final String day;
  final List<Plate> plates;

  CustomDietModel({required this.day, required this.plates});
}

class Plate {
  final String meal;
  final String description;
  final String calories;
  final String proteins;

  Plate(
      {required this.meal,
      required this.description,
      required this.calories,
      required this.proteins});
}
