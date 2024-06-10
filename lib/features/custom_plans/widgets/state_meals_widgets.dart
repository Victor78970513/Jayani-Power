import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';
import 'package:jayani_power/features/custom_plans/bloc/week/week_cubit.dart';
import 'package:jayani_power/features/custom_plans/widgets/diet_card.dart';
import 'package:jayani_power/models/diet_firebase_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SuccessCustomDietWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const SuccessCustomDietWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final weekCubit = context.watch<WeekCubit>().state;
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection("dietas-personalizadas")
          .where("uid", isEqualTo: Preferences().userUUID)
          .where("is_available", isEqualTo: true)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error fetching data'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hubo un error buscando tu dieta",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: onPressed,
                  child: const Text("BUSCAR SI TIENES ALGUNA DIETA"),
                )
              ],
            ),
          );
        }
        final documentSnapshot = snapshot.data!.docs.first;
        final Map<String, dynamic> data = documentSnapshot.data();
        final List<MealPlanDay> mealPlan = [];
        data.forEach((key, value) {
          if (key.startsWith('day_')) {
            mealPlan.add(MealPlanDay.fromJson(value));
          }
        });

        return FadeIn(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: mealPlan[weekCubit].meals.length + 1,
                    itemBuilder: (context, index) {
                      if (index == mealPlan[weekCubit].meals.length) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Powered by ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(width: 5),
                              SvgPicture.asset(
                                "assets/icons/jayani_logo.svg",
                                width: 20,
                              ),
                              const SizedBox(width: 5),
                              Image.asset(
                                "assets/icons/gpt_logo.png",
                                width: 40,
                              ),
                            ],
                          ),
                        );
                      } else {
                        final meal = mealPlan[weekCubit].meals[index];
                        return DietCard(meal: meal);
                      }
                    }),
              ),
              const SizedBox(height: 80),
            ],
          ),
        );
      },
    );
  }
}

class LoadingCustomDietWidget extends StatelessWidget {
  const LoadingCustomDietWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "GENERANDO DIETA",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 15),
          LoadingAnimationWidget.inkDrop(color: Colors.white, size: 50)
        ],
      ),
    );
  }
}

class ErrorCustomDIetWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const ErrorCustomDIetWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "OCURRIO UN ERROR INTENTALO DE NUEVO",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text("GENERAR RUTINA PERSONALIZADA"),
        )
      ],
    );
  }
}

class InitialCustomDietWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const InitialCustomDietWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "POR EL MOMENTO NO TIENES UNA DIETA",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text("GENERAR DIETA PERSONALIZADA"),
        )
      ],
    );
  }
}
