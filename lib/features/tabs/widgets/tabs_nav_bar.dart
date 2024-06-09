import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jayani_power/features/tabs/cubit/navbar_cubit.dart';

class TabsNavBar extends StatelessWidget {
  const TabsNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff252935),
      child: const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarItem(icon: Icons.home, index: 0),
            NavBarItem(icon: FontAwesomeIcons.dumbbell, index: 1),
            NavBarItem(icon: Icons.explore, index: 2),
            NavBarItem(icon: Icons.person, index: 3)
          ],
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final int index;
  const NavBarItem({
    super.key,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final navBarCubit = context.watch<NavbarCubit>().state;
    return IconButton(
      onPressed: () {
        context.read<NavbarCubit>().changeTab(index);
      },
      icon: Icon(
        icon,
        size: 30,
        color: navBarCubit == index ? const Color(0xffFF004D) : Colors.white,
      ),
    );
  }
}
