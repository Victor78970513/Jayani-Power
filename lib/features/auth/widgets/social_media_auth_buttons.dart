import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';

class SocialMediaAuthButtons extends StatelessWidget {
  const SocialMediaAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaButton(
          child: Image.asset("assets/icons/google_icon.png"),
          onTap: () {
            context.read<AuthBloc>().add(OnUserGoogleSignInEvent());
          },
        ),
        const SizedBox(width: 20),
        SocialMediaButton(
          child: const Icon(Icons.facebook, color: Colors.blue, size: 40),
          onTap: () {
            context.read<AuthBloc>().add(OnUserFacebookSignInEvent());
          },
        ),
        const SizedBox(width: 20),
        SocialMediaButton(
          child:
              const Icon(Icons.apple_outlined, color: Colors.white, size: 40),
          onTap: () {},
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
