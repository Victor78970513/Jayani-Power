import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/core/cubit/terms_policy_cubit.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';

class SocialMediaAuthButtons extends StatelessWidget {
  const SocialMediaAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final termsAndPolicyCubit = context.watch<TermsPolicyCubit>().state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
          child: Image.asset("assets/icons/google_icon.png"),
        ),
        const SizedBox(width: 30),
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
          child: const Icon(Icons.facebook, color: Colors.blue, size: 40),
        ),
      ],
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const SocialMediaButton(
      {super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.grey[600]!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: child),
      ),
    );
  }
}
