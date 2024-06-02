import 'package:flutter/material.dart';

class UserMacrosGoals extends StatelessWidget {
  const UserMacrosGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "METAS DE MACRONUTRIENTES",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              MacroGoalItem(
                macros: "Calorias",
                cantMacros: 2500,
                imagePath: "assets/macros_images/calorias.webp",
              ),
              MacroGoalItem(
                macros: "Proteinas",
                cantMacros: 130,
                imagePath: "assets/macros_images/proteinas.jpg",
              ),
              MacroGoalItem(
                macros: "Carbohidratos",
                cantMacros: 250,
                imagePath: "assets/macros_images/carbohidratos.webp",
              ),
              MacroGoalItem(
                macros: "Grasas",
                cantMacros: 100,
                imagePath: "assets/macros_images/grasas.jpeg",
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MacroGoalItem extends StatelessWidget {
  final String macros;
  final int cantMacros;
  final String imagePath;
  const MacroGoalItem({
    super.key,
    required this.macros,
    required this.cantMacros,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Text(macros,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          Text("$cantMacros",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const Text("Gramos por dia",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
