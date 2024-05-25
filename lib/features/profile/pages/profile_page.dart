import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jayani_power/features/profile/widgets/user_macros_goals.dart';
import 'package:jayani_power/features/profile/widgets/user_personal_data..dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFILE"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(FontAwesomeIcons.penToSquare),
          )
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            CircleAvatar(radius: 60),
            SizedBox(height: 15),
            Text("USERNAME"),
            Text("MEMBER TYPE"),
            SizedBox(height: 30),
            UserPersonalData(),
            SizedBox(height: 30),
            UserMacrosGoals(),
          ],
        ),
      ),
    );
  }
}
