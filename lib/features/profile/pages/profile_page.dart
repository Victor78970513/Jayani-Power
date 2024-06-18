import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/core/utils/terms_privacy.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';
import 'package:jayani_power/features/profile/pages/edit_profile_page.dart';
import 'package:jayani_power/features/profile/pages/get_premiun_page.dart';
import 'package:jayani_power/features/profile/widgets/profile_option.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFF004D),
          title: const Text(
            "PERFIL",
            style: TextStyle(
              color: Colors.white,
              // fontStyle: FontStyle.italic,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const UserPersonalData(),
              const SizedBox(height: 50),
              ProfileOption(
                title: "Actualizar Informacion",
                icon: Icons.person_add_alt_1_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const EditProfilePage(),
                    ),
                  );
                },
              ),
              ProfileOption(
                title: "Cambiar a Premium",
                icon: Icons.credit_card,
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const GetPremiumPage()));
                },
              ),
              ProfileOption(
                title: "Terminos y Cond.",
                onPressed: () {
                  termsPrivacyModal(context: context);
                },
                icon: Icons.info_outline_rounded,
              ),
              ProfileOption(
                title: "Cerrar Sesion",
                onPressed: () async {
                  context.read<AuthBloc>().add(OnUserSignOut());
                },
                icon: Icons.logout_outlined,
              )
            ],
          ),
        ),
      ),
    );
  }
}
