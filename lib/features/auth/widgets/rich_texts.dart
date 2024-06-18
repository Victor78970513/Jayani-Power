import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/core/cubit/terms_policy_cubit.dart';
import 'package:jayani_power/core/utils/terms_privacy.dart';
import 'package:jayani_power/features/auth/pages/sign_up_page.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsPolicyCubit, bool>(
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (!states.contains(MaterialState.selected)) {
                  return Colors.transparent;
                }
                return const Color(0xffFF004D);
              }),
              value: state,
              onChanged: (value) {
                if (value == true) {
                  context.read<TermsPolicyCubit>().aceptTermsAndPolicy();
                } else {
                  context.read<TermsPolicyCubit>().declineTermsAndPolicy();
                }
              },
            ),
            GestureDetector(
              onTap: () {
                termsPrivacyModal(context: context);
              },
              child: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: const TextSpan(
                    text: "Acepto los ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "Terminos ",
                        style: TextStyle(
                            color: Color(0xffFF004D),
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "y ",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "Politicas de privacidad",
                        style: TextStyle(
                            color: Color(0xffFF004D),
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SignInRIchText extends StatelessWidget {
  const SignInRIchText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Aun no tienes una cuenta? ",
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Crear cuenta",
            style: const TextStyle(color: Color(0xffFF004D)),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const SignUpPage()));
              },
          )
        ],
      ),
    );
  }
}

class SignUpRIchText extends StatelessWidget {
  const SignUpRIchText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Ya tienes una cuenta? ",
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Iniciar Sesion",
            style: const TextStyle(color: Color(0xffFF004D)),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          )
        ],
      ),
    );
  }
}
