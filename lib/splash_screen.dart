import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/auth/pages/sign_in_page.dart';
import 'package:jayani_power/features/tabs/pages/tabs_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationJayaniLogoIn;
  late Future<void> _splashFuture;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _animationJayaniLogoIn =
        Tween(begin: 5.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    ));
    _animationController.forward();
    _splashFuture = Future.delayed(const Duration(seconds: 4));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _splashFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: AnimatedBuilder(
                    animation: _animationJayaniLogoIn,
                    builder: (context, snapshot) {
                      return Transform.scale(
                        scale: _animationJayaniLogoIn.value,
                        child: SvgPicture.asset("assets/icons/jayani_logo.svg"),
                      );
                    }),
              );
            }
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccessState) {
                  return FadeIn(child: const TabsPage());
                }
                return FadeIn(child: const SignInPage());
              },
            );
          }),
    );
  }
}
