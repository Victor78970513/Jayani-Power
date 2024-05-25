import 'package:flutter/material.dart';

class UserMacrosGoals extends StatelessWidget {
  const UserMacrosGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("MACRONUTRIENTS GOALS"),
          ),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const MacroGoalItem();
                }),
          )
        ],
      ),
    );
  }
}

class MacroGoalItem extends StatelessWidget {
  const MacroGoalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Colors.green,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 150,
              color: Colors.red,
            ),
            Text("Protein"),
            Text("130"),
            Text("Per Day"),
          ],
        ),
      ),
    );
  }
}
