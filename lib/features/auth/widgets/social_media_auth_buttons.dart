import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jayani_power/core/cubit/terms_policy_cubit.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';

class SocialMediaAuthButtons extends StatelessWidget {
  const SocialMediaAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final termsAndPolicyCubit = context.watch<TermsPolicyCubit>().state;
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaButton(
          onTap: termsAndPolicyCubit
              ? () {
                  context.read<AuthBloc>().add(OnUserGoogleSignInEvent());
                }
              : () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            "DEBES ACEPTAR LOS TERMINOS DE PRIVACIDAD Y POLITICAS")),
                  );
                },
          title: "Continuar con Google",
          child: Image.asset("assets/icons/google_icon.png"),
        ),
        SocialMediaButton(
          onTap: termsAndPolicyCubit
              ? () {
                  context.read<AuthBloc>().add(OnUserFacebookSignInEvent());
                }
              : () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            "DEBES ACEPTAR LOS TERMINOS DE PRIVACIDAD Y POLITICAS")),
                  );
                },
          title: "Continuar con Meta",
          child:
              const Icon(FontAwesomeIcons.meta, color: Colors.blue, size: 40),
        ),
      ],
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final String title;
  const SocialMediaButton(
      {super.key,
      required this.child,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: child,
                ),
              ),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
