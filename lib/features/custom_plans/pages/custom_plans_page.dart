import 'package:flutter/material.dart';
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
          TabBar(controller: tabController, tabs: const [
            Tab(text: "DIetas"),
            Tab(text: "Rutinas"),
          ]),
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
