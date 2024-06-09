import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/custom_plans/pages/custom_plans_page.dart';
import 'package:jayani_power/features/home/pages/home_page.dart';
import 'package:jayani_power/features/profile/pages/profile_page.dart';
import 'package:jayani_power/features/social_media/pages/social_media_page.dart';
import 'package:jayani_power/features/tabs/cubit/navbar_cubit.dart';
import 'package:jayani_power/features/tabs/widgets/tabs_nav_bar.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              IndexedStack(
                index: state,
                children: const [
                  HomePage(),
                  CustomoPlansPage(),
                  SocialMedaPage(),
                  ProfilePage(),
                ],
              ),
              const Align(
                  alignment: Alignment.bottomCenter, child: TabsNavBar()),
            ],
          ),
        );
      },
    );
  }
}
