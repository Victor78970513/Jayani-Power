import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';
import 'package:jayani_power/features/profile/pages/edit_profile_page.dart';
import 'package:jayani_power/features/profile/widgets/user_macros_goals.dart';
import 'package:jayani_power/features/profile/widgets/user_personal_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    final userID = context.read<AuthBloc>().state as AuthSuccessState;
    context.read<ProfileBloc>().add(OnGetProfileEvent(userID.uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff252935),
        title: const Text("PERFIL", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const EditProfilePage(),
                    ),
                  );
                },
                icon: const Icon(FontAwesomeIcons.penToSquare,
                    color: Colors.white)),
          )
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            UserPersonalData(),
            SizedBox(height: 30),
            UserMacrosGoals(),
          ],
        ),
      ),
    );
  }
}
