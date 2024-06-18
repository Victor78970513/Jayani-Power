import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jayani_power/models/diet_firebase_model.dart';

class DietCard extends StatelessWidget {
  final VoidCallback onPressed;
  final Meal meal;
  final String docId;
  const DietCard({
    super.key,
    required this.meal,
    required this.docId,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffFF004D),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    meal.mealTime,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              if (meal.mealTime == "Desayuno")
                IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.delete,
                      color: Color(0xffFF004D),
                      size: 40,
                    )),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff43444A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.8,
                        child: Text(
                          "${meal.name} ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        meal.mealTime == "Desayuno"
                            ? FontAwesomeIcons.breadSlice
                            : meal.mealTime == "Almuerzo"
                                ? FontAwesomeIcons.bowlRice
                                : FontAwesomeIcons.utensils,
                        color: const Color(0xffFF004D),
                      )
                    ],
                  ),
                  const Divider(color: Color(0xffFF004D)),
                  Text(meal.description,
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 5),
                  const Divider(color: Color(0xffFF004D)),
                  Row(
                    children: [
                      const Text(
                        "Ingredientes: ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 15),
                      Icon(
                        meal.mealTime == "Desayuno"
                            ? FontAwesomeIcons.appleWhole
                            : meal.mealTime == "Almuerzo"
                                ? FontAwesomeIcons.drumstickBite
                                : FontAwesomeIcons.bottleWater,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(meal.ingredients.length, (index) {
                    final ingredient = meal.ingredients[index];
                    return Text(
                      "   •   ${ingredient.name}  -  ${ingredient.quantity}",
                      style: const TextStyle(color: Colors.white),
                    );
                  }),
                  const Divider(color: Color(0xffFF004D)),
                  const Text(
                    "Macronutrientes:",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(meal.macros.vitamins.length, (index) {
                          final vitamin = meal.macros.vitamins[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffCEB2C1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Vitamina $vitamin",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(meal.macros.minerals.length, (index) {
                          final mineral = meal.macros.minerals[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffCEB2C1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Mineral: $mineral",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffCEB2C1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 15),
                              child: Text(
                                "Calorias: ${meal.macros.calories}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffCEB2C1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              child: Text(
                                "Proteinas: ${meal.macros.proteins}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
