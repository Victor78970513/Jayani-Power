import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_diet_bloc/custom_diet_bloc_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_exercise_bloc/custom_exercise_bloc.dart';
import 'package:jayani_power/features/custom_plans/pages/diets_page.dart';
import 'package:jayani_power/features/custom_plans/pages/exercise_page.dart';
import 'package:jayani_power/features/custom_plans/widgets/week_widget.dart';

class CustomoPlansPage extends StatefulWidget {
  const CustomoPlansPage({super.key});

  @override
  State<CustomoPlansPage> createState() => _CustomoPlansPageState();
}

class _CustomoPlansPageState extends State<CustomoPlansPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    context.read<CustomExerciseBloc>().add(OnCheckUserRoutine());
    context.read<CustomDietBloc>().add(OnCheckUserDiet());
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            color: const Color(0xffFF004D),
            child: TabBar(
              controller: tabController,
              dividerColor: const Color(0xffCEB2C1),
              labelColor: Colors.white,
              indicator: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    // color: Color(0xffFF004D),
                    color: Colors.white,
                    width: 5,
                  ),
                ),
              ),
              dividerHeight: 3,
              overlayColor: MaterialStateProperty.resolveWith(
                  (states) => const Color(0xffFF004D)),
              unselectedLabelColor: const Color(0xffCEB2C1),
              tabs: const [
                Tab(
                  child: Text(
                    "Dietas",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "Rutinas",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          const WeekListWidget(),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                DietsPage(),
                ExercisePage(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
